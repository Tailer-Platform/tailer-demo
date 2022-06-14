SELECT *
    EXCEPT (RANG)
FROM(

    SELECT DISTINCT
        store_number,
        store_name,
        address,
        city,
        zip_code,
        store_location,
        county_number,
        ROW_NUMBER() OVER (DEDUPLICATION) AS RANG
    FROM `dlk_demo_iowa_liquor_psa.stores_*`
    WINDOW DEDUPLICATION AS (
        PARTITION BY store_number
        ORDER BY _TABLE_SUFFIX DESC
    )
)
WHERE RANG = 1

