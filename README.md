# Accidental_Tourist
## Purpose 
Traffic accidents was chosen as our team topic. We are curious to see how much effect Covid had on traffic accidents across the country. We selected traffic accidents during the covid time period because a lot of the country was shut down, many people were working from home, and many businesses were shut down or had limited access. So, in theory, the number of driver's on the road should have decreased. We saw data stored at Kaggle.com and realized we had a good source of data to investigate the Covid effect on traffic accidents. The data covers US Accidents from February 2016 through December 2021. This countrywide dataset covers 49 states in the US using multiple API's (Application Programming Interface) which provide data captured by a variety of entities, such as the US and State Departments of Transportation, law enforcement agencies, traffic cameras, and traffic sensors within the road-networks. There are 2.8 million accident records in this dataset. We may even investigate to see if weather had an additional impact on these accidents.

## In Progress Resources (we may move this section farther down before final submission)

CSVs:
original (columns paired down)
- Accidents_updated.csv:          https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_updated.csv
cleaned                           
- PreCOVID_accidents.csv:         https://accidental-tourist-justinkirk8.s3.amazonaws.com/PreCOVID_accidents.csv
- COVID_accidents.csv:            https://accidental-tourist-justinkirk8.s3.amazonaws.com/COVID_accidents.csv
- Accidents_merged.csv:           https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_merged.csv
joined                            
- PreCOVID_accidents_joined.csv:  https://accidental-tourist-justinkirk8.s3.amazonaws.com/PreCOVID_accidents_joined.csv
- COVID_accidents_joined.csv:     https://accidental-tourist-justinkirk8.s3.amazonaws.com/COVID_accidents_joined.csv
- Accidents_joined.csv:           https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_joined.csv

## Research Question
- What impact has COVID had on the severity of car accidents in the US?
## Clean Dataset Description
The dataset was pulled from the following link: https://smoosavi.org/datasets/us_accidents

### Description of the Data
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

<p align="center">
  <img src="https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/ResearchQuestion_Diagram.png" width="600" />
</p>

### Initial Data Outputs

After cleaning the data, we were able to create two seperate dataframes, one for accidents that occured PreCOVID and another for accidents that has occured after COVID was declared a pandemic in the US. 
- For the PreCOVID dataframe, we used the date range of June 01, 2018 - Februray 29, 2020
- For the COVID dataframe, we used the date range of March 01, 2020 - December 31, 2021

#### PreCOVID_accidents Dataframe

![PreCOVID_Dataframe](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/PreCOVID_data.png)

#### COVID_accidents Dataframe

![COVID_Dataframe](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/COVID_data.png)

With the data cleaned and seperated, we ran the value count function to compare both dateframes to each other and to the orginial cleaned dataframe (accidents_updated)

#### Severity Comparison

We can see there was a slight increase in the severity of accidents that were classified as level 4 during the COVID years as opposed to PreCOVID.

![Severity](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Severity_Counts.png)

We used the following code to group the Severity column into two categories; short_delay and long_delay.

![Severity_Code](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Severity_BinCode.png)

We then ran the comparison on the two categories and the results agree with the overall trend we are seeing, there were more accidents reported in the COVID_accidents
data than the PreCOVID_accidents data and there are significantly more car accidents classified as "short_delay".

![Severity_Comparison](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Severity_Binned_Comparison.png)

#### Top 5 States Comparison

While California remains the State with the most accidents both PreCOVID and during COVID, we see Florida jump to second highest State with accidents occurring in the COVID-accidents data with Texas, Virgina and Pennsylvania also seeing an increase in accidents which brings them into the top 5 states moving Oregan, Minnesota and Utah out of the top 5 states.

![States1](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Top5_overall_count.png)
![States2](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Top5_PreCOVID_count.png)
![States3](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Top5_COVID_count.png)

We decided not to group the States into categories for this portion of the research, however we reconginze more analysis can be run to dive deeper into the State comparison in relation to COVID lockdowns potentially for a future study.
  - Potential Research Question: What impact did the COVID lockdown/quaratine have on the number and severity of car accidents in each state in the US?
  
#### Sunset_Sunrise Comparison

We can see the trend continue where there are more accidents that occur during the day than at night.

![Sunrise_Sunset](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Sunrise_Sunset-Counts.png)

Since this column is already catergorized by "night" and "day", we decided not to catergorize the column any further. 

#### Weather Conditions Comparison

There were 127 different categories of weather condititions included in the original data including categories such as fair, heavy rain, overcast, thunderstorms, etc.

We first needed to run an array to be able to see all of the categories included. 

![Array](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/WeatherConditions_Array.png)

From there we grouped those categories into two categories; "clear_weather", "bad_weather"

![Weather_Code](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/WeatherConditions_BinCode.png)

We can see an overall trend of more accidents were reported during "clear_weather" than "bad_weather".

![Weather_comparison](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/WeatherConditions_Binned_Comparison.png)

#### Year Comparison

Much like the overall trend of accidents occurring, we see an increase in the number of accidents with each year with the most accidents reported in 2021 for all three dataframes. 

![Years](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/Year_Counts.png)

For the comparsion portion of the student we decided not to include the 'Temperature(F)', 'Visibility(mi)', 'Wind_Speed(mph)', 'Precipitation(in)' columns, however, they will be included under as weather variables in the Machine Learning portion of the project.

## GitHub Repository
Justin Kirk is the keeper of the GitHub Repository.
### - One Branch Per Team Member
 - Branches manually created for each team member
 - All work in progress aside from editing the ReadMe should be done in personal branch first
 - Switching to a public repo activated the merge request requiring approval. Send a slack message in #github when you post a request.
### - Each team member has at least 4 commits for the duration of the first segment
 - Be sure to commit as you go so that we can hit this goal.
## Machine Learning Model

### MLM Preliminary Diagram
![Accidental_Tourist/Machine_Learning_Model "Machine_Learning_Diagram"](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Machine_Learning_Model/Machine_Learning_Diagram.png)

### - Takes in Data From the Provisional Database
See code here, https://github.com/justinkirk8/Accidental_Tourist/blob/main/Machine_Learning_Model/Week_1_MLM.ipynb

### - Outputs Label for Input Data
![Accidental_Tourist "Week_1_MLM.ipynb"](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Machine_Learning_Model/Selected_Columns_MLM.png)


## Database Integration
### - Sample Data that Mimics the expected final database structure or schema
### - Draft machine learning model is connected to the provisional database
## Dashboard
### - A bar chart showing the total US volume of accidents for 2016 - 2021
### - A map showing the US states and their volume of accidents for 2018 -2019
### - A map showing the US states and their volume of accidents for 2020 - 2021
https://public.tableau.com/app/profile/kurt.holmberg/viz/Project_test_16587764712720/PreCovidSeverity?publish=yes

