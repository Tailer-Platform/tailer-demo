SELECT
t1.invoice_and_item_number,
t1.date,
t1.item_number,
t1.store_number,
t1.bottles_sold,
t1.sale_dollars,
t1.volume_sold_liters,
t1.volume_sold_gallons,
t1.state_bottle_retail,
t1.pack,
t1.bottle_volume_ml,
t1.state_bottle_cost,
t2.store_name,
t2.address,
t2.city,
t2.zip_code,
t2.store_location,
t2.county_number,
t2.county,
t3.category,
t3.category_name,
t3.vendor_number,
t3.item_description
FROM dlk_demo_iowa_liquor_pda.sales_tmp0 t1
LEFT JOIN dlk_demo_iowa_liquor_pda.stores t2 on t1.store_number = t2.store_number
LEFT JOIN dlk_demo_iowa_liquor_pda.products t3 on t1.item_number = t3.item_number