# libraries
library(tidyverse)
library(ggdag)
library(huxtable)
library(broom)




## the fork simulation
fake = tibble(Z = sample(c(0, 1), size = 50, replace = TRUE), 
              X = rnorm(n = 50, mean = 20, sd = 4) + 10 * Z,
              Y = rnorm(n = 50, mean = 20, sd = 2) + 8 * Z) 



# the pipe



# the collider