# Exploring Domestic Violence Injuries in Colorado (2020–2024)  
## Urban vs Rural Disparities in Physical and Non-Physical Harm

A relatively small number of domestic violence cases in Colorado report physical injuries. The majority are labeled as either **“None”** or **“Apparent Minor Injury.”** This project investigates whether these patterns differ across urban and rural counties and what this may suggest about **coercive control, underreporting, or systemic disparities in response.**

The analysis merges DV injury data with county classification metadata to explore geographic and temporal differences. Trends are visualized using bar graphs, faceted line plots, and urban/rural comparisons. Insights are drawn from five years of data (2020–2024).

---

## Key Questions  
- Do injury type patterns differ between urban and rural counties?  
- What injury types are most frequently reported, and how have they changed from 2020 to 2024?  
- Does the prevalence of “None” as an injury type signal psychological abuse or coercive control?

---

## Data & Tools  
**Data Sources:**  
- 2020–2024 Colorado DV injury type CSVs (Colorado Bureau of Investigation)  
- Urban/rural county classification from the Colorado Department of Local Affairs (DOLA)  

**Tools Used:**  
- R: `tidyverse`, `janitor`, `forcats`, `ggplot2`, `ggrepel`  
- GitHub for version control, changelog tracking  

---

## Summary of Methods  
- Cleaned and reshaped wide-format injury data using `pivot_longer()`  
- Merged counties with manually classified urban/rural categories  
- Used `complete()` to fill missing combinations of injury type and year  
- Aggregated totals by injury type and created accessible, colorblind-friendly visualizations  
- Compared urban vs rural trends across top injury types using faceted plots

---

## Visualizations

1. **Aggregate Injury Types**  
   - Apparent Minor Injury and None were the most frequent reported injuries  
   - “None” accounted for over **30%** of reports — suggesting a large number of **non-physical harms**, such as emotional abuse, coercion, or psychological control

2. **Top 5 Injury Types Over Time**  
   - Apparent Minor Injury remained consistent  
   - Internal Injuries trended slightly upward  
   - “None” grew steadily — reinforcing the need to account for invisible trauma

3. **Faceted Trends (Top 5 Injuries)**  
   - Disaggregated trendlines offer clarity on injury-type-specific patterns  
   - Some types (e.g., Unconsciousness) declined, while others (e.g., Possible Internal Injury) rose

4. **Urban vs Rural Differences**  
   - Urban counties reported higher total injuries  
   - Rural counties showed **relatively larger increases** in internal injuries, lacerations, and broken bones — possibly reflecting delayed care, isolation, or lower support access  
   - Graphs reflect **percent of total injuries by geography**, but do not adjust for population size. Future iterations should explore per capita normalization to better account for rural population differences.

---

## Key Insights  
- **Psychological Abuse Is Often Invisible**: The dominance of “None” as an injury type suggests that DV often leaves no visible marks — yet these cases still involve harm  
- **Geographic Disparities Exist**: Urban areas consistently reported more injuries, but some high-severity categories rose in rural areas  
- **Data Gaps Required Completion**: Many county-year combinations were missing; we used `tidyr::complete()` to fill them and improve comparison validity

---

## Why It Matters  
Injury reports in DV cases are not just physical—they are environmental too. This analysis helps recognize non-physical abuse, geographic inequities, and systemic blind spots. These insights may support more equitable public health interventions, reporting practices, and victim services. It is also important to note that given the nature of domestic violence, there are likely many cases that are not reported.

---

## Potential Bias, Flaws, and Next Steps  
- Add population data to compute **per capita rates** for rural/urban comparisons  
- Merge in **demographic data** (age, gender, race)  
- Join with **outcome data** (e.g., arrests, charges, protection orders)  
- Automate annual update pipeline for **real-time monitoring**
