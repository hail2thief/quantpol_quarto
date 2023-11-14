# libraries
library(tidyverse)
library(juanr)
library(fivethirtyeight)

# trade data
bob_ross
?bob_ross

# do your work here!
bob_ross |> 
  summarise(tree_pct = mean(tree, na.rm = TRUE))


cloud_season = bob_ross |> 
  group_by(season) |> 
  summarise(clouds_pct = mean(clouds, na.rm = TRUE))

ggplot(cloud_season, aes(x = season, y = clouds_pct)) + 
  geom_line()

bob_ross |> 
  filter(mountain == 1) |> 
  summarise(avg_snowy = mean(snowy_mountain, na.rm = TRUE))


# load data
flying
?flying


# do your work here!
fly_arms = flying |> 
  group_by(two_arm_rests) |> 
  tally() |> 
  mutate(percent = n / sum(n) * 100)

ggplot(fly_arms, aes(y = two_arm_rests, x = percent)) + geom_col()


child = flying |> 
  group_by(children_under_18, unruly_child, gender) |> 
  tally() |> 
  mutate(percent = n / sum(n) * 100)

ggplot(child, aes(y = children_under_18, 
                  x = percent, 
                  fill = unruly_child)) + 
  geom_col()


electric = flying |> 
  group_by(electronics, frequency) |> 
  tally() |> 
  mutate(percent = n / sum(n) * 100)

ggplot(electric, aes(y = electronics, 
                     x = percent, 
                     fill = frequency)) + 
  geom_col()
