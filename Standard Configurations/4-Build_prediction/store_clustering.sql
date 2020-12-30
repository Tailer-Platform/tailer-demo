######################################################
#       Affect every stores to the good cluster
######################################################

SELECT * except(nearest_centroids_distance) 
FROM ML.PREDICT(MODEL dlk_demo_iowa_liquor_bda_cluster.model_clustering_store_iowa_liquor, 
(
SELECT * except(sale_q1, sale_q2, sale_q3, sale_q4)
FROM `dlk_demo_iowa_liquor_bda_cluster.iowa_liquor_agg_store`

))