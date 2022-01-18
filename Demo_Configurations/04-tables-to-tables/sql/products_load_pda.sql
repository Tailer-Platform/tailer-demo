WITH last_products_info AS (
SELECT
CAST(item_number as INT64) as item_number,
MAX(_TABLE_SUFFIX) as MAX_TABLE_SUFFIX
FROM `dlk_demo_iowa_liquor_psa.products_*`
GROUP BY 1)
SELECT
DISTINCT
CAST(SPLIT(t1.category,".")[offset (0)] AS INT64) as category,
t1.category_name,
CAST(SPLIT(t1.vendor_number,".")[offset (0)] AS INT64) as vendor_number,
t1.vendor_name,
cast(t1.item_number as INT64) as item_number,
t1.item_description
FROM `dlk_demo_iowa_liquor_psa.products_*` t1
INNER JOIN last_products_info t2 on cast(t1.item_number as INT64) = t2.item_number AND t1._TABLE_SUFFIX = t2.MAX_TABLE_SUFFIX