# Accidentally_Late
## Purpose 
Traffic Accidents was chosen as our team topic. We are curious to see the effect Covid had on traffic accidents across the country. We selected traffic accidents during the covid time period because a lot of the country was shut down, many people were working from home, and many businesses were shut down or had limited access. So, in theory, the number of driver's on the road should have decreased. We saw data stored at Kaggle.com and realized we had a good source of data to investigate the Covid effect on traffic accidents. The data covers US Accidents from February 2016 through December 2021. This countrywide dataset covers 49 states in the US using multiple API's (Application Programming Interface) which provide data captured by a variety of entities, such as the US and State Departments of Transportation, law enforcement agencies, traffic cameras, and traffic sensors within the road-networks. There are 2.8 million accident records in this dataset. We may even investigate to see if weather had an additional impact on these accidents.

## In Progress Resources (we may move this section farther down before final submission)

CSVs:

cleaned
 
- Accidents_merged.csv:           https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_merged.csv
- Accidents_sample_merged.csv:    https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_sample_merged.csv

joined                            

- Accidents_joined.csv:           https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_joined.csv
- Accidents_sample_joined.csv:    https://accidental-tourist-justinkirk8.s3.amazonaws.com/accidents_sample_merged.csv

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

### Data Cleaning Process

The following steps were used to clean the dataset.

-	Step 1: Imported the US_Accidents_Dec21_updated.csv file
-	Step 2: Ran the row_count function to get a count of how many rows (data points) were in the initial dataset, “accidents” The code returned a total number of 2,845,342 accidents reported during the time frame of January 01, 2016 – December 31, 2021 in the US. This also allowed us to review the header for the all the columns in the dataset.
-	Step 3: Created an updated dataframe (accidents_updated) keeping the 9 columns previously identified.
-	Step 4: Removed all NaN values from the accidents_upated dataframe
-	Step 5: Ran the row_count function to get a count of the remaining rows in the dataset. The code retuned a new total of 2,245,420 accidents reports removing 599,922 accidents.
-	Step 6: Created a “year” column pulling out the year reported in the “Start_Time” column
-	Step 7: Created a “date” column pulling out the date reported in the “Start_Time” column. As well, changed the date column type from object to integer.
-	Step 8: Dropped the “Start_Time” column since the information extracted from that column was used to create two new columns and with the size of the dataset we wanted to reduce as many inputs as possible
-	Step 9: Renamed the columns names for ease of use in SQL
-	Step 10: Ran row_count function to make sure no rows were lost in the previous steps

After cleaning the data, we were able to create two seperate dataframes, one for accidents that occured PreCOVID and another for accidents that has occured after COVID was declared a pandemic in the US. Each dataset consisted of a 21 month timeframe.

- For the PreCOVID dataframe, we used the date range of June 01, 2018 - Februray 29, 2020

![PreCOVID](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/COVID_Code.png)

- For the COVID dataframe, we used the date range of March 01, 2020 - December 31, 2021

![COVID](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/COVID_Code.png)


![Date_Range](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/DateRange.png)

### Data Exploration 

![DataExploration](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Data_Exploration.png)

#### Dataframe Exploration	

-	How many data points are included in the accidents_updated dataframe and what is the percentage of this dataframe in comparison to the initial dataset?

o There were 2,245,420 accidents that occurred during the January 2016 – December 2021 timeframe. Those accidents accounted for 78.91% of the initial dataset.

-	How many data points are included in the PreCOVID_accidents dataframe and what is the percentage of this dataframe in comparison to the initial dataset? 

o	There were 277,041 accidents that occurred during the June 2018 – Ferbruary 2020 timeframe. Those accidents accounted for 9.73% of the initial dataset. 

-	How many data points are included in the COVID_accidents dataframe and what is the percentage of this dataframe in comparison to the initial dataset?

o	There were 1,928,431 accidents that occurred during the March 2020-December 2021 timeframe. Those accidents accounted for 67.77% of the initial dataset.

The resulting percentages (in relation to the initial dataset) for the dataframes is as follows…

![DataFrameRelationship](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/DataFrame_Relationship.png)

*NOTE-We recognize there is a significant difference between the number of accidents that occurred during the “PreCOVID” timeframe and the “COVID” timeframe by 1,651,390 accidents. There are many factors that could be impacting this difference, however for the purposes of this project, we will not be analyzing those factors*

#### Comparison of Averages	

-	What is the average per dataframe for the following columns: “severity”, “temperature_f”, “visibility_mi”, “wind_speed_mph”, and “precipitation_in”? Are there any significant differences between the averages?

![Average_Comparisons](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Averages_Comparison.png)

*ADD TO THIS SECTION LATER*

#### Individual Column Exploration

What trends are there between the three dataframes in relation to: “severity”, “state”, “weather conditions”, and “sunrise_sunset”?

Severity Comparison

We can see there was a slight increase in the severity of accidents that were classified as level 4 during the COVID years as opposed to PreCOVID.

![SeverityTable](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Severity_Count_table.png)

Top 5 States Comparison

While California remains the State with the most accidents both PreCOVID and during COVID, we see Florida jump to second highest State with accidents occurring in the COVID-accidents data with Texas, Virgina and Pennsylvania also seeing an increase in accidents which brings them into the top 5 states moving Oregan, Minnesota and Utah out of the top 5 states.

![TopStates](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Top5_States_table.png)

We decided not to group the States into categories for this portion of the research, however we recognize more analysis can be run to dive deeper into the State comparison in relation to COVID lockdowns potentially for a future study.

  - Potential Research Question: What impact did the COVID lockdown/quarantine have on the number and severity of car accidents in each state in the US?
  
*MAY ADD REGIONAL DATA*

Sunset_Sunrise Comparison

We can see the trend continue where there are more accidents that occur during the day than at night.

![SunriseTable](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/SunriseSunset_Count_table.png)

Since this column is already categorized by "night" and "day", we decided not to categorize the column any further. 

Weather Conditions Comparison

There were 127 different categories of weather conditions included in the original data including categories such as fair, heavy rain, overcast, thunderstorms, etc. 
Therefore, we decided to review the top 5 weather conditions much like we did for the state comparison. We can see that both the PreCOVID and COVID dataframes follow the trend of the accidents_updated dataframe with Fair, Cloudly, Mostly Cloudy, and Light Rain being the top 5 weather conditions reported during the occurrence of accidents. 

![TopWeather](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Top5_Weather_table.png)

Year Comparison

Much like the overall trend of accidents occurring, we see an increase in the number of accidents with each year with the most accidents reported in 2021 for all three dataframes. 

![Years](https://github.com/justinkirk8/Accidental_Tourist/blob/main/Resources/images/Database/Year_Comparison.png)

## Join in pgAdmin

### Importing tables

- Two tables were created from the CSVs created above:
 - The accident_merged.csv was used to create a table inteded to be used for data visualization
 - The accident_sample_merged.csv was used to create a table intended to be used for machine learning
- The US_State_Region.csv was used to create a table which contains the region and division for each state
- The Database Diagram below shows the type of data found in each column of the three tables

![DBD](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/sql_join/DBD.png)

### Joining 

- Two tables were created by joining each of the accident tables with the us_state_region table
- CSV files were created using these two new tables
- The code below is an example of the join code

![Join_code](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/sql_join/join_example.png)

## GitHub Repository
Justin Kirk is the keeper of the GitHub Repository.
### - One Branch Per Team Member
 - Branches manually created for each team member
 - All work in progress aside from editing the ReadMe should be done in personal branch first
 - Switching to a public repo activated the merge request requiring approval. Send a slack message in #github when you post a request.
### - Each team member has at least 4 commits for the duration of the first segment
 - Be sure to commit as you go so that we can hit this goal.
 - While in process, all patch branches will be kept. Once final commit count is made for deliverable 4, all patch branches will be removed.
 
## Machine Learning Model

### MLM Preliminary Diagram
![Accidentally_Late/Machine_Learning_Model "Machine_Learning_Diagram"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Machine_Learning/Machine_Learning_Diagram.png)

### - Takes in Data From the Provisional Database
See code here, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Archive/Week_1_MLM.ipynb

### - Outputs Label for Input Data
![Accidentally_Late "Week_1_MLM.ipynb"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Machine_Learning/Selected_Columns_MLM.png)


## Database Integration
### - Sample Data that Mimics the expected final database structure or schema
### - Draft machine learning model is connected to the provisional database
## Dashboard
### - A line chart showing the total US volume of accidents for 2018 - 2021
### - A bar chart showing the top 5 states and their volume of accidents for 2018 -2019
### - A bar chart showing the top 5 states and their volume of accidents PreCOVID
### - A bar chart showing the top 5 states and their volume of accidents COVID
### - A bar chart showing the accident volume per the top 5 weather conditions with day or night and PreCovid and COVID.
### - A map showing the US regions and hover over the states and their volume of accidents for all, PreCovid, or COVID will show.  Adjust filter to see one of the three volumes.
### - An interactive story was added.
https://public.tableau.com/app/profile/kurt.holmberg/viz/ProjectBook2_16592207802480/Story1?publish=yes


