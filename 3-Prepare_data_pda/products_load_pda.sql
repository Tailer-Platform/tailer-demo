WITH last_products_info AS (
SELECT
item_number,
MAX(_TABLE_SUFFIX) as MAX_TABLE_SUFFIX
FROM `dlk_demo_iowa_liquor_psa.products_*`
GROUP BY 1)
SELECT
DISTINCT
t1.category,
t1.category_name,
t1.vendor_number,
t1.item_number,
t1.item_description,
CAST(t1.pack AS INT64) as pack,
CASt(t1.bottle_volume_ml as INT64) as bottle_volume_ml,
CAST(t1.state_bottle_cost as FLOAT64) as state_bottle_cost,
CAST(t1.state_bottle_retail as FLOAT64) as state_bottle_retail
FROM `dlk_demo_iowa_liquor_psa.products_*` t1
INNER JOIN last_products_info t2 on t1.item_number = t2.item_number AND t1._TABLE_SUFFIX = t2.MAX_TABLE_SUFFIX