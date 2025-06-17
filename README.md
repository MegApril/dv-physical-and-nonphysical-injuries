# Exploring Domestic Violence Injuries in Colorado (2020–2024)  
## Urban vs Rural Disparities in Physical and Non-Physical Harm

Comparitvely, a minority of the number of domestic violence cases in Colorado report major physical injuries. The majority are labeled as either **“None”** or **“Apparent Minor Injury.”** This project investigates whether these patterns differ across urban and rural counties and what this may suggest about **coercive control, underreporting, or systemic disparities in response.**

The analysis merges DV injury data with county classification data to explore geographic differences. Trends are visualized using bar graphs, faceted line plots, and urban/rural comparisons. Insights are drawn from five years of data (2020–2024).

---

## Key Questions  
- Do injury type patterns differ between urban and rural counties?  
- What injury types are most frequently reported, and how have they changed from 2020 to 2024?  
- What does the prevalence of “None” as an injury type signal?

---

## Data & Tools  
**Data Sources:**  
- 2020–2024 Colorado DV injury type CSVs [Colorado Crime Statistics](https://coloradocrimestats.state.co.us/tops)
- Urban/rural county classification from the [Colorado Department of Local Affairs](https://cdola.colorado.gov/colorado-community-classification)  

**Tools Used:**  
- R: `tidyverse`, `janitor`, `forcats`, `ggplot2`, `ggrepel`  
- GitHub for version control, changelog tracking  

---

## Summary of Methods  
- Cleaned and reshaped wide-format injury data using `pivot_longer()`  
- Merged counties from Colorado Crime Statistics with urban/rural categorization  
- Used `complete()` to fill missing combinations of injury type and year  
- Aggregated totals by injury type and created accessible, colorblind-friendly visualizations  
- Compared urban vs rural trends across top injury types using faceted plots

---

## Visualizations

1. **Aggregate Injury Types**  
   - Apparent Minor Injury and None were the most frequent reported injuries  
   - “None” accounted for over **30%** of reports — suggesting a large number of **non-physical harms**, such as economic abuse, forced isolation, stalking, harrasment/intimidation, or emotional/psychological control.
      - These examples are according to the definition of domestic violence from the [Denver District Attorney Website](https://www.denverda.org/domestic-violence/) and the [Rocky Mountain Victim Law Center](https://www.rmvictimlaw.org/learn/legal-information/criminal/domestic-violence-domestic-abuse)

2. **Top 5 Injury Types Over Time**  
   - Apparent Minor Injury remained consistent  
   - Internal Injuries trended slightly upward  
   - “None” grew steadily based on all counties 

3. **Faceted Trends (Top 5 Injuries)**  
   - Disaggregated trendlines offer clarity on injury-type-specific patterns  
   - Some types (e.g., Unconsciousness) declined, while others (e.g., Possible Internal Injury) rose

4. **Urban vs Rural Differences**  
   - Urban counties reported higher total injuries  
   - Rural counties showed **relatively larger increases** in internal injuries, lacerations, and broken bones — possibly reflecting delayed care, isolation, or lower support access  
   - Graphs reflect **percent of total injuries by geography**, but do not adjust for population size. Future iterations should explore per capita normalization to better account for rural population differences.

---

## Key Insights  
- **Some Abuse Is Unseen or Invisible Altogether**: The dominance of “None” and "Apparent Minor Injury" as the top two injury types suggest that DV often leaves unseen injuries
- **Geographic Disparities Exist**: Naturally, urban areas consistently reported more injuries, but some high-severity categories rose in rural areas. See next steps for further analysis needs regarding more accurate comparisons between urban and rural counties
- **Signifigant Ambiguity is Present**: Minor Injury, None and Possible Internal Injury as the top 3 reported injuries show a lack of specifity and may warrant further analysis for why reporting is not more clear

---

## Why It Matters  
Injury reports in DV cases are not only physical. They are also social, environmental and cultural issues impacting society and next generations. This analysis helps recognize non-physical abuse, geographic inequities, and systemic blind or ambiguous spots. These insights may support more equitable public health interventions, reporting practices, and victim services. It is also important to note that given the nature of domestic violence and abuse, there are likely many cases that are not reported.

---

## Potential Bias, Flaws, and Next Steps  
- Naive Bayes classification for determining text based keywords from case studies/police reports to understand what 'None' may refer to in police reports
- Add population data to compute **per capita rates** for clearer and more equitable rural/urban comparisons  
- Merge in **demographic data** (age, gender, race)  
- Join with **outcome data** (e.g., arrests, charges, protection orders)  
