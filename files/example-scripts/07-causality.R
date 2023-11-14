# libraries
library(tidyverse)
library(broom)
library(juanr)


# example code
## things to change: variables, rnorm parameters, size / direction of effect
fake_election = tibble(party_share = rnorm(n = 500, mean = 50, sd = 5), 
                       funding = rnorm(n = 500, mean = 20000, sd = 4000) + 2000 * party_share)
fake_election




# confounding example
waffle_divorce = tibble(south = sample(c(0, 1), size = 50, replace = TRUE), 
              waffle = rnorm(n = 50, mean = 20, sd = 4) + 10 * south,
              divorce = rnorm(n = 50, mean = 20, sd = 2) + 8 * south)

waffle_divorce
