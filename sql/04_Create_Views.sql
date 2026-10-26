USE Globalhealthdecisionintelligence;
CREATE OR REPLACE VIEW vw_global_policy_priority AS

SELECT
    Feature,
    Domain,
    Policy_Priority_Index,
    U5,
    Maternal,
    Life
FROM combined_policy_priority_index
ORDER BY Policy_Priority_Index DESC;


CREATE OR REPLACE VIEW vw_domain_rankings AS

SELECT
    Domain,
    Policy_Priority_Index
FROM combined_domain_priority_ranking
ORDER BY Policy_Priority_Index DESC;


CREATE OR REPLACE VIEW vw_model_performance AS

SELECT
    Outcome,
    Model,
    MAE,
    RMSE,
    R2,
    Selected
FROM model_performance;


CREATE OR REPLACE VIEW vw_country_health AS

SELECT *
FROM health_data_sql;

SHOW FULL TABLES
WHERE Table_type='VIEW';