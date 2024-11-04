# libraries
library(tidyverse)
library(broom)
library(juanr)


# example code
## things to change: variables, rnorm parameters, size / direction of effect
fake_election = tibble(party_share = rnorm(n = 500, mean = 50, sd = 5), 
                       funding = rnorm(n = 500, mean = 20000, sd = 4000) + 2000 * party_share)
fake_election


