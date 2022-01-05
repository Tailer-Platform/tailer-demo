DECLARE start_date DATE DEFAULT CURRENT_DATE();
DECLARE min_date DATE DEFAULT CURRENT_DATE();
DECLARE gs_url_root STRING DEFAULT "gs://fd-io-exc-demo-n-in/input_demo_tailer/products_";
DECLARE gs_url_ddl STRING;
DECLARE gs_url_data STRING;

SET start_date = "2021-12-31";
SET min_date = "2021-10-31";
SET gs_url_ddl=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv.ddl.json");
SET gs_url_data=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv");

EXPORT DATA OPTIONS(
  uri=(gs_url_ddl),
  format='JSON',
  overwrite=true
  ) AS 
SELECT 
[
    STRUCT( "category" as name, "STRING" as type, "Category code associated with the liquor" as description),
    STRUCT( "category_name" as name, "STRING" as type, "Category of the liquor" as description),
    STRUCT( "vendor_number" as name, "STRING" as type, "The vendor number of the company for the brand of liquor" as description),
    STRUCT( "item_number" as name, "STRING" as type, "Item number for the individual liquor product" as description),
    STRUCT( "item_description" as name, "STRING" as type, "Description of the individual liquor product" as description),
    STRUCT( "pack" as name, "STRING" as type, "The number of bottles in a case for the liquor" as description),
    STRUCT( "bottle_volume_ml" as name, "STRING" as type, "Volume of each liquor bottle in milliliters" as description),
    STRUCT( "state_bottle_cost" as name, "STRING" as type, "The amount that Alcoholic Beverages Division paid for each bottle of liquor" as description)
] as schema;

EXPORT DATA OPTIONS(
  uri=(gs_url_data),
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
  item_description,
  pack,
  bottle_volume_ml,
  state_bottle_cost
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE date <= start_date
and date >= min_date;

SET start_date = date_add(start_date, INTERVAL 1 DAY);
SET gs_url_ddl=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv.ddl.json");
SET gs_url_data=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv");

REPEAT

EXPORT DATA OPTIONS(
  uri=(gs_url_ddl),
  format='JSON',
  overwrite=true
  ) AS 
SELECT 
[
    STRUCT( "category" as name, "STRING" as type, "Category code associated with the liquor" as description),
    STRUCT( "category_name" as name, "STRING" as type, "Category of the liquor" as description),
    STRUCT( "vendor_number" as name, "STRING" as type, "The vendor number of the company for the brand of liquor" as description),
    STRUCT( "item_number" as name, "STRING" as type, "Item number for the individual liquor product" as description),
    STRUCT( "item_description" as name, "STRING" as type, "Description of the individual liquor product" as description),
    STRUCT( "pack" as name, "STRING" as type, "The number of bottles in a case for the liquor" as description),
    STRUCT( "bottle_volume_ml" as name, "STRING" as type, "Volume of each liquor bottle in milliliters" as description),
    STRUCT( "state_bottle_cost" as name, "STRING" as type, "The amount that Alcoholic Beverages Division paid for each bottle of liquor" as description)
] as schema;

EXPORT DATA OPTIONS(
  uri=(gs_url_data),
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
  item_description,
  pack,
  bottle_volume_ml,
  state_bottle_cost
FROM
  bigquery-public-data.iowa_liquor_sales.sales
WHERE date = start_date;

SET start_date = date_add(start_date, INTERVAL 1 DAY);

SET gs_url_ddl=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv.ddl.json");
SET gs_url_data=CONCAT(gs_url_root,CAST(FORMAT_DATE("%Y%m%d", start_date) AS STRING),"_*.csv");

UNTIL start_date > CURRENT_DATE()

END REPEAT;