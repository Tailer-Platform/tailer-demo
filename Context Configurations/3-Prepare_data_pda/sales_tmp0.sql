SELECT
DISTINCT
invoice_and_item_number,
CAST(date AS DATE) as date,
store_number,
item_number,
CAST(bottles_sold AS INT64) as bottles_sold,
CAST(bottle_volume_ml as INT64) as bottle_volume_ml,
CAST(sale_dollars AS FLOAT64) as sale_dollars,
CAST(volume_sold_liters AS FLOAT64) as volume_sold_liters,
CAST(volume_sold_gallons AS FLOAT64) as volume_sold_gallons
FROM `dlk_demo_iowa_liquor_psa.sales_*`