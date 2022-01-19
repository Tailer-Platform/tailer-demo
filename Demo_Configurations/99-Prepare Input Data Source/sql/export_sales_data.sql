DECLARE start_date DATE DEFAULT CURRENT_DATE();
DECLARE min_date DATE DEFAULT CURRENT_DATE();
DECLARE end_date DATE DEFAULT CURRENT_DATE();
DECLARE gs_url_root STRING DEFAULT "gs://fd-io-exc-demo-n-in/input_demo_tailer/sales_";
DECLARE gs_url STRING;

SET (start_date, min_date, end_date) = (
SELECT AS STRUCT 
date_add(max(date), INTERVAL -3 DAY) as start_date,
date_add(max(date), INTERVAL -3 YEAR) as min_date,
max(date) as end_date,
FROM `bigquery-public-data.iowa_liquor_sales.sales`
);

SET gs_url=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.gz");

EXPORT DATA OPTIONS(
  uri=(gs_url),
  format='CSV',
  compression='GZIP',
  overwrite=true,
  header=true,
  field_delimiter=';') AS 
SELECT
  invoice_and_item_number,
  date,
  store_number,
  item_number,
  pack,
  bottle_volume_ml,
  state_bottle_cost,
  state_bottle_retail,
  bottles_sold,
  sale_dollars,
  volume_sold_liters,
  volume_sold_gallons
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE
  date <= start_date
  and date >= min_date;

SET start_date = date_add(start_date, INTERVAL 1 DAY);
SET gs_url=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.gz");

REPEAT
EXPORT DATA OPTIONS(
  uri=(gs_url),
  format='CSV',
  compression='GZIP',
  overwrite=true,
  header=true,
  field_delimiter=';') AS 
SELECT
  invoice_and_item_number,
  date,
  store_number,
  item_number,
  pack,
  bottle_volume_ml,
  state_bottle_cost,
  state_bottle_retail,
  bottles_sold,
  sale_dollars,
  volume_sold_liters,
  volume_sold_gallons
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE
  date = start_date;

SET start_date = date_add(start_date, INTERVAL 1 DAY);

SET gs_url=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.gz");
UNTIL start_date > end_date

END REPEAT;