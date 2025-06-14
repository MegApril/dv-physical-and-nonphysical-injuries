# When Violence Doesn’t Leave a Mark: Exploring Domestic Violence Injuries in Colorado

A relatively small amount of domestic violence cases in Colorado have recorded injuries. The majority of cases reported injuries as 'none' or 'apparent minor injury.' The goal of this analysis is to find out if this pattern differs between suburban and urban counties. This could show patterns that are representative of underreporting, differences in classification between counties, or uneven support based on urban or suburban geographic areas. This analysis uses SQL and R for basic data cleaning, and regional trend visualization using Tableau.

## Changelog
- **2025-06-12**
  - Removed:
    - Rows 1-7, and 9 using Excel
      - This removes metadata and makes spreadsheets ready to change from wide -> long format using R studio.
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
