# Exploring Domestic Violence Injuries in Colorado (2020–2024)  
## Urban vs Rural Disparities in Physical and Non-Physical Harm

Comparitvely, a minority of the number of domestic violence cases in Colorado report major physical injuries. The majority are labeled as either **“None”** or **“Apparent Minor Injury.”** This project investigates whether these patterns differ across urban and rural counties and what this may suggest about **coercive control, underreporting, or systemic disparities in response.**

The analysis merges DV injury data with county classification data to explore geographic differences. Trends are visualized using bar graphs, faceted line plots, and urban/rural comparisons. Insights are drawn from five years of data (2020–2024).

---

## Key Questions  
- Do injury type patterns differ between urban and rural counties?  
- What injury types are most frequently reported, and how have they changed from 2020 to 2024?  
- What does the prevalence of "Apparent Minor Injury" and “None” as the top injury types signal?

---

## Data & Tools  
**Data Sources:**  
- 2020–2024 Colorado DV injury type CSVs taken from [Colorado Crime Statistics](https://coloradocrimestats.state.co.us/tops)
  - [Raw Data](/raw_data)
- Urban/rural county classification from the [Colorado Department of Local Affairs](https://cdola.colorado.gov/colorado-community-classification)
  - [External Data](/external_data)

**Tools Used:**  
- Excel for manual removal of metadata
- R for data cleaning and plots can be found [here](/scripts/dvScript.R)
- R for data comparisons between urban/suburban counties can be found [here](scripts/RuralUrbanPlots.R)
---

## Summary of Methods  
- Removed metadata from csv files with excel prior data preparation using R
- Cleaned and reshaped wide-format injury data using `pivot_longer()`  
- Merged counties from Colorado Crime Statistics with urban and rural categorizations
- Aggregated totals by injury type and created accessible, colorblind-friendly visualizations  
- Compared urban vs rural trends across top injury types using faceted plots

---

## Visualizations

### **Total Injuries Reported Across All Years (2020-2024)** 
![Aggregated Injury Types Across](/outputs/dvBarGraphAggregate.png) 
   - Apparent Minor Injury and None were the most frequent reported injuries
   - Apparent Minor Injury accounted for over 50% of reporgs while “None” accounted for over 30% of reports suggesting a large number of **non-physical harms**, such as economic abuse, forced isolation, stalking, harrasment/intimidation, or emotional/psychological control
      - Taken from [Denver District Attorney](https://www.denverda.org/domestic-violence/) and [Rocky Mountain Victim Law Center](https://www.rmvictimlaw.org/learn/legal-information/criminal/domestic-violence-domestic-abuse)
---
### **Top 5 Injuries By Type** 
![**Faceted Trends (Top 5 Injuries)**](/outputs/dvTopFiveFaceted.png)
   - Apparent Minor Injury remained the top injury reported across all years from 2020 - 2024 
   - Possible Internal Injuries, and None trended upward with the largest upward trend in possible internal injury
   - Other Major Injury had a significant jump upward from 2020 - 2021
   - Unconsciousness has steadily declined since 2020
---
### **Urban vs Rural Differences**
![**Urban vs Rural Differences**](/outputs/urbanVsRuralPlots.png) 
   - Rural counties surpassed percentages of total injuries in other major injury, unconsciousneess, severe laceration and loss of teeth compared to urban countiees.
   - Graphs reflect **percent of injury type of all (urban or rural) injuries** to account for population differences.
     - Ex: In 2020, 'Apparent Broken Bones' accounted for ~0.4% of all injuries in rural counties and ~0.6% of all injuries in urban counties.
---

## Key Insights  
- **Some Injuries are Unseen**: The dominance of “None” and "Apparent Minor Injury" as the top two injury types suggest that DV includes both violent and non-violent crime
- **Geographic Disparities Exist**: Naturally, urban areas consistently reported more injuries. However, rural areas saw a much largere variancee between years for violent injuries. See next steps for further analysis needs regarding more accurate comparisons between urban and rural counties.
- **Signifigant Ambiguity is Present**: Minor Injury, None and Possible Internal Injury are vague categories and show a lack of specifity. This may warrant further analysis for what exactly is included in these categories.

---

## Why It Matters  
Injuries in DV cases are not only physical. There seems to be social and psychological elements present. This analysis helps recognize non-physical abuse, and geographic inequities. These insights may support more equitable public health interventions, reporting practices, and victim services. It is also important to note that given the nature of domestic violence and abuse, there are likely many cases that are not reported.

---

## Potential Bias, Flaws, and Next Steps  
- Naive Bayes classification for determining text based keywords from case studies/police reports to understand what 'None' may refer to in police reports
- Add population data to compute **per capita rates** for clearer rural/urban comparisons  
- Merge in **demographic data** (age, gender, race, socio-economic status)  
- Join with **outcome data** (arrests, charges, protection orders)
- Urban vs Rural Differences future versions should explore per capita normalization to better account for population differences between rural and urban areas.
