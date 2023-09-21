# Load packages ----------------------------------------------------------------
library(tidyverse)
library(unvotes)
library(lubridate)
library(scales)


# Make a plot ------------------------------------------------------------------

# calculate % vote yes each year by country by issue
un_yes = un_votes %>%
  filter(country %in% c("United States", "Turkey")) %>%
  inner_join(un_roll_calls, by = "rcid") %>%
  inner_join(un_roll_call_issues, by = "rcid") %>%
  group_by(country, year = year(date), issue) %>%
  summarize(
    votes = n(),
    percent_yes = mean(vote == "yes")
  ) %>%
  filter(votes > 5)  # only use records where there are more than 5 votes

# make plot
ggplot(un_yes, aes(x = year, y = percent_yes, color = country)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(~ issue) +
  labs(
    title = "Percentage of 'Yes' votes in the UN General Assembly",
    subtitle = "1946 to 2015",
    y = "% Yes",
    x = "Year",
    color = "Country"
  ) + 
  scale_y_continuous(labels = percent)


