SELECT *
    EXCEPT (RANG)
FROM(

    SELECT
        invoice_and_item_number,
        CAST(date AS DATE) AS order_date,
        store_number,
        item_number,
        CAST(bottles_sold AS INT64) AS bottles_sold,
        CAST(bottle_volume_ml AS INT64) AS bottle_volume_ml,
        CAST(sale_dollars AS FLOAT64) AS sale_dollars,
        CAST(volume_sold_liters AS FLOAT64) AS volume_sold_liters,
        CAST(volume_sold_gallons AS FLOAT64) AS volume_sold_gallons,
        ROW_NUMBER() OVER (DEDUPLICATION) AS RANG
    FROM `dlk_demo_iowa_liquor_psa.sales_*`
    WINDOW DEDUPLICATION AS (
        PARTITION BY invoice_and_item_number
        ORDER BY _TABLE_SUFFIX DESC
    )
)
WHERE RANG = 1
