<img width="721" alt="Dashboard" src="https://github.com/tuannguyen19902022/Cause_of_death_project/assets/121286235/6cea2172-9f5c-4828-93c2-47ecea6ddc71"># Cause_of_death_project
In this project, I use SQL to analyze a dataset about the cause of death in the world from 1990 - 2020 and Power BI to visualize the data. The dataset is about the cause of death around the world and can be downloaded at Kaggle
## Problem statement
1. What are the 10 leading causes of death around the world?
2. Top 10 countries with greatest number of deaths
3. What is the trend of cause of death due to Drug use disorder?
4. Trend of 5 leading cause of death in the world over time

## Data cleaning and analysis
- My first step is to download the dataset from Kaggle in csv file, then I use Excel to examine and validate the data to ensure it is in the right format.
- Second step is to load the data into SQL Server Management Studio (SSMS) and perform data analysis

## Data Visualization
- After analysis, I exported data from SQL to Power BI and perform visualization.

# My SQL query for each question: 
/*1. What are the 10 leading causes of death around the world? */
select top 10 ([Causes name]), sum([Death Numbers]) as Total_death
from dbo.Death_cause$
group by [Causes name]
order by Total_death DESC
;

/* 2. Top 10 countries with greatest number of deaths */
select Top 10 Entity, Sum([Death Numbers]) as Total_Death
from dbo.Death_cause$
group by Entity
order by Sum([Death Numbers]) DESC;

/*3. What is the trend of cause of death due to Drug use disorder? */

select [Causes name], sum([Death Numbers]) as Total_Death, Year
from dbo.Death_cause$
where  [Causes name] like '%drug%'
group by year, [Causes name]
order by year;



/*4. Trend of 5 leading cause of death over time? */

select [Causes name], sum([Death Numbers]) as Total_Death, Year
from dbo.Death_cause$
where [Causes name] in ('Cardiovascular diseases', 'Neoplasms', 'Chronic respiratory diseases', 'Lower respiratory infections', 'Neonatal disorders')
group by [Causes name], Year
order by Year;

## Visualization 

<img width="721" alt="Dashboard" src="https://github.com/tuannguyen19902022/Cause_of_death_project/assets/121286235/cdc5e8cc-b8ea-4f92-8c9f-e0e4195642d0">

## Result
- The leading cause of global mortality from 1990 - 2020 is Cardiovascular diseases, Neoplasms and chronic respiratory diseases
- China and India are the two countries with greatest mortality rate, followed by America
- There is a significant increase in death related to drug by 3 times from 65,000 to nearly 200,000 between 1990 and 2020


