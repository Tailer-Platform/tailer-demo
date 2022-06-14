-- CREATE OR REPLACE TABLE `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_bda_cluster.iowa_liquor_agg_store_2019` CLUSTER BY store_number AS 
with tmp as (

    select
        store_number,
        store_name,
        EXTRACT(QUARTER from order_date) as quarter_date,
        case when(LOWER(category_name) like '%vodka%') then 'vodka'
            when(LOWER(category_name) like '%whiskies%') then 'whisky'
            when(LOWER(category_name) like '%rum%') then 'rum'
            when(LOWER(category_name) like '%liqueur%') then 'liqueur'
            when(LOWER(category_name) like '%tequila%') then 'tequila'
            when(LOWER(category_name) like '%schnapps%') then 'schnapps'
            when(LOWER(category_name) like '%gin%') then 'gin'
            when(LOWER(category_name) like '%cocktails%') then 'cocktail'
            when(LOWER(category_name) like '%brandies%') then 'brandy'
            when(LOWER(category_name) like '%spirit%') then 'spirit'
            else 'others' end as cat_alcool,
        SUM(sale_dollars) as sale_dollars,
        SUM(volume_sold_liters) as volume_sold_liters
    from dlk_demo_iowa_liquor_pda.sales_details
    where order_date >= '2019-01-01' and order_date < '2020-01-01'
    group by store_number, store_name, quarter_date, cat_alcool

)

select
    store_number,
    store_name,
    ROUND(SUM(sale_dollars), 2) as sale_dollars,
    ROUND(SUM(volume_sold_liters), 2) as volume_sold_liters,

    ROUND(SUM(case when(quarter_date = 1) then sale_dollars else 0 end) / SUM(sale_dollars), 2) as sale_q1,
    ROUND(SUM(case when(quarter_date = 2) then sale_dollars else 0 end) / SUM(sale_dollars), 2) as sale_q2,
    ROUND(SUM(case when(quarter_date = 3) then sale_dollars else 0 end) / SUM(sale_dollars), 2) as sale_q3,
    ROUND(SUM(case when(quarter_date = 4) then sale_dollars else 0 end) / SUM(sale_dollars), 2) as sale_q4,

    ROUND(SUM(case when(cat_alcool = 'vodka') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_vodka,
    ROUND(SUM(case when(cat_alcool = 'whisky') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_whisky,
    ROUND(SUM(case when(cat_alcool = 'rum') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_rum,
    ROUND(SUM(case when(cat_alcool = 'liqueur') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_liqueur,
    ROUND(SUM(case when(cat_alcool = 'tequila') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_tequila,
    ROUND(SUM(case when(cat_alcool = 'schnapps') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_schnapps,
    ROUND(SUM(case when(cat_alcool = 'gin') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_gin,
    ROUND(SUM(case when(cat_alcool = 'cocktail') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_cocktail,
    ROUND(SUM(case when(cat_alcool = 'brandy') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_brandy,
    ROUND(SUM(case when(cat_alcool = 'spirit') then sale_dollars else 0 end) / SUM(sale_dollars), 2) as p_spirit

from tmp
group by store_number, store_name
