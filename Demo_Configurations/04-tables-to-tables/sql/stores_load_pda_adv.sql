with all_stores as (
WITH last_stores_info AS (
SELECT
CAST(store_number as INT64) as store_number,
MAX(_TABLE_SUFFIX) as MAX_TABLE_SUFFIX
FROM `dlk_demo_iowa_liquor_psa.stores_*`
GROUP BY 1)
SELECT
DISTINCT
CAST(SPLIT(t1.store_number,".")[offset(0)] as INT64) as store_number,
t1.store_name,
t1.address,
t1.city,
CAST(SPLIT(t1.zip_code,".")[offset(0)] as INT64) as zip_code,
t1.store_location,
CAST(t1.county_number as INT64) as county_number,
t1.county,
RANK() OVER (PARTITION BY CAST(SPLIT(t1.store_number,".")[offset(0)] as INT64) ORDER BY t1.store_location DESC, t1.store_name ASC, t1.address DESC, CAST(SPLIT(t1.zip_code,".")[offset(0)] as INT64) DESC, CAST(t1.county_number as INT64) DESC, t1.county DESC) AS rank
FROM `dlk_demo_iowa_liquor_psa.stores_*` t1
INNER JOIN last_stores_info t2 on CAST(t1.store_number as INT64) = t2.store_number AND t1._TABLE_SUFFIX = t2.MAX_TABLE_SUFFIX)
SELECT
store_number,
store_name,
city,
zip_code,
store_location,
county_number,
county
FROM all_stores
WHERE rank = 1
