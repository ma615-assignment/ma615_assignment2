library(tidyverse)
library(ggplot2)
library(dplyr)

#male employment of age 15
male_employment <- read.csv("~/desktop/MA_615/ma615_assignment2/males_aged_15plus_employment_rate_percent.csv", header=TRUE)

m_empl <- male_employment %>%
 pivot_longer(!country, names_to = "year", values_to = "rate") %>% as_tibble()

m_em_rate <- m_empl %>% 
  filter(country == "United States") %>% as_tibble()

ggplot(data= m_em_rate, aes(x = year, y = rate))+
  geom_point(col="blue")+
  scale_x_discrete(label = function(x) str_sub(1990:2021))+
  labs(x="year", 
       y = " age 15+ male employment rate",
       subtitle = "U.S. Age 15+ Male Employment Rate ",
       caption = "Source: Gapminder.org") +
  theme_gray()

# female employment of age 15+ 

female_employment<- 
  read.csv("~/desktop/MA_615/ma615_assignment2/females_aged_15plus_employment_rate_percent.csv", header=TRUE)

f_empl <- female_employment %>%
  pivot_longer(!country, names_to = "year", values_to = "rate") %>% as_tibble()

f_em_rate <- f_empl %>% 
  filter(country == "United States") %>% as_tibble()

ggplot(data= f_em_rate, aes(x = year, y = rate))+
  geom_point(col="red")+
  scale_x_discrete(label = function(x) str_sub(1990:2021))+
  labs(x="year", 
       y = " age 15+ female employment rate",
       subtitle = "U.S. Age 15+ Female Employment Rate ",
       caption = "Source: Gapminder.org") +
  theme_gray()


# combine male and female employment rate in one tibble 

employment <-
  as.data.frame((bind_cols(m_em_rate$country, m_em_rate$year, m_em_rate$rate, f_em_rate$rate))) %>% 
  as_tibble()
colnames(employment)[1]<- "country"
colnames(employment)[2]<- "year"
colnames(employment)[3]<- "male"
colnames(employment)[4]<- "female"

  
  
  

