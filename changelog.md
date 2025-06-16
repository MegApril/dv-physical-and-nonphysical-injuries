## Changelog

### 2025-06-13 
#### Added
- Linked R analysis workflow to existing GitHub repository to initiate reproducible documentation.
- Set up structured changelog system for tracking analysis development.

#### Changed
- Switched analysis workflow from SQL to R for initial data wrangling and transformation based on previous cert project experience.

#### Investigating
- Row count discrepancy noted between expected (3,015) and actual (2,880) entries in injury dataset. Potential causes: `NA` filtering, preprocessing steps, or metadata issues. Issue logged for follow-up.

### 2025-06-12 
#### Removed:
  - Rows 1-7, and 9 using Excel
    - This removes metadata and makes spreadsheets ready to change from wide -> long format using R studio.
#### Added:
  - into external data folder:
    - county_classification.csv
  - into raw data folder:
    - DV_Injury_Type_2020_CO_Counties.csv
    - DV_Injury_Type_2021_CO_Counties.csv
    - DV_Injury_Type_2022_CO_Counties.csv
    - DV_Injury_Type_2023_CO_Counties.csv
    - DV_Injury_Type_2024_CO_Counties.csv
### 2025-06-11
  - Created initial README structure with project goal and questions
  - Manually categorized county using data from [Colorado DOLA](https://cdola.colorado.gov/colorado-community-classification)
