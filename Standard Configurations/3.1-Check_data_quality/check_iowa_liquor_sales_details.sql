-- Data Quality Tests:
    -- PK duplicate: should have none
    -- sale_dollars max value
    -- count null store_number
    -- count null item_number

-- Declare variables:
DECLARE max_pk_duplicate_count_threshold NUMERIC DEFAULT 0;
DECLARE max_sale_dollars_threshold NUMERIC DEFAULT 1000;
DECLARE max_null_store_number_threshold NUMERIC DEFAULT 0;
DECLARE max_null_item_number_threshold NUMERIC DEFAULT 0;

-- Start tests:
-- PK duplicate: should have none
ASSERT
  (SELECT count(distinct invoice_and_item_number) FROM (
    SELECT invoice_and_item_number, count(*) as nb_duplicate 
    FROM `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda.sales_details` 
    GROUP BY 1 HAVING nb_duplicate > 1)
  )
>= max_pk_duplicate_count_threshold
AS "PK KO: too many duplicate lines."
;

-- sale_dollars max value
ASSERT
  (SELECT max(sale_dollars) FROM `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda.sales_details`)
>= max_sale_dollars_threshold
AS "WARNING: max(sale_dollars) too high in dlk_demo_iowa_liquor_pda.sales_details"
;

-- count null store_number
ASSERT
  (SELECT count(*) FROM `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda.sales_details` where store_number is null)
>=  
  max_null_store_number_threshold
AS "WARNING: too many null store_number in dlk_demo_iowa_liquor_pda.sales_details"
;

-- count null item_number
ASSERT
  (SELECT count(*) FROM `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda.sales_details` where item_number is null)
>=  
  max_null_store_number_threshold
AS "WARNING: too many null item_number in dlk_demo_iowa_liquor_pda.sales_details"
;