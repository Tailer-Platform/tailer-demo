DECLARE start_date DATE DEFAULT CURRENT_DATE();
DECLARE min_date DATE DEFAULT CURRENT_DATE();
DECLARE gs_url_root STRING DEFAULT "gs://fd-io-exc-demo-n-in/input_demo_tailer/sales_";
DECLARE gs_url STRING;

SET start_date = "2021-08-31";
SET min_date = "2019-01-01";
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
UNTIL start_date > CURRENT_DATE()

END REPEAT;