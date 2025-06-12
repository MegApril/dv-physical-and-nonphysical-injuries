# When Violence Doesn’t Leave a Mark: The Hidden Majority of Domestic Violence Cases in Colorado

The goal of this project is to compare the number of non-physical injuries vs. physical injuries resulting from domestic violence incidents between urban and suburban counties in Colorado using publicly available crime statistics. This analysis demonstrates SQL joins, basic data cleaning, and regional trend visualization using Tableau.

## Changelog
- **2025-06-12**
  - Removed:
    - Rows 1-7, 9 in using Excel to remove metadata and make spreadsheets ready for wide -> long format using R studio.
  - Added:
    - into external data folder:
      - county_classification.csv
    - into raw data folder:
      - DV_Injury_Type_2020_CO_Counties.csv
      - DV_Injury_Type_2021_CO_Counties.csv
      - DV_Injury_Type_2022_CO_Counties.csv
      - DV_Injury_Type_2023_CO_Counties.csv
      - DV_Injury_Type_2024_CO_Counties.csv
- **2025-06-11**:
  - Created initial README structure with project goal and questions
  - Manually categorized county using data from [Colorado DOLA](https://cdola.colorado.gov/colorado-community-classification)
