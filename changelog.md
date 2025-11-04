## Changelog

---
### 2025-11-03
#### Updated
- Updated wording in README for clarity and clearer definitions of domestic violence.

---
### 2025-06-16
#### Added
- New dvScriptUrbanSuburban.R script to analyze urban vs rural domestic violence injury patterns (2020–2024).
- Created faceted line plots showing percent composition of injury types within Urban and Rural areas across time.
- Logic to collapse rural-related designations ("rural", "rural resort", "rural resort municipalities") under unified "Rural" classification.
- Injury type facet panels ordered by maximum percentage observed across years to highlight most prevalent injuries.

#### Updated
- Reshaped all county injury datasets from wide to long format for compatibility with urban/rural breakdowns.
- Standardized county name formatting to ensure successful joins with classification data.
- Removed "All Types of Injury" from facet plots to focus on individual injury types only.

---

### 2025-06-15 

#### Added
- Faceted line plots (Step 9) showing separate panels for each of the top 5 injury types across 2020–2024.
- `complete()` logic to fill missing injury_type/year combinations with zeroes.

#### Updated
- All y-axes in faceted plots now start at 0 using `scale_y_continuous(limits = c(0, NA))`.
- Refined aesthetics in facet plots: removed legend, bold facet labels, and applied color + linetype styles for accessibility.

---

### 2025-06-14

#### Fixed
- Corrected Top 5 injury types to be based on total injuries across all years, not just most frequent categories by row count.
- Cleaned and normalized `injury_type` values (case and whitespace) to consolidate duplicates (e.g., "None", " none", "NONE").
- Line plot for top 5 injuries now uses `color` and `linetype` together for colorblind-friendly accessibility.

#### Added
- Bar chart summarizing total injuries by type with count + percentage labels.
- Year-by-injury trend line chart using cleaned top 5 injuries.

---

### 2025-06-13 
#### Added
- Linked R analysis workflow to existing GitHub repository to initiate reproducible documentation.
- Set up structured changelog system for tracking analysis development.

#### Changed
- Switched analysis workflow from SQL to R for initial data wrangling and transformation based on previous cert project experience.

#### Investigating
- Row count discrepancy noted between expected (3,015) and actual (2,880) entries in injury dataset. Potential causes: `NA` filtering, preprocessing steps, or metadata issues. Issue logged for follow-up.

---


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

---

### 2025-06-11
  - Created initial README structure with project goal and questions
  - Manually categorized county using data from [Colorado DOLA](https://cdola.colorado.gov/colorado-community-classification)
