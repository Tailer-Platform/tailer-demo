WITH all_products as (
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
t1.item_description,
RANK() OVER (PARTITION BY cast(t1.item_number as INT64) ORDER BY CAST(SPLIT(t1.category,".")[offset (0)] AS INT64) DESC, t1.category_name DESC, CAST(SPLIT(t1.vendor_number,".")[offset (0)] AS INT64) DESC, t1.vendor_name DESC, t1.item_description DESC) AS rank
FROM `dlk_demo_iowa_liquor_psa.products_*` t1
INNER JOIN last_products_info t2 on cast(t1.item_number as INT64) = t2.item_number AND t1._TABLE_SUFFIX = t2.MAX_TABLE_SUFFIX)
SELECT
item_number,
item_description,
category,
category_name,
vendor_number,
vendor_name
FROM all_products
where rank = 1
--order by item_number