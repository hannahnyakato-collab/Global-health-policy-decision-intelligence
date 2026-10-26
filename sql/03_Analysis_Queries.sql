-- USE GlobalHealthDecisionIntelligence;

-- SHOW TABLES;

-- SELECT COUNT(*) AS rows_health_data
-- FROM health_data_sql;

-- SELECT COUNT(*) AS rows_policy_index
-- FROM combined_policy_priority_index;

-- SELECT COUNT(*) AS rows_domain_rank
-- FROM combined_domain_priority_ranking;

-- SELECT COUNT(*) AS rows_model_performance
-- FROM model_performance;

-- Top 10 global policy priorities
SELECT 
    Feature,
    Domain,
    Policy_Priority_Index
FROM combined_policy_priority_index
ORDER BY Policy_Priority_Index DESC
LIMIT 10;


-- Domain-level investment priorities
SELECT 
    Domain,
    Policy_Priority_Index
FROM combined_domain_priority_ranking
ORDER BY Policy_Priority_Index DESC;


-- Best selected model for each outcome
SELECT 
    Outcome,
    Model,
    MAE,
    RMSE,
    R2
FROM model_performance
WHERE Selected = 'Yes'
ORDER BY Outcome;


-- Compare model performance by outcome
SELECT 
    Outcome,
    Model,
    MAE,
    RMSE,
    R2,
    Selected
FROM model_performance
ORDER BY Outcome, R2 DESC;