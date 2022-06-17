-- Testons la primary key de la table Stores
CALL `tailer-ai.expect.primarykey_named`("fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda", "stores", "store_number", 0);

-- Testons la primary key de la table Products
CALL `tailer-ai.expect.primarykey_named`("fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda", "products", "item_number", 0);

-- Testons la primary key de la table Sales Details 
CALL `tailer-ai.expect.primarykey_named`("fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_pda", "sales_details", "invoice_and_item_number", 0);

