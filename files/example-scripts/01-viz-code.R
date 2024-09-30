# load libraries
library(tidyverse)
library(gapminder) # install this if you don't have it!
library(socviz) # install this if you don't have it!


# look at data
gapminder # prints a preview of the data
?gapminder # ?data shows you the data's codebook

# subset data to focus on 2007
gap_07 = 
  gapminder %>% 
  filter(year == 2007)


# the final product
ggplot(gap_07, aes(x = gdpPercap, y = lifeExp, 
                   color = continent, size = pop)) + 
  geom_point() + 
  labs(x = "GDP per capita ($USD, inflation-adjusted)", 
       y = "Life expectancy (in years)", 
       title = "Wealth and Health Around the World", 
       subtitle = "Data from 2007. Source: gapminder package.") 


# MAKE YOUR ADDITIONS HERE (copy the code from above)


# historic elections dataset
elections_historic
?elections_historic
