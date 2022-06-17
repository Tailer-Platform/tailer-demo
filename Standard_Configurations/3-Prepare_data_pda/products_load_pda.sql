SELECT *
    EXCEPT (RANG)
FROM(

    SELECT
        category_name,
        vendor_number,
        item_number,
        item_description,
        CAST(pack AS INT64) AS pack,
        CAST(bottle_volume_ml AS INT64) AS bottle_volume_ml,
        CAST(state_bottle_cost AS FLOAT64) AS state_bottle_cost,
        CAST(state_bottle_retail AS FLOAT64) AS state_bottle_retail,
        ROW_NUMBER() OVER (DEDUPLICATION) AS RANG
    FROM `dlk_demo_iowa_liquor_psa.products_*`
    WINDOW DEDUPLICATION AS (
        PARTITION BY item_number
        ORDER BY _TABLE_SUFFIX DESC
    )
)
WHERE RANG = 1
