SELECT
DISTINCT
invoice_and_item_number,
CAST(date AS DATE) as date,
store_number,
item_number,
CAST(bottles_sold AS INT64) as bottles_sold,
CAST(sale_dollars AS FLOAT64) as sale_dollars,
CAST(volume_sold_liters AS FLOAT64) as volume_sold_liters,
CAST(volume_sold_gallons AS FLOAT64) as volume_sold_gallons,
CAST(state_bottle_retail as FLOAT64) as state_bottle_retail
FROM `dlk_demo_iowa_liquor_psa.sales_*`