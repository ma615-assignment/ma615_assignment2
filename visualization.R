#started with sourcing my wrangling code
source(file = "wrangling_code.R", echo = TRUE)

#using ifelse() function to help me identifying two country on the plot

color = ifelse(employment$country=="China", "blue", "red") 
a = ifelse(employment$country=="Canada", 0, 1)

#using ggplot to compare male employment rate in China and Canada
plot1 <-
  ggplot(data = employment)+
  geom_line(aes(x=year, y =male, col=country, group=a))+
  geom_point(aes(x=year, y = male, colour=country, group=a))+
  labs(x="Year", 
       y = " Maleage 15+ employment rate",
       subtitle = "China vs. Canada Male Age 15+ Employment Rate ",
       caption = "Source: Gapminder.org") +
  theme_bw()+
  theme(text = element_text(size = 7), element_line(size = 0.1))
plot1

#using ggplot to compare female employment rate in China and Canada
plot2 <- ggplot(data = employment)+
  geom_line(aes(x=year, y =female, col=country, group=a))+
  geom_point(aes(x=year, y = female, colour=country, group=a))+ 
  labs(x="Year", 
       y = " Female age 15+ employment rate",
       subtitle = "China vs. Canada Female Age 15+ Employment Rate ",
       caption = "Source: Gapminder.org") +
  theme_bw()+
  theme(text = element_text(size = 7), element_line(size = 0.1))
plot2


