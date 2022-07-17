# Accidental_Tourist
## Purpose 
Traffic accidents was chosen as our team topic. We are curious to see how much effect Covid had on traffic accidents across the country. We saw data stored at Kaggle.com and realized that we had a good source of data to investigate the Covid effect on traffic accidents. The data covers US Accidents from February 2016 through December 2021. This countrywide dataset covers 49 states in the US using multiple API's (Application Programming Interface) which provide data captured by a variety of entities, such as the US and State Departments of Transportation, law enforcement agencies, traffic cameras, and traffic sensors within the road-networks. There are 2.8 million accident records in this dataset. We may even investigate to see if weather had an additional impact on these accidents.
- Selected topic
- Reason Topic Was Selected
- Description of the Source of Data
- Questions Hoped to Answer with the Data
## Research Question
- What impact has COVID had on the severity of car accidents in the US?
## Clean Dataset Description
The dataset was pulled from the following link: https://smoosavi.org/datasets/us_accidents

### Description of the Data Included
The dataset included 47 columns, however, we only included the following columns for the purpose of this project...
- Severity	: Shows the severity of the accident, a number between 1 and 4, where 1 indicates the least impact on traffic (i.e., short delay as a result of the accident) and 4 indicates a significant impact on traffic (i.e., long delay).
- Start_Time: Shows start time of the accident in local time zone.
- State: Shows the state in address field.
- Temperature(F): Shows the temperature (in Fahrenheit).
- Visibility(mi): Shows visibility (in miles).
- Wind_Speed(mph): Shows wind speed (in miles per hour).
- Precipitation(in): Shows precipitation amount in inches, if there is any.
- Weather_Condition: Shows the weather condition (rain, snow, thunderstorm, fog, etc.)
- Sunrise_Sunset: Shows the period of day (i.e. day or night) based on sunrise/sunset.

Additional tasks to be completed as we continue the research to narrow down the results...
- Potenitally grouping the Severity column into 2 bins; Minor Accidents: serverity 1 & 2, Major Accidents: severity 3 & 4
- Find a way to group the Start_Time column into a few bins, maybe into increments of every 4-6 hours
- Potentially grouping the Visibilitycolumn into 4 bins; 10 -> high visibility, 7-9 -> decent visibility, 4-6 poor visibility, 0-3 low visibility

## GitHub Repository
Justin Kirk is the keeper of the GitHub Repository.
### - One Branch Per Team Member
 - Branches manually created for each team member
 - All work in progress aside from editing the ReadMe should be done in personal branch first
 - Switching to a public repo activated the merge request requiring approval. Send a slack message in #github when you post a request.
### - Each team member has at least 4 commits for the duration of the first segment
 - Be sure to commit as you go so that we can hit this goal.
## Machine Learning Model
### - Takes in Data From the Provisional Database
### - Outputs Label for Input Data
## Database Integration
### - Sample Data that Mimics the expected final database structure or schema
### - Draft machine learning model is connected to the provisional database
## Dashboard
### - No deliverables associated with the dashboard for this segment
