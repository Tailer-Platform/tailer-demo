###################################################
#  Train Clustering Model in your Big Query Console
###################################################

CREATE OR REPLACE MODEL dlk_demo_iowa_liquor_bda_cluster.model_clustering_store_iowa_liquor
OPTIONS(model_type='kmeans', num_clusters=5, standardize_features = true) AS

SELECT * except( store_number, store_name, volume_sold_liters, sale_q1, sale_q2, sale_q3, sale_q4)
--FROM `dlk_demo_iowa_liquor_bda_cluster.iowa_liquor_agg_store`
FROM
(
  
  with tmp as (
    SELECT  store_number,
          store_name,
          EXTRACT(QUARTER FROM date) as quarter,
          case when(lower(category_name) like '%vodka%') then 'vodkas'
                when(lower(category_name) like '%whiskies%') then 'whiskies'
                when(lower(category_name) like '%rum%') then 'rum'
                when(lower(category_name) like '%liqueur%') then 'liqueur'
                when(lower(category_name) like '%tequila%') then 'tequila'
                when(lower(category_name) like '%schnapps%') then 'schnapps'
                when(lower(category_name) like '%gin%') then 'gin'
                when(lower(category_name) like '%cocktails%') then 'cocktails'
                when(lower(category_name) like '%brandies%') then 'brandies'
                when(lower(category_name) like '%spirit%') then 'spirit'
          else 'autre' end cat_alcool,
          sum(sale_dollars) as sale_dollars,
          sum(volume_sold_liters) as volume_sold_liters
    FROM dlk_demo_iowa_liquor_pda.sales_details
    where date >= '2019-01-01' and date < '2021-12-31'
    group by store_number,store_name,quarter,cat_alcool
  )
  select store_number,
    store_name,
    sum(sale_dollars) as sale_dollars,
    sum(volume_sold_liters) as volume_sold_liters,

    round(sum(case when(quarter = 1) then sale_dollars else 0 end) / sum(sale_dollars) , 2)  as sale_q1,
    round(sum(case when(quarter = 2) then sale_dollars else 0 end) / sum(sale_dollars) , 2) as sale_q2,
    round(sum(case when(quarter = 3) then sale_dollars else 0 end) / sum(sale_dollars) , 2) as sale_q3,
    round(sum(case when(quarter = 4) then sale_dollars else 0 end) / sum(sale_dollars) , 2) as sale_q4,

    round(sum(case when(cat_alcool = 'vodkas') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_vodkas,
    round(sum(case when(cat_alcool = 'whiskies') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_whiskies,
    round(sum(case when(cat_alcool = 'rum') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_rum,
    round(sum(case when(cat_alcool = 'liqueur') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_liqueur,
    round(sum(case when(cat_alcool = 'tequila') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_tequila,
    round(sum(case when(cat_alcool = 'schnapps') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_schnapps,
    round(sum(case when(cat_alcool = 'gin') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_gin,
    round(sum(case when(cat_alcool = 'cocktails') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_cocktails,
    round(sum(case when(cat_alcool = 'brandies') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_brandies,
    round(sum(case when(cat_alcool = 'spirit') then sale_dollars else 0 end) / sum(sale_dollars) , 2) as p_spirit
  from tmp
  group by store_number,store_name
)