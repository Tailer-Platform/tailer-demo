WITH last_stores_info AS (
SELECT
CAST(store_number as INT64) as store_number,
MAX(_TABLE_SUFFIX) as MAX_TABLE_SUFFIX
FROM `dlk_demo_iowa_liquor_psa.stores_*`
GROUP BY 1)
SELECT
DISTINCT
CAST(t1.store_number as INT64) as store_number,
t1.store_name,
t1.address,
t1.city,
CAST(t1.zip_code as INT64) as zip_code,
t1.store_location,
CAST(t1.county_number as INT64) as county_number,
t1.county
FROM `dlk_demo_iowa_liquor_psa.stores_*` t1
INNER JOIN last_stores_info t2 on CAST(t1.store_number as INT64) = t2.store_number AND t1._TABLE_SUFFIX = t2.MAX_TABLE_SUFFIX