###########################
#  Train Clustering Model
###########################

CREATE OR REPLACE MODEL dlk_demo_iowa_liquor_bda_cluster.model_clustering_store_iowa_liquor
OPTIONS(model_type='kmeans', num_clusters=5, standardize_features = true) AS

SELECT * except( store_number, store_name, volume_sold_liters, sale_q1, sale_q2, sale_q3, sale_q4)
FROM `fd-io-jarvis-demo-dlk.dlk_demo_iowa_liquor_bda_cluster.iowa_liquor_agg_store`