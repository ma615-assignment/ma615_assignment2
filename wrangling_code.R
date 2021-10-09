library(tidyverse)
library(ggplot2)
library(dplyr)

male_employment <- 
  read.csv("~/desktop/MA_615/ma615_assignment2/males_aged_15plus_employment_rate_percent.csv", header=TRUE, check.names = FALSE)
female_employment<- 
  read.csv("~/desktop/MA_615/ma615_assignment2/females_aged_15plus_employment_rate_percent.csv", 
           header=TRUE, check.names = FALSE)
m_empl <- male_employment %>%
  pivot_longer(!country, names_to = "year", values_to = "male")
f_empl <- female_employment %>%
  pivot_longer(!country, names_to = "year", values_to = "female") 

# combine male and female employment rate in one tibble 
employ<- m_empl %>% inner_join(f_empl)

employment <- employ %>% 
  filter(country == "China"|country=="Canada")
 
  
  
  

