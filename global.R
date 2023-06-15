library(shiny)
library(shinydashboard)
library(dplyr) 
library(plotly) 
library(glue)
library(scales) 
library(tidyr) 
library(ggpubr) 
library(lubridate)
library(echarts4r)
library(DT)
library(shinyWidgets)
library(rlang)
library(tidyverse)
library(caret)
library(reshape2)
library(formattable)

options(scipen = 9999)

salary <- read.csv("data_science_salaries.csv")
selectyear <- unique(salary$work_year)

salary <- salary %>%
  arrange(work_year)

selectpiechart <- c("experience_level", "employment_type", "remote_ratio", "company_size")
selectbarchart <- c("employee_residence", "company_location", "salary_currency")