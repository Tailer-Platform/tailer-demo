-- Testons si nous avons des ventes quotidiennes depuis lé 2019-01_01 
CALL `tailer-ai.expect.everyday_since`("fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda", "sales_details", "date", "2019-01-01", [], 1);

