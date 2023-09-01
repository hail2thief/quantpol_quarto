# libraries
library(tidyverse)


# read in schedule
df = read_csv("data/schedule.csv")


# text to write 
text_reading = '---
title: "Hello"
---

# Readings


## Required


## Personal recommendations


# Slides

'

text_assignment = '---
title: "Hello"
---'

# create the qmds
df |> 
  select(content) |> 
  drop_na() |> 
  mutate(content = str_remove(content, "^/"),
         content = paste0(content, ".qmd")) |> 
  pull() |> 
  map( .f = ~ writeLines(text = text_reading, con = .x))


# create the qmds
df |> 
  select(assignment) |> 
  drop_na() |> 
  mutate(assignment = str_remove(assignment, "^/"),
         assignment = paste0(assignment, ".qmd")) |> 
  pull() |> 
  map( .f = ~ writeLines(text = text_assignment, con = .x))


df |> 
  select(example) |> 
  drop_na() |> 
  mutate(example = str_remove(example, "^/"),
         example = paste0(example, ".qmd")) |> 
  pull() |> 
  map( .f = ~ writeLines(text = text_assignment, con = .x))
