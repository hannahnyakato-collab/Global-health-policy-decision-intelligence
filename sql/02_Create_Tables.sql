USE GlobalHealthDecisionIntelligence;
INSERT INTO combined_domain_priority_ranking (id, Domain, Policy_Priority_Index)
VALUES (
    id:int,
    'Domain:varchar',
    'Policy_Priority_Index:double'
  );

CREATE TABLE model_performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Outcome VARCHAR(100),
    Model VARCHAR(100),
    MAE DOUBLE,
    RMSE DOUBLE,
    R2 DOUBLE,
    Selected VARCHAR(10)
);

CREATE TABLE combined_policy_priority_index (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Feature TEXT,
    U5 DOUBLE,
    Maternal DOUBLE,
    Life DOUBLE,
    Policy_Priority_Index DOUBLE,
    U5_norm DOUBLE,
    Maternal_norm DOUBLE,
    Life_norm DOUBLE,
    Domain VARCHAR(150)
);

CREATE TABLE combined_domain_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Domain VARCHAR(150),
    Policy_Priority_Index DOUBLE
);

CREATE TABLE u5_policy_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Feature TEXT,
    U5 DOUBLE,
    U5_norm DOUBLE,
    Domain VARCHAR(150)
);

CREATE TABLE maternal_policy_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Feature TEXT,
    Maternal DOUBLE,
    Maternal_norm DOUBLE,
    Domain VARCHAR(150)
);

CREATE TABLE life_policy_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Feature TEXT,
    Life DOUBLE,
    Life_norm DOUBLE,
    Domain VARCHAR(150)
);

CREATE TABLE u5_domain_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Domain VARCHAR(150),
    U5_norm DOUBLE
);

CREATE TABLE maternal_domain_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Domain VARCHAR(150),
    Maternal_norm DOUBLE
);

CREATE TABLE life_domain_priority_ranking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Domain VARCHAR(150),
    Life_norm DOUBLE
);

SHOW TABLES;


USE GlobalHealthDecisionIntelligence;

SELECT COUNT(*) AS TotalRows
FROM combined_domain_priority_ranking;



USE GlobalHealthDecisionIntelligence;


CREATE TABLE health_data_clean (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `Country Name` VARCHAR(150),
    `Year` INT,
    `AIDS estimated deaths (UNAIDS estimates)` DOUBLE,
    `Adolescent fertility rate (births per 1,000 women ages 15-19)` DOUBLE,
    `Adults (ages 15+) and children (0-14 years) living with HIV` DOUBLE,
    `Adults (ages 15+) and children (ages 0-14) newly infected with HIV` DOUBLE,
    `Age dependency ratio (% of working-age population)` DOUBLE,
    `Age dependency ratio, old` DOUBLE,
    `Antiretroviral therapy coverage (% of people living with HIV)` DOUBLE,
    `Antiretroviral therapy coverage for PMTCT (% of pregnant women living with HIV)` DOUBLE,
    `Births attended by skilled health staff (% of total)` DOUBLE,
    `Children orphaned by HIV/AIDS` DOUBLE,
    `Current health expenditure (% of GDP)` DOUBLE,
    `Current health expenditure per capita (current US$)` DOUBLE,
    `Current health expenditure per capita, PPP (current international $)` DOUBLE,
    `Death rate, crude (per 1,000 people)` DOUBLE,
    `Domestic general government health expenditure (% of GDP)` DOUBLE,
    `Domestic general government health expenditure (% of current health expenditure)` DOUBLE,
    `Domestic general government health expenditure (% of general government expenditure)` DOUBLE,
    `Domestic private health expenditure (% of current health expenditure)` DOUBLE,
    `Exclusive breastfeeding (% of children under 6 months)` DOUBLE,
    `External health expenditure (% of current health expenditure)` DOUBLE,
    `External health expenditure channeled through government (% of external health expenditure)` DOUBLE,
    `Fertility rate, total (births per woman)` DOUBLE,
    `GNI per capita, Atlas method (current US$)` DOUBLE,
    `Hospital beds (per 1,000 people)` DOUBLE,
    `Immunization, DPT (% of children ages 12-23 months)` DOUBLE,
    `Incidence of HIV, all (per 1,000 uninfected population)` DOUBLE,
    `Incidence of malaria (per 1,000 population at risk)` DOUBLE,
    `Incidence of tuberculosis (per 100,000 people)` DOUBLE,
    `Labor force, total` DOUBLE,
    `Life expectancy at birth, total (years)` DOUBLE,
    `Lifetime risk of maternal death (%)` DOUBLE,
    `Low-birthweight babies (% of births)` DOUBLE,
    `Maternal mortality ratio (modeled estimate, per 100,000 live births)` DOUBLE,
    `Mortality rate, infant (per 1,000 live births)` DOUBLE,
    `Mortality rate, neonatal (per 1,000 live births)` DOUBLE,
    `Mortality rate, under-5 (per 1,000)` DOUBLE,
    `Net migration` DOUBLE,
    `Newborns protected against tetanus (%)` DOUBLE,
    `Number of infant deaths` DOUBLE,
    `Nurses and midwives (per 1,000 people)` DOUBLE,
    `Out-of-pocket expenditure (% of current health expenditure)` DOUBLE,
    `People practicing open defecation (% of population)` DOUBLE,
    `People using at least basic drinking water services (% of population)` DOUBLE,
    `People using at least basic sanitation services (% of population)` DOUBLE,
    `People using safely managed drinking water services (% of population)` DOUBLE,
    `People using safely managed sanitation services (% of population)` DOUBLE,
    `People with basic handwashing facilities including soap and water (% of population)` DOUBLE,
    `Physicians (per 1,000 people)` DOUBLE,
    `Population ages 0-14 (% of total population)` DOUBLE,
    `Population ages 65 and above (% of total population)` DOUBLE,
    `Population growth (annual %)` DOUBLE,
    `Population, total` DOUBLE,
    `Prevalence of HIV, total (% of population ages 15-49)` DOUBLE,
    `Prevalence of anemia among children (% of children ages 6-59 months)` DOUBLE,
    `Prevalence of anemia among pregnant women (%)` DOUBLE,
    `Prevalence of anemia among women of reproductive age (% of women ages 15-49)` DOUBLE,
    `Prevalence of current tobacco use (% of adults)` DOUBLE,
    `Prevalence of hypertension (% of adults ages 30-79)` DOUBLE,
    `Prevalence of overweight (% of adults)` DOUBLE,
    `Prevalence of overweight (% of children under 5)` DOUBLE,
    `Prevalence of severe wasting, weight for height (% of children under 5)` DOUBLE,
    `Prevalence of stunting, height for age (% of children under 5)` DOUBLE,
    `Prevalence of syphilis (% of women attending antenatal care)` DOUBLE,
    `Prevalence of undernourishment (% of population)` DOUBLE,
    `Prevalence of underweight, weight for age (% of children under 5)` DOUBLE,
    `Prevalence of wasting, weight for height (% of children under 5)` DOUBLE,
    `Primary completion rate, total (% of relevant age group)` DOUBLE,
    `Public spending on education, total (% of GDP)` DOUBLE,
    `Risk of catastrophic expenditure for surgical care (% of people at risk)` DOUBLE,
    `Risk of impoverishing expenditure for surgical care (% of people at risk)` DOUBLE,
    `Rural population (% of total population)` DOUBLE,
    `School enrollment, primary (% net)` DOUBLE,
    `School enrollment, secondary (% net)` DOUBLE,
    `School enrollment, tertiary (% gross)` DOUBLE,
    `Stillbirth rate (per 1,000 total births)` DOUBLE,
    `Suicide mortality rate (per 100,000 population)` DOUBLE,
    `Total alcohol consumption per capita (liters of pure alcohol, projected estimates, 15+ years of age)` DOUBLE,
    `Treatment for hypertension (% of adults ages 30-79 with hypertension)` DOUBLE,
    `Tuberculosis case detection rate (%, all forms)` DOUBLE,
    `Tuberculosis death rate (per 100,000 people)` DOUBLE,
    `Tuberculosis treatment success rate (% of new cases)` DOUBLE,
    `UHC service coverage index` DOUBLE,
    `Unemployment, total (% of total labor force)` DOUBLE,
    `Urban population (% of total population)` DOUBLE,
    `Vitamin A supplementation coverage rate (% of children ages 6-59 months)` DOUBLE
);
