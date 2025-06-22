# Exploring Urban and Rural Domestic Violence Injuries in Colorado (2020–2024)
## Background
In local news, domestic violence cases and community responses is a major area of discussion. Across counties in Colorado, a minority of domestic violence cases report major physical injuries. The majority are categorized as 'None' or 'Apparent Minor Injury.' This project investigates whether these patterns differ across urban and rural counties and what this may suggest about how these crimes are changing over time.

---

## Key Questions and Quick Insights
1. Do injury types differ between urban and rural counties?
  - Yes. In the [top 3 injuries graph](#Top-3-DV-Injuries-by-Percent-Within-Area-Type "Top 3 Rural and Urban Injuries Graph") 'Apparent Minor Injury' and 'None' remained the top two injury types reported in both urban and rural areas. However, the third most reported injury type in rural areas is 'Other Major Injury', and in urban areas it is 'Possible Internal Injury.'

2. What injury types are most frequently reported, and how have they changed from 2020 to 2024?
  - Consistently, the top 2 injury types reported are: 'Apparent Minor Injury' and 'None.' View the aggregated graph showing all injuries from 2020 - 2024 [here](#total-injuries-reported-across-all-years "Total Injuries Reported from 2020-2024 Graph")
  - The third top injury report differs from rural to urban counties with rural areas seeing 'Other Major Injury' as the third most reported, and urban areas seeing 'Possible Internal Injury' as the third most reported.
  - We can see in the [top 5 injuries graph](#top-five-injuries-by-type "Top 5 Injuries Graph") that 'Apparent Minor Injuries' decreased comparing 2020 to 2024, and 'None' increased comparing 2020 to 2024.

3. What does the prevalence of 'Apparent Minor Injury,' and 'None' as the top injuries signal?
  - In order fully to answer this question, further analysis using machine learning could be a step in the right direction. Unfortunately, that analysis technique is currently outside the scope of this project. Training a naive bayesian model with text from police reports, witness statements and court documents may help narrow down the specifics of what is included in these broad categories using text based classification.

## Data & Tools  
**Data Sources:**  
- 2020–2024 Colorado DV injury type CSVs taken from [Colorado Crime Statistics](https://coloradocrimestats.state.co.us/tops)
  - [Raw Data](/raw_data)
- Urban vs Rural county classification from the [Colorado Department of Local Affairs](https://cdola.colorado.gov/colorado-community-classification)
  - [External Data](/external_data)

**Tools Used:**  
- Excel for manual removal of metadata
- R scripts for plots can be found [here](/scripts/dvScript.R)
- R for line graphs and faceted line graphs comparing urban/suburban counties can be found [here](scripts/RuralUrbanPlots.R).
- R for top three urban and rural injuries can be found [here]()

## Summary of Methods  
- Extracted data from Colorado Crime Statistics and Colorado Department of Local Affairs
- Removed metadata from csv files with excel prior to data transformation using R 
- Merged counties from Colorado Crime Statistics with urban and rural categorizations
- Prepared analysis and visualizations using R

---

## Visualizations

### **Top 3 DV Injuries by Percent Within Area Type**
![Top 3 Injuries by Rural or Urban Categorization](/outputs/topThreeByArea.png)
  - While the top two injury types remained the same in both urban and rural areas, the third most reported injury differed from 'Other Major Injury' in rural areas to 'Possible Internal Injury' in urban areas.
 
### **Total Injuries Reported Across All Years** 
![Aggregated Injury Types Across](/outputs/dvBarGraphAggregate.png) 
   - 'Apparent Minor Injury' and 'None' were the most frequently reported injuries.
   - 'Apparent Minor Injury' accounted for over 50% of reporgs while 'None' accounted for over 30% of reports which may suggest a large number of non-physical harms. While further analysis is needed, DV definitions list economic abuse, forced isolation, stalking, harrasment/intimidation, or emotional/psychological control.
      - Taken from [Denver District Attorney](https://www.denverda.org/domestic-violence/) and [Rocky Mountain Victim Law Center](https://www.rmvictimlaw.org/learn/legal-information/criminal/domestic-violence-domestic-abuse)

### **Top 5 Injuries By Type** 
![**Faceted Trends (Top 5 Injuries)**](/outputs/dvTopFiveFaceted.png)
   - Apparent Minor Injury remained the top injury reported across all years from 2020 - 2024. 
   - 'Possible Internal Injury', and 'None' trended upward with the largest upward trend in 'Possible Internal Injury.'
   - Other Major Injury had a significant jump upward from 2020 - 2021.
   - Unconsciousness has steadily declined since 2020.

### **Urban vs Rural Differences**
![**Urban vs Rural Differences**](/outputs/urbanVsRuralPlots.png) 
   - Rural counties surpassed percentages of total injuries in other major injury, unconsciousneess, severe laceration and loss of teeth compared to urban countiees.
   - Graphs reflect percent of injury type of all (urban or rural) injuries to account for population differences.
   - Ex: In 2020, 'Apparent Broken Bones' accounted for ~0.4% of all injuries in rural counties and ~0.6% of all injuries in urban counties.

## Other Takeaways
- Some injuries are unseen which is suggested by the dominance of 'None' and 'Apparent Minor Injury' as the top two injury types.

- Signifigant ambiguity is present in documentation practices. 'Minor Injury', 'None', and 'Possible Internal Injury' are vague categories and show a lack of specifity.

---

## Why It Matters  
DV injuries seem to include more than major physical injuries. This analysis helps recognize this and geographic status may have inequities. These insights supports more equitable public health interventions, reporting practices, which could lead to pinpointing where victim services and advocacy needs exist. It is also important to note that given the nature of domestic violence and abuse, there are likely many cases that are not reported.

---

## Potential Bias, and Next Steps  
- Naive Bayes classification for determining text based keywords from case studies/police reports to understand what 'None' and 'Apparent Minor Injury' may refer to in police reports
- Merge in demographic data (age, gender, race, socio-economic status)  
- Urban vs Rural Differences: future versions should explore per capita normalization to better account for population differences between rural and urban areas.
