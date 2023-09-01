# libraries
library(tidyverse)


# set the hard dates
start_day = "2023-09-27"
end_day = "2023-12-08"
final = "2023-12-15 10:30AM"
midterm = "2023-10-31"
breaks = c("2023-11-23")
meets_on = c("Tue", "Thu")

# create class schedule

## all days between start and end
schedule = tibble(dates = seq(from = ymd(start_day), 
                              to = ymd(end_day),
                              by = "days"),
       day = wday(dates, label = TRUE)) |> 
  # filter to meeting days
  filter(day %in% meets_on) |> 
  # filter out breaks
  filter(!dates %in% ymd(breaks)) |> 
  # add weeks
  mutate(week = isoweek(dates), 
         week = week - (min(week) - 1), 
         week = str_pad(week, width = 2, pad = "0"))


# set homework weeks
homework_on = tibble(week = c(2, 3, 4, 6, 7, 8, 9, 10)) |> 
  mutate(week = paste0("Week ", str_pad(week, width = 2, pad = "0")))

# create condensed version so each row is a week

## pivot wider
schedule = schedule |> 
  mutate(week = paste0("Week ", week)) |> 
  pivot_wider(names_from = day, values_from = dates) |> 
  # add all the extras
  mutate(content = paste0("/content/", str_extract(week, "\\d+"), "-content"),
         assignment = ifelse(week %in% homework_on$week, 
                             paste0("/assignment/", str_extract(week, "\\d+"), "-assignment"),
                             NA),
         example = paste0("/example/", str_extract(week, "\\d+"), "-example")) |> 
  select(week, date = 3, day2 = 2, content, assignment, example)


# set homework weeks
homework_on = tibble(week = c(2, 3, 4, 6, 7, 8, 9, 10)) |> 
  mutate(week = paste0("Week ", str_pad(week, width = 2, pad = "0")))

# merge in topics
topics = tribble(~week, ~title,
        "Week 01", "Hello",
        "Week 02", "Data visualization",
        "Week 03", "Data wrangling",
        "Week 04", "Relationships",
        "Week 05", "Modeling",
        "Week 06", "Prediction",
        "Week 07", "Causality",
        "Week 08", "DAGs",
        "Week 09", "Natural experiments",
        "Week 10", "Uncertainty",
        "Week 11", "Hypothesis testing")


# finish up
schedule = schedule |> 
  left_join(topics, by = "week") |> 
  # add in exams
  add_row(week = "", 
          title = 'Final exam <i class="fa-solid fa-star"></i>', date = ymd_hm(final)) |> 
  add_row(week = "", 
          title = 'Midterm exam <i class="fa-solid fa-star"></i>', date = ymd(midterm), .after = 5)

write_csv(schedule, "data/schedule.csv")
