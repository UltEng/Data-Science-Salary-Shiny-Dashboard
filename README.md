<h1 align="center">
Data Science Salary Shiny Dashboard
<br>
</h1>

## Background
More and more companies are moving toward data-driven, this makes job in the field of data science becoming high in demand. For people who are interested in the field of data science there are many job title (role) in the field of data science and of course each have a variety of salary. The variety of job title (role) in the field of data science can be overwhelming in deciding which job title (role) to pursue. To help with this decision a Data Science Salaries Dashboard is created 

## Tools

The tools used for this project is 

### R Shiny
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/rshiny.png">

## Dataset 

The Dataset used for this project is acquire from 
https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023

The dataset consist of 11 columns and that are:

1. `work_year`: The year the salary was paid
2. `experience_level`: The experience level in the job during the year
3. `employment_type`: The type of employment for the role
4. `job_title`: The role worked in during the year
5. `salary`: The total gross salary amount paid
6. `salary_currency`: The currency of the salary paid as an ISO 4217 currency code.
7. `salaryinusd`: The salary in USD
8. `employee_residence`: Employee's primary country of residence in during the work year as an ISO 3166 country code
9. `remote_ratio`: The overall amount of work done remotely
10. `company_location`: The country of the employer's main office or contracting branch
11. `company_size`: The median number of people that worked for the company during the year

## Dashboard 

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/dashboard.png">

This Dashboard consist of some element and that are

### Sidebar 

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/sidebar.png">

The Sidebar consist of

1. Overview Page Button: This button function is to move the dashboard page to Overview Page
2. Analysis Page Button: This button function is to move the dashboard page to Analysis Page
3. Data Table Page Button: This button function is to move the dashboard page to Data Table Page
4. Year Filter Button: This button function is to filter  dataset used in the dashboard by year and it affect all the chart in all page used in this dashboard

### Overview Page

The Overview Page will show the overview of the dataset like the number of data, how is the composition of each variable. The element of this page consist of

#### 1. Single Value Chart

This page have three single value chart consist of

##### a. Total Survey
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/singlevaluechart1.png">

This single value chart show the total number of survey from dataset 

##### b. Total Employee Location
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/singlevaluechart2.png">

This single value chart show the total unique count of employee residence from dataset 

##### c. Total Job Title

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/singlevaluechart3.png">

This single value chart show the total unique count of job title from dataset 


#### 2. Select Input Button

This page have two select input button consist of

##### a. Pie Chart Select Input Button
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/input1.png">

This select input button function is to choose what variable to be shown the composition with pie chart (Choices: Experience Level, Employment Type, Remote Ratio and Company Size)

##### b. Horizontal Bar Chart Select Input Button
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/input2.png">

This select input button function is to choose what variable to be shown the top 10 count with horizontal bar chart (Choices: Employee Residence, Company Location, Salary Currency)

#### 3. Pie Chart

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/pie.png">

This chart is made using echarts4r and it will show the composition of selected input 

#### 4. Horizontal Bar Chart 

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/hbar.png">

This chart is made using echarts4r and it will show the top 10 count of selected input 

#### 5. Vertical Bar Chart 

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/vbar1.png">

This chart is made using echarts4r and it will show the top 5 most popular data science job title

### Analysis Page

The Analysis Page will show the salary analysis of the dataset like the statistic summary of salary, the distribution of salary, correlation of other variable toward salary and salary of each job title. The element of this page consist of

#### 1. Single Value Chart

This page have three single value chart consist of

##### a. Average Salary
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/singlevaluechart4.png">

This single value chart show the average salary in USD from dataset 

##### b. Highest Salary
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/singlevaluechart5.png">

This single value chart show the maximum value salary in USD from dataset 

##### c. Lowest Salary

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/singlevaluechart6.png">

This single value chart show the minimum value salary in USD from dataset 

#### 2. Select Input Button

This page have three select input button consist of

##### a. Violin Chart Select Input Button
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/input3.png">

This select input button function is to choose what variable to be group by with violin chart (Choices: Experience Level, Employment Type, Remote Ratio and Company Size)

##### b. Vertical Bar Chart Select Input Button
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/input4.png">

This select input button function is to choose what variable to be group by with vertical bar chart (Choices: Experience Level, Employment Type, Remote Ratio and Company Size)

##### c. Heatmap Select Input Button
<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/input5.png">

This select input button function is to choose what variable to be shown the correlation toward salary in USD with heatmap (Choices: Experience Level, Employment Type, Remote Ratio and Company Size)

#### 3. Violin Chart

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/violin.png">

This chart is made using plotly and it will show the distribution of salary in USD group by selected input 

#### 4. Vertical Bar Chart

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/vbar2.png">

This chart is made using echarts4r and it will show the average salary in USD group by selected input 

#### 5. Heatmap Chart

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/heatmap.png">

This chart is made using echarts4r and it will show the correlation of salary in USD with selected input 


#### 6. Slider Input Button

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/input4.png">

This slider input button function is to choose range of salary in USD to be shown with Table

#### 7. Table

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/table1.png">

This table will show the average salary in USD of each job title based on the range of salary in USD selected in slider 


### Data Table Page

<img src="https://raw.githubusercontent.com/UltEng/Data-Science-Salary-Shiny-Dashboard/master/table2.png">

The Data Table Page consist of a table that show the dataset used in the dashboard 




