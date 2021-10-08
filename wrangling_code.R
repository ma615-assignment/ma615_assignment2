library(tidyverse)
library(ggplot2)
library(dplyr)

#male employment of age 15
male_employment <- read.csv("~/desktop/MA_615/ma615_assignment2/males_aged_15plus_employment_rate_percent.csv", header=TRUE)

m_empl <- male_employment %>%
 pivot_longer(!country, names_to = "year", values_to = "rate") %>% as_tibble()

m_em_rate <- m_empl %>% 
  filter(country == "United States") %>% as_tibble()


# female employment of age 15+ 

female_employment<- 
  read.csv("~/desktop/MA_615/ma615_assignment2/females_aged_15plus_employment_rate_percent.csv", header=TRUE)

f_empl <- female_employment %>%
  pivot_longer(!country, names_to = "year", values_to = "rate") %>% as_tibble()

f_em_rate <- f_empl %>% 
  filter(country == "United States") %>% as_tibble()


# combine male and female employment rate in one tibble 

employment <-
  as.data.frame((bind_cols(m_em_rate$country, m_em_rate$year, m_em_rate$rate, f_em_rate$rate))) %>% 
  as_tibble()
colnames(employment)[1]<- "country"
colnames(employment)[2]<- "year"
colnames(employment)[3]<- "male"
colnames(employment)[4]<- "female"

  
  
  

