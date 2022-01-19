from google.cloud import bigquery
from google.cloud import storage


import numpy as np
import pandas as pd
from pandas.api.types import is_numeric_dtype

from xgboost import XGBClassifier
import xgboost as xgb
# Import train_test_split function
from sklearn.model_selection import train_test_split
# Import scikit-learn metrics module for accuracy calculation
from sklearn import metrics
from sklearn.metrics import mean_absolute_error
from sklearn.metrics import mean_absolute_percentage_error

import time
import glob
import os
#import pickle


# Python diff() function
def difference(data, feature):
    # assume data is already sorted
    return data[feature] - data['Total_Sales_dollars'].shift(1)


def difference_in_percentage(data, feature):
    # assume data is already sorted
    lag_by_1 = data[feature].shift(1)
    return (data[feature] - lag_by_1)/(lag_by_1)


t0 = time.time()
Train_Table = pd.read_csv(
    '/tmp/exported_iowa_liquor_aggr_sales-000000000000.csv', sep='|', header=0)
t_batch = time.time() - t0
print("####  computation time : " + str(t_batch) + "s  ####")


Train_Table['Week_date'] = pd.to_datetime(
    Train_Table['Week_date'], errors="coerce")

# Python shift() function
Train_Table['Total_Sales_Dollars_lag1'] = Train_Table['Total_Sales_dollars'].shift(
    1)

# Python rolling().mean() function
Train_Table['Total_Sales_Dollar_MA2_lag1'] = Train_Table['Total_Sales_dollars'].rolling(
    2).mean().shift(1).reset_index(0, drop=True)


Train_Table['Total_Sales_Dollar_Difference_lag1'] = difference(
    Train_Table, 'Total_Sales_dollars').shift(1)

Train_Table['Total_Sales_Dollar_Difference_in_Percent_Lag1'] = difference_in_percentage(
    Train_Table, 'Total_Sales_dollars').shift(1)

Train_Table['week'] = Train_Table['Week_date'].dt.week
Train_Table['month'] = Train_Table['Week_date'].dt.month
Train_Table['year'] = Train_Table['Week_date'].dt.year

Train_Table = Train_Table[['Week_date', 'Total_Sales_dollars', 'Total_Sales_Dollars_lag1', 'Total_Sales_Dollar_MA2_lag1',
                           'Total_Sales_Dollar_Difference_lag1', 'Total_Sales_Dollar_Difference_in_Percent_Lag1', 'month', 'week']]
Train_Table = Train_Table.fillna(0)
#Table = Train_Table.set_index('Week_date')

training_data, testing_data = train_test_split(Train_Table, test_size=0.2)
print(f"No. of training examples: {training_data.shape[0]}")
print(f"No. of testing examples: {testing_data.shape[0]}")

x_train, y_train = training_data.drop(
    ["Week_date", "Total_Sales_dollars"], axis=1), training_data['Total_Sales_dollars']
x_test, y_test = testing_data.drop(
    ["Week_date", "Total_Sales_dollars"], axis=1), testing_data['Total_Sales_dollars']


model = xgb.XGBRegressor(n_estimators=1000)
model.fit(x_train, y_train,
          eval_set=[(x_train, y_train), (x_test, y_test)],
          early_stopping_rounds=50,  # stop if 50 consequent rounds without decrease of error
          verbose=False)


predicted = model.predict(Train_Table.drop(
    ["Week_date", "Total_Sales_dollars"], axis=1))
predicted_df = pd.DataFrame(data=predicted, columns=['preds'],
                            index=Train_Table.index.copy())
df_out = pd.merge(Train_Table, predicted_df, how='left', left_index=True,
                  right_index=True)


print(mean_absolute_percentage_error(
    Train_Table["Total_Sales_dollars"], predicted))


df_out.to_csv('/tmp/output_forecast_demo.csv', sep='|')
