# Accidentally_Late
## Purpose 
Traffic Accidents was chosen as our team topic. We are curious to see the effect Covid had on traffic accidents across the country. We selected traffic accidents during the covid time period because a lot of the country was shut down, many people were working from home, and many businesses were shut down or had limited access. So, in theory, the number of driver's on the road should have decreased. We saw data stored at Kaggle.com and realized we had a good source of data to investigate the Covid effect on traffic accidents. The data covers US Accidents from January 2016 through December 2021. This countrywide dataset covers 49 states in the US using multiple API's (Application Programming Interface) which provide data captured by a variety of entities, such as the US and State Departments of Transportation, law enforcement agencies, traffic cameras, and traffic sensors within the road-networks. 

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

## Description of Datasets

We pulled our source data from two different datasets...

The first dataset we used was the US-Accidents: A Countrywide Traffic Accident Dataset and was pulled from the following link: https://smoosavi.org/datasets/us_accidents

The second dataset we used was the US Census Bureau Regions and Divisions by State and was pulled from the following link: 
https://github.com/cphalpert/census-regions

### Description of the US-Accidents: A Countrywide Traffic Accident Dataset

This dataset included 47 total columns, however, we only included the following columns for the purpose of this project...

- Severity	: Shows the severity of the accident, a number between 1 and 4, where 1 indicates the least impact on traffic (i.e., short delay as a result of the accident) and 4 indicates a significant impact on traffic (i.e., long delay).
- Start_Time: Shows start time of the accident in local time zone.
- State: Shows the state in address field.
- Temperature(F): Shows the temperature (in Fahrenheit).
- Visibility(mi): Shows visibility (in miles).
- Wind_Speed(mph): Shows wind speed (in miles per hour).
- Precipitation(in): Shows precipitation amount in inches, if there is any.
- Weather_Condition: Shows the weather condition (rain, snow, thunderstorm, fog, etc.)
- Sunrise_Sunset: Shows the period of day (i.e. day or night) based on sunrise/sunset.

### Description of the US Census Bureau Regions and Divisions by State Dataset

The owner of this dataset, Chris Halpert, was able to pull state data from the Census.gov website using the maps-data pdf. He converted the data in the pdf file into a csv file that we downloaded to use in this study. 

The dataset contained 4 columns; State, State_code, Region and Division. 

The Region column provided a breakdown of the US States into 4 different regions...
- Midwest
- Northeast
- South
- West

The Division column provided a breakdown of the US States into 7 different divisions...
- East North Central
- Middle Alantic
- Mountain
- New England
- Pacific
- South Atlantic
- West North Central

### Data Cleaning Process

The following steps were used to clean the US-Accidents: A Countrywide Traffic Accident Dataset.

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

For the US Census Bureau Regions and Divisions by State dataset, the csv provided was already in a cleaned format so no additioanl steps needed to be taken to clean it any further. 

After cleaning the data, we were able to use the accidents_updated dataframe to create two seperate dataframes, one for accidents that occured before COVID was declared a pandemic in the US (PreCOVID_accidents) and another for accidents that has occured after COVID was declared a pandemic in the US (COVID_accidents). 

We reviewed the months the data provided for accidents since COVID and there were a total of 21 months of data provided. To remove unintentional bias from the study, we decided to only look at 21 months prior to COVID being declared a pandemic. Therefore, each dataset consisted of a 21 month timeframe.

- For the PreCOVID dataframe, we used the date range of June 01, 2018 - Februray 29, 2020

![PreCOVID](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/PreCOVID_Code.png)

- For the COVID dataframe, we used the date range of March 01, 2020 - December 31, 2021

![COVID](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/COVID_Code.png)

We continued to use the initial cleaned dataframe (accidents_updated) throughout the project so that we could provide an additional layer of analysis by using that dataframe to give us an snapshot into the overall trends of the accidents that occured so that we could have an overall trend to compare the PreCOVID and COVID dataframes against. 

![Date_Range](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/DateRange.png)

### Data Exploration 

The following organizational structure was used to guide the exploration of the data so that we could gather an understanding of the data before we began the data analysis phase of the project.

![DataExploration](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Data_Exploration.png)

#### Individual Dataframe Exploration	

Before moving into the data analysis portion of the project, we first had to understand the data. To do so we first looked at each individual dataset to determine the values we would be using and what percentage each dataset represented from the source data. This method of breaking down the data was used due to there being over 2.8 million datapoints in the source data and in doing so it provided a foundational layer of information to guide us through what elements of the data we should use as we moved into the analysis phase of the project. 

-	How many data points are included in the accidents_updated dataframe and what is the percentage of this dataframe in comparison to the initial dataset?

o There were 2,245,420 accidents in this dataframe. Those accidents accounted for 78.91% of the initial accidents dataset.

-	How many data points are included in the PreCOVID_accidents dataframe and what is the percentage of this dataframe in comparison to the initial dataset? 

o	There were 277,041 accidents in this dataframe. Those accidents accounted for 9.73% of the initial accidents dataset. 

-	How many data points are included in the COVID_accidents dataframe and what is the percentage of this dataframe in comparison to the initial dataset?

o	There were 1,928,431 accidents in this dataframe. Those accidents accounted for 67.77% of the initial accidents dataset.

The resulting percentages (in relation to the initial accidents data) for the dataframes is as follows…

![DataFrameRelationship](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/DataFrame_Relationship.png)

*NOTE-We recognize there is a significant difference between the number of accidents that occurred during the “PreCOVID” timeframe and the “COVID” timeframe by 1,651,390 accidents. There are many factors that could be impacting this difference, however for the purposes of this project, we will not be analyzing those factors. Researching the factors that are impacting that difference is a topic that can be explored further in future studies.*

#### Comparison of Averages	

-	What is the average per dataframe for the following columns: “severity”, “temperature_f”, “visibility_mi”, “wind_speed_mph”, and “precipitation_in”? Are there any differences between the averages?

The overall research question this project attempts to answer is if COVID had an impact on the severity of car accidents in the US. The "temperature_f”, “visibility_mi”, “wind_speed”, and “precipitation_in” columns all provided mathematical data. To better understand how these factors were represented in each data frame we ran the mean() function to review the averages of each column.

![Average_Comparisons](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Averages_Comparison.png)

The results show the averages for both the PreCOVID accidents and the COVID accidents are comparable to the overall trend of accidents in the US.

In relation to the average severity recorded in the overall trend of accidents during the 2016-2020 timeframe reading at 2.08. Accidents that occurred during the PreCOVID timeframe were higher than the overall trend showing the severity at 2.24. Accidents that occurred during the COVID timeframe lower than the overall trend showing the severity at 2.08. 

In relation to the temperature recorded at the time of the accidents, the average overall temperature at the time of the accidents was 61.84 F. The average temperature during the PreCOVID timeframe was 58.70 F which is lower than the overall trend. The average temperature during the COVID timeframe was 62.46 F which is higher than the overall trend.

In relation to the visibility recorded at the time of the accidents, the average overall visibility at the time of the accidents was 9.01 miles. The average visibility during the PreCOVID timeframe was 8.87 miles which is lower than the overall trend. The average visibility during the COVID timeframe was 9.08 miles which is higher than the overall trend.

In relation to the wind speed recorded at the time of the accidents, the average overall wind speed at the time of the accidents was 7.18 miles per hour. The average wind speed during the PreCOVID timeframe was 6.97 miles per hour which is lower than the overall trend. The average wind speed during the COVID timeframe was 7.16 miles which is also lower than the overall trend.

In relation to the precipitation recorded at the time of the accidents, the average overall precipitation at the time of the accidents was .006 inches. The average precipitation during the PreCOVID timeframe was the same as the overall trend. The average precipitation during the COVID timeframe was .005 inches lower than the overall trend.


#### Additional Column Exploration

What trends are present in relation to the remaining columns: “severity”, “state”, “weather conditions”, “sunrise_sunset”, and "year"?

After exploring the mathematical columns, we ran the value_count() function on the remaining columns to better understand the trends in relation to the state the accidents occured in, the weather condition at the time of the accident, and in the time of day (day or night).

*Severity*

We can see there was a slight increase in the severity of accidents that were classified as level 4 during the COVID years as opposed to PreCOVID.

![SeverityTable](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Severity_Count_table.png)

*State*

While California remains the State with the most accidents both PreCOVID and during COVID, we see Florida jump to second highest State with accidents occurring in the COVID-accidents data with Texas, Virgina and Pennsylvania also seeing an increase in accidents which brings them into the top 5 states moving Oregan, Minnesota and Utah out of the top 5 states.

![TopStates](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Top5_States_table.png)

We decided not to group the States into categories for this portion of the research, however we recognize more analysis can be run to dive deeper into the State comparison in relation to COVID lockdowns potentially for a future study.

  - Potential Research Question: What impact did the COVID lockdown/quarantine have on the number and severity of car accidents in each state in the US?

*Weather_Conditions*

There were 127 different categories of weather conditions included in the original data including categories such as fair, heavy rain, overcast, thunderstorms, etc. 
Therefore, we decided to review the top 5 weather conditions much like we did for the state comparison. We can see that both the PreCOVID and COVID dataframes follow the trend of the accidents_updated dataframe with Fair, Cloudly, Mostly Cloudy, and Light Rain being the top 5 weather conditions reported during the occurrence of accidents. 

![TopWeather](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/Top5_Weather_table.png)

*Sunset_Sunrise*

We can see the trend continue where there are more accidents that occur during the day than at night.

![SunriseTable](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Database/SunriseSunset_Count_table.png)

Since this column is already categorized by "night" and "day", we decided not to categorize the column any further. 

*Year*

Much like the overall trend of accidents occurring in the US, we see an increase in the number of accidents with each year with the most accidents reported in 2021 for all three dataframes. 

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
 
## Machine Learning Model (MLM)

### Supervised Learning Diagram
![Accidentally_Late/Machine_Learning_Model/Visuals "Supervised_Learning"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Supervised_Learning.png)

### MLM Preliminary Diagram
![Accidentally_Late/Machine_Learning_Model "Machine_Learning_Diagram"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Resources/images/Machine_Learning/Machine_Learning_Diagram.png)

### - MLM Data Processing - Feature Selection & Engineering 
The data went through several phases of processing as discussed with the team -
- Many of these phases are described in the Data Exploration portion of this document. 
- It was determined to focus on the weather related and georgraphical region variables as they include a combination of discreet and continuous variables. 
- The columns included and engineered for MLM are - 
   - "Severity" - the target which was transformed to a binary classification of long and short traffic delay accidents
   - "Region" - discreet variable; 4 geographic regions within the U.S.; used get_dummies to transform the string data to integers
   - "Temperature" - continuous variable; measured in Fahrenheit degrees
   - "Visiblity" - continuous variable; measured in miles
   - "Wind Speed" - continuous variable; measured in miles per hour
   - "Preciptiation" - continuous variable; measured in inches
   - "Weather Condition" - transformed to a binary discreet variable; reworked into "clear weather" and "bad weather" using binning
   See binning description and code here, https://github.com/justinkirk8/Accidentally_Late/blob/main/Database/MLM_database_prep_7.27.2022.ipynb
   - "Sunrise Sunset" - transformed to a binary discreet variable; day versus night converted to 0 and 1
   - "Classification" - transformed to a binary discreet variable; Covid and PreCovid years discussed in the data exploration portion of this document        converted to 0 and 1; the dataset was resampled to 250,000 instances each for a total of 500,000 accidents. 
- Data was imbalanced raw (before) and after processing and resampling: 
   
### - Split Training & Testing Data
- Target binary class column "severity" was assigned to "y"
- All other columns were assigned to "X" (variables/features)
- Recommended training and testing sets are between 70-80%, and 20-30%, respectively
- Train_test_Split was imported from Sklearn.model_selection to split the data into train and test samples
![Accidentally_Late/Machine_Learning_Model/Visuals "Split_Data_Training_Testing"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Split_Data_Training_Testing.png)


### - Model Choice - Supervised Machine Learning - Limitations & Benefits

Supervised Learning is a Machine Learning approach using labeled datasets designed to train (supervise) algorithms into predicting outcomes accurately. Through the use of labeled inputs and outputs, supervised learning models are designed to maximize overall accuracy and learn over time or iteratively with modified parameters, more data and/or more features (variables).

Imbalanced datasets occur when there is an unequal distribution of classes in the original and training datasets. Majority and minority classes exist resulting in a high accuracy for the majority target class (short delay) and a low accuracy for the minority class (long delay). Data imbalance can lead to inaccurate predictive results as classification errors are more predominant in the minority class, which is the more important predictive class. 

![Accidentally_Late/Machine_Learning_Model/Visuals "Imbalanced_Data_Chart"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Imbalanced_Data_Chart.png)

Supervised Learning models work best when the sample size between the target class labels (what you are trying to predict) are equal. To compensate for this shortcoming, oversampling of the minority class and/or undersampling of the majority class are techniques used exclusively or in combination to achieve the best accuracy results. 

![Accidentally_Late/Machine_Learning_Model/Visuals "Under_Oversampling_Diagram"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Under_Oversampling_Diagram.png)

Supervised Learning models are good for classification problems and allow data collection from a previous experience, and are able to produce a data output. Limitations include always in need of updates and can easily be overfitted. In addition, supervised learning models have an inability to learn by itself and cannot give unknown information from the training data. 

### - Trained and ReTraining 
Using the top model performer, Random Forest Classifier a F1 comparison score analysis was performed on three data subsets - 
1) the state of Florida
2) Covid time - 21 months 
3) PreCovid time - 21 months 

![Accidentally_Late/Machine_Learning_Model/Visuals "RFC_SubsetF1_summary.png"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/RFC_SubsetF1_summary.png)

### Machine Learning Model Conclusion - Confusion Matrices & Accuracy Scores
Overall, the models did not perform well with the dataset features in predicting "long delay" traffic. The minority class was not adequately predicted despite the higher accuracy and classification scores in some models. The confusion matrix sheds insight into the inadequacy in regards to predicitng "long delays." Particular attention is focused on the F1 score which is the harmonic mean between precision and recall and is designed to work well in measuring the model performance on imbalanced data. In short, the F1 score sums up predictive performance. 

The overall best performing models looking at all scores were -
- RandomForestClassifier
- Naive Random Oversampling
- SMOTE Oversampling

MODEL SCORE SUMMARY -

Random Forest Classifer
![Accidentally_Late/Machine_Learning_Model/Visuals "CM_RFC"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/CM_RFC.png)

Naive Random Oversampling
![Accidentally_Late/Machine_Learning_Model/Visuals "CM_Naive_RO"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/CM_Naive_RO.png)

SMOTE Oversampling
![Accidentally_Late/Machine_Learning_Model/Visuals "CM_Smote"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/CM_Smote.png)

SMOTE-ENN
![Accidentally_Late/Machine_Learning_Model/Visuals "CM_Smoteen"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/CM_Smoteen.png) 

SVM (Support Vector Machine)
![Accidentally_Late/Machine_Learning_Model/Visuals "CM_SVM"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/CM_SVM.png) 

Gradient Booster Classifier
![Accidentally_Late/Machine_Learning_Model/Visuals "CM_GradientBC"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/CM_GradientBC.png)

SCORES SUMMARY BAR CHART
![Accidentally_Late/Machine_Learning_Model/Visuals "Scores_Summary_barchart"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Scores_Summary_barchart.png)

The MLM shows the Random Forest Classifier as the better performer when taking into account all scores with particular attention to the F1 score. Although the dataset doesn't adequately predict severity, although the volume of accidents increased during Covid, there is no indication that these factors are useful in predicting "long delays" or severity. 

See code here for Random Forest Classifier, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/ASJ_Model_Files/ASJ_RandomForestClassifier.ipynb<br>

See code here for Naive Random Oversampling, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/ASJ_Model_Files/ASJ_Naive_Random_Oversampling.ipynb<br>

See code here for SMOTE Oversampling, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/ASJ_Model_Files/ASJ_SMOTE_Oversampling.ipynb<br>

See code here for SMOTE-ENN, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/ASJ_Model_Files/ASJ_SMOTEEN.ipynb<br>

See code here for SVM, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/ASJ_Model_Files/ASJ_SVM.ipynb<br>

See code here for Gradient Booster Classifier, https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/ASJ_Model_Files/ASJ_GradientBoosterClassifier.ipynb<br>

### Statistical Analysis 
The correlation heatmap image shows no strong correlation between the features in the dataset. A low correlation score (close to 0) shows no relationship between two features and is typically desireable for Machine Learning models. 
![Accidentally_Late/Machine_Learning_Model/Visuals "Corr_Heatmap.png"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Corr_Heatmap.png)

The Random Forest Classifier has a rank features function. Temperature was the top feature.
![Accidentally_Late/Machine_Learning_Model/Visuals "Ranked_Features"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Ranked_Features.png)

The top ranked features for the data subsets: Florida, COVID time and PreCovid time all rank temperature high.
![Accidentally_Late/Machine_Learning_Model/Visuals "Top_Features_Comparison_Subsets.png"](https://github.com/justinkirk8/Accidentally_Late/blob/main/Machine_Learning_Model/Visuals/Top_Features_Comparison_Subsets.png)


## Sources –
1. (https://www.ibm.com/cloud/blog/supervised-vs-unsupervised-learning)<br>
2. (https://machinelearningmastery.com/imbalanced-classification-with-python/)<br>
3. (https://scikit-learn.org)
4. (https://pythonistaplanet.com/pros-and-cons-of-supervised-machine-learning/)
5. (https://towardsdatascience.com/why-feature-correlation-matters-a-lot-847e8ba439c4)
6. (https://www.mastersindatascience.org/learning/statistics-data-science/undersampling/)

## Dashboard
The Dashboard and Story were created using Tableau.  After each of the processes,  Tableau was used to view the data.  There were times the charts showed things that were not  easily seen looking at the numbers.  These things helped guide the analysis.

The first Dashboard:
A line chart showing the total US volume of accidents for 2018 through 2021 showed that the number of accidents increased after COVID started.  The data was broken up between preCOVID and COVID time frames.  The line chart can switch and show the full time frame, preCOVID time and COVID time.

A map with the regions of the US and the individual states was created.  The states when highlighted shows the total number of accidents during the time period select.

The second Dashboard:
Three bar charts were created to show the top five states that had the largest volume of accidents during full time frame, preCOVID, and COVID.

The third Dashboard:
This is not a Dashboard but just a page of the book showing accident volumes during preCOVID and COVID.  Not only does this bar chart show the top five weather conditions but also has them broken apart by day or night.

The fourth Dashboard:
There are two bar charts in this dashboard.  One shows the top five features from Random Forest Classifier versus their ranking.

The second bar chart shows the machine learning models score summary where each model is plotted against its rating value.


The Story:
A story was created using each of these Dashboards to tell the story of US Accident Volumes during PreCOVID and COVID time frames.
![image](https://user-images.githubusercontent.com/98991575/183264485-69651cea-8d30-4fca-9239-de53e94ee8ab.png)


https://public.tableau.com/app/profile/kurt.holmberg/viz/ProjectBook2_16592207802480/Story1?publish=yes

