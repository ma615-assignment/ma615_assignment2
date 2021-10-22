library(tidyverse)
library(ggplot2)
library(dplyr)

#started with reading both data sets that I downloaded from gapminder.org

female_employment <- 
  read.csv("https://raw.githubusercontent.com/ma615-assignment/ma615_assignment2/main/females_aged_15plus_employment_rate_percent.csv", header=TRUE, check.names = FALSE)
male_employment<- 
  read.csv("https://raw.githubusercontent.com/ma615-assignment/ma615_assignment2/main/males_aged_15plus_employment_rate_percent.csv", 
           header=TRUE, check.names = FALSE)

#using tidyr command to separate two variables with given names
#using the pipe to help me keep track of my data 
#pivot_long also transform data from row to columns which is more readable
m_empl <- male_employment %>%
  pivot_longer(!country, names_to = "year", values_to = "male")
f_empl <- female_employment %>%
  pivot_longer(!country, names_to = "year", values_to = "female") 

# combine male and female employment rate in one tibble using inner_join()
#matching the row by the key(year)
employ<- m_empl %>% inner_join(f_empl)

#using dplyr:filter() to help me choose my interested countries 
#and aiming for comparison
employment <- employ %>% 
  filter(country == "China"|country=="Canada")
 
  
  
  

