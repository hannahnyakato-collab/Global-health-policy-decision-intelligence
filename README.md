# Global Health Policy Decision Intelligence

A data project that helps decide where health investment would make the most difference in low-income countries.

It uses World Bank data on 25 low-income countries from 2000 to 2022. Machine learning models find which factors are most closely linked to under-five mortality, maternal mortality and life expectancy. Those results are then combined with each country's own gaps to suggest where that country should act first. Everything is brought together in an interactive Power BI dashboard.

![Executive summary](images/Executive%20Summary-Page%201.png)

## The question

Governments in low-income countries have limited health budgets and many competing needs. This project asks two questions.

1. Across these countries, which health system, service and social factors are most strongly linked to child deaths, maternal deaths and life expectancy?
2. For a given country, which of those factors is it furthest behind on, and so where should it act first?

## Data

- **Source.** World Bank Health, Nutrition and Population Statistics (`data/raw/world_bank_health_data.xlsx`).
- **Coverage.** 25 low-income countries, including Uganda, Rwanda, Malawi, Mozambique, South Sudan, Sierra Leone and Afghanistan, over 23 years (2000 to 2022).
- **Indicators.** About 90 indicators after cleaning, covering health financing, health workforce, services such as immunisation and skilled birth attendance, disease burden, nutrition, water and sanitation, demographics and socioeconomic factors.

## How it works

1. **Import and clean** (`notebooks/01_Data_Import.ipynb`). Reads the World Bank file, converts missing value markers, and reshapes the data into one row per country, indicator and year.
2. **Select and prepare variables** (`notebooks/02_Variable Selection and Pre-processing.ipynb`). Groups indicators into categories and keeps the relevant ones. It then drops indicators with more than 95% missing data, checks for duplicates, impossible values and constant columns, and removes one of each pair of indicators that are more than 90% correlated.
3. **Build the models** (`notebooks/03_Machine_Learning.ipynb`). Trains Random Forest and XGBoost models for each of the three outcomes, tunes them with 5-fold cross-validation, and keeps the better model for each outcome. SHAP values are then used to measure how much each factor contributes to the predictions.
4. **Build the Policy Priority Index** (`notebooks/04_decision_intelligence_framework.ipynb`). Scales the SHAP importance for each outcome from 0 to 1 and averages the three. A factor scores high if it matters for all three outcomes. Factors are also grouped into 11 health domains, such as Health System Strengthening, WASH and Maternal and Child Health.
5. **Separate what policy can change** (`python/make_policy_tables.py`). Labels each factor as actionable (services, workforce, financing, infrastructure), health burden (conditions such as anaemia or HIV prevalence) or context (population size, age structure). Context factors are useful for planning but are not investment targets.
6. **Rank priorities for each country.** For each actionable factor, the 2022 value for a country is compared with a benchmark set by the best-performing quarter of the 25 countries. The size of the gap is multiplied by the factor's importance to give a priority score, and the factors are ranked for each country.
7. **Store and query in MySQL** (`sql/`). Scripts create the database and tables, run summary queries and create the views that feed the dashboard.
8. **Present in Power BI** (`dashboard/`). An interactive dashboard with five pages.

## Results

**Model performance on held-out test data**

| Outcome | Model selected | R² | MAE |
|---|---|---|---|
| Under-five mortality | Random Forest | 0.715 | 10.97 deaths per 1,000 live births |
| Maternal mortality | XGBoost | 0.978 | 40.24 deaths per 100,000 live births |
| Life expectancy | Random Forest | 0.843 | 1.38 years |

**Main findings**

- Universal health coverage (the UHC service coverage index) was the most important factor for all three outcomes, well ahead of everything else.
- After UHC coverage, the most important factors were DPT immunisation, population size and births attended by skilled health staff.
- Health System Strengthening was the highest-ranked domain overall, followed by Demographics, Maternal and Child Health, and Infectious Disease Control.
- About 60% of the total importance comes from factors that policy can act on directly. About 21% comes from health burden indicators and 18% from background context.
- For Uganda in 2022, the top priority was basic sanitation. Only 23.2% of people used at least basic sanitation services, compared with an average of 37.9% across the 25 countries. The next priorities were health spending as a share of the economy, skilled birth attendance and safely managed drinking water.

## Dashboard

The Power BI file is `dashboard/Global Health Policy Decision Intelligence Dashboard.pbix`. It has five pages.

1. **Executive Summary.** Headline figures, the top health drivers, priority health areas and the best model for each outcome.
2. **Country Health Profile.** Trends in the three outcomes and service coverage for any country and year, compared with the group average.
3. **Model Performance.** How the Random Forest and XGBoost models compare for each outcome.
4. **Actionable Drivers.** Which important factors policy can change and which are background context.
5. **Policy Priorities.** Choose a country to see its top five recommended actions, its value for each indicator, the 25-country average and its priority score.

| Policy Priorities | Actionable Drivers |
|---|---|
| ![Policy priorities](images/Policy%20Priorities-%20Page%205.png) | ![Actionable drivers](images/Actionable%20Drivers-%20Page%204.png) |

| Country Health Profile | Model Performance |
|---|---|
| ![Country health profile](images/Country%20Health%20Profile-%20Page%202.png) | ![Model performance](images/Model%20Performance-%20Page%203.png) |

## Project structure

```
├── data/
│   ├── raw/          World Bank source file
│   └── clean/        Cleaned dataset, priority rankings, model results and country priorities
├── notebooks/        Four notebooks, run in order (01 to 04)
├── models/           SHAP importance for each outcome (.csv and .pkl)
├── python/           Driver classification and country priority tables
├── sql/              MySQL database, tables, queries and views
├── dashboard/        Power BI dashboard (.pbix)
├── images/           Dashboard screenshots
└── requirements.txt  Python packages
```

## How to run it

1. Clone the repository and create a Python environment.
   ```bash
   git clone https://github.com/hannahnyakato-collab/global-health-policy-decision-intelligence.git
   cd global-health-policy-decision-intelligence
   python -m venv venv
   pip install -r requirements.txt
   ```
2. Update the file paths at the top of notebooks 01 and 02 to match where the project is saved on your computer.
3. Run the notebooks in order, from 01 to 04, and then the policy tables step in the `python` folder.
4. To use the database, run the scripts in `sql/` in order in MySQL and load the CSV files from `data/clean/` into the tables.
5. Open the `.pbix` file in Power BI Desktop to explore the dashboard.

## Tools

Python (pandas, NumPy, scikit-learn, XGBoost, SHAP, Matplotlib), Jupyter, MySQL and Power BI.

## Limitations

- The models show which factors are linked to better or worse outcomes. They do not prove that changing a factor will cause an improvement.
- The data covers 25 countries, so the results are best read as patterns across this group rather than precise estimates for any one country.
- The training and test data were split at random across country-years. The same country therefore appears in both, which may make the test scores look better than they would be for a country the model has never seen.
- Some World Bank indicators have gaps in certain years and countries, which limits how much detail the models can capture.

## Author

**Aine Hannah Nyakato**, data analyst, Kampala, Uganda
[hannahnyakato@gmail.com](mailto:hannahnyakato@gmail.com)
