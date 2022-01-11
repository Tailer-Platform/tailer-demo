DECLARE start_date DATE DEFAULT CURRENT_DATE();
DECLARE min_date DATE DEFAULT CURRENT_DATE();
DECLARE gs_url_root STRING DEFAULT "gs://fd-io-exc-demo-n-in/input_demo_tailer/products_";
DECLARE gs_url STRING;

SET start_date = "2022-01-01";
SET min_date = "2019-01-01";
SET gs_url=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv");

EXPORT DATA OPTIONS(
  uri=(gs_url),
  format='CSV',
  overwrite=true,
  header=true,
  field_delimiter=';') AS 
SELECT
  DISTINCT 
  category,
  category_name,
  vendor_number,
  vendor_name,
  item_number,
  item_description
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE date <= start_date
and date >= min_date;

SET start_date = date_add(start_date, INTERVAL 1 DAY);
SET gs_url=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv");

REPEAT
EXPORT DATA OPTIONS(
  uri=(gs_url),
  format='CSV',
  overwrite=true,
  header=true,
  field_delimiter=';') AS 
SELECT
  DISTINCT 
  category,
  category_name,
  vendor_number,
  vendor_name,
  item_number,
  item_description
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE date = start_date;

SET start_date = date_add(start_date, INTERVAL 1 DAY);

SET gs_url=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv");
UNTIL start_date > CURRENT_DATE()

END REPEAT;