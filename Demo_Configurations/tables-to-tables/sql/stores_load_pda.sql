WITH last_stores_info AS (
SELECT
store_number,
MAX(_TABLE_SUFFIX) as MAX_TABLE_SUFFIX
FROM `dlk_demo_iowa_liquor_psa.stores_*`
GROUP BY 1)
SELECT
DISTINCT
t1.store_number,
t1.store_name,
t1.address,
t1.city,
t1.zip_code,
t1.store_location,
t1.county_number,
t1.county
FROM `dlk_demo_iowa_liquor_psa.stores_*` t1
INNER JOIN last_stores_info t2 on t1.store_number = t2.store_number AND t1._TABLE_SUFFIX = t2.MAX_TABLE_SUFFIX