# Exploring Domestic Violence Injuries in Colorado (2020–2024)  
## Urban vs Rural Comparison for Physical and Non-Physical Harm

In local news, domestic violence cases and community responses is a major area of discussion. Across counties in Colorado, a minority of domestic violence cases report major physical injuries. The majority are categorized as 'None' or 'Apparent Minor Injury.' This project investigates whether these patterns differ across urban and rural counties and what this may suggest about how these crimes are changing over time.

---

## Key Questions and Quick Insights
- Do injury type patterns differ between urban and rural counties?
  - Yes. As we can see in the [top 3 injuries graph,](#Top-3-DV-Injuries-by-Percent-Within-Area-Type) 'Apparent Minor Injury' and 'None' remained the top two injury types reported in both urban and rural areas. However, the third most reported injury type in Rural areas is 'Other Major Injury', and in Urban areas it is 'Possible Internal Injury.'
- What injury types are most frequently reported, and how have they changed from 2020 to 2024?
  - Consistently, the top 2 injury types reported are: 'Apparent Minor Injury' and 'None.' This is consistent across all years from 2020 - 2024.
  - The third top injury report differs from rural to urban counties. We can see in the [top 5 injuries graph,](#top-five-injuries-by-type) that 'Apparent Minor Injuries' decreased when comparing 2020 to 2024, and 'None' increased comparing 2020 to 2024.
- What does the prevalence of 'Apparent Minor Injury,' and “None” as the top injury types signal?
  - In order fully to answer this question, further analysis using machine learning could be a step in the right direction. Unfortunately, that analysis is currently outside the scope of this project. Training a naive bayesian model with text from police reports, witness statements and court documents may help narrow down the specifics of what is included in these broad categories using text based classification.

---

## Data & Tools  
**Data Sources:**  
- 2020–2024 Colorado DV injury type CSVs taken from [Colorado Crime Statistics](https://coloradocrimestats.state.co.us/tops)
  - [Raw Data](/raw_data)
- Urban vs Rural county classification from the [Colorado Department of Local Affairs](https://cdola.colorado.gov/colorado-community-classification)
  - [External Data](/external_data)

**Tools Used:**  
- Excel for manual removal of metadata
- R scripts for plots can be found [here](/scripts/dvScript.R).
- R for line graphs and faceted line graphs comparing urban/suburban counties can be found [here](scripts/RuralUrbanPlots.R).
---

## Summary of Methods  
- Removed metadata from csv files with excel prior data preparation using R
- Cleaned and reshaped wide-format injury data using `pivot_longer()`  
- Merged counties from Colorado Crime Statistics with urban and rural categorizations
- Aggregated totals by injury type and created accessible, colorblind-friendly visualizations  
- Compared urban vs rural trends across top injury types using faceted plots

---

## Visualizations

### **Top 3 DV Injuries by Percent Within Area Type**
![Top 3 Injuries by Rural or Urban Categorization](/outputs/topThreeByArea.png)

### **Total Injuries Reported Across All Years (2020-2024)** 
![Aggregated Injury Types Across](/outputs/dvBarGraphAggregate.png) 
   - Apparent Minor Injury and None were the most frequent reported injuries
   - Apparent Minor Injury accounted for over 50% of reporgs while “None” accounted for over 30% of reports suggesting a large number of **non-physical harms**, such as economic abuse, forced isolation, stalking, harrasment/intimidation, or emotional/psychological control
      - Taken from [Denver District Attorney](https://www.denverda.org/domestic-violence/) and [Rocky Mountain Victim Law Center](https://www.rmvictimlaw.org/learn/legal-information/criminal/domestic-violence-domestic-abuse)
---
### **Top 5 Injuries By Type** 
![**Faceted Trends (Top 5 Injuries)**](/outputs/dvTopFiveFaceted.png)
   - Apparent Minor Injury remained the top injury reported across all years from 2020 - 2024 
   - 'Possible Internal Injury', and 'None' trended upward with the largest upward trend in 'Possible Internal Injury'
   - Other Major Injury had a significant jump upward from 2020 - 2021
   - Unconsciousness has steadily declined since 2020
---
### **Urban vs Rural Differences**
![**Urban vs Rural Differences**](/outputs/urbanVsRuralPlots.png) 
   - Rural counties surpassed percentages of total injuries in other major injury, unconsciousneess, severe laceration and loss of teeth compared to urban countiees.
   - Graphs reflect **percent of injury type of all (urban or rural) injuries** to account for population differences.
     - Ex: In 2020, 'Apparent Broken Bones' accounted for ~0.4% of all injuries in rural counties and ~0.6% of all injuries in urban counties.
---

## Key Takeaway Summary
Key Question Analysis:
- Do injury type patterns differ betwen urban and rural counties?

- What injury types are most frequently reported, and how have they changed from 2020 - 2024?

- What does the prevalence of 'Apparent Minor Injury' and 'None' as the top injury types signal?
  - In order fully to answer this question, further analysis using machine learning could be a step in the right direction which is outside the scope of this project. Training a naive bayesian model with text from police reports, witness statements and court documents may help narrow down the specifics of what is included in these broad categories using text based classification.

- Some Injuries are Unseen: The dominance of “None” and 'Apparent Minor Injury' as the top two injury types suggest that DV includes both violent and non-violent crime

- Signifigant Ambiguity is Present: 'Minor Injury', 'None', and 'Possible Internal Injury' are vague categories and show a lack of specifity.

---

## Why It Matters  
Injuries in DV cases are not only physical. There seems to be social and psychological elements present. This analysis helps recognize non-physical abuse, and geographic inequities. These insights may support more equitable public health interventions, reporting practices, and victim services. It is also important to note that given the nature of domestic violence and abuse, there are likely many cases that are not reported.

---

## Potential Bias, and Next Steps  
- Naive Bayes classification for determining text based keywords from case studies/police reports to understand what 'None' and 'Apparent Minor Injury' may refer to in police reports
- Merge in demographic data (age, gender, race, socio-economic status)  
- Urban vs Rural Differences: future versions should explore per capita normalization to better account for population differences between rural and urban areas.
