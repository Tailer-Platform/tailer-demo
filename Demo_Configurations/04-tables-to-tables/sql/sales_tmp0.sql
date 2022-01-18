SELECT
DISTINCT
invoice_and_item_number,
CAST(date AS DATE) as date,
CAST(store_number as INT64) as store_number,
CAST(item_number as INT64) as item_number,
CAST(pack AS INT64) as pack,
CASt(bottle_volume_ml as INT64) as bottle_volume_ml,
CAST(state_bottle_cost as FLOAT64) as state_bottle_cost,
CAST(bottles_sold AS INT64) as bottles_sold,
CAST(sale_dollars AS FLOAT64) as sale_dollars,
CAST(volume_sold_liters AS FLOAT64) as volume_sold_liters,
CAST(volume_sold_gallons AS FLOAT64) as volume_sold_gallons,
CAST(state_bottle_retail as FLOAT64) as state_bottle_retail
FROM `dlk_demo_iowa_liquor_psa.sales_*`