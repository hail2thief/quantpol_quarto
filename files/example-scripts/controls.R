# libraries
library(tidyverse)
library(huxtable)
library(broom)




## the fork simulation
fake = tibble(Z = sample(c(0, 1), size = 50, replace = TRUE), 
              X = rnorm(n = 50, mean = 20, sd = 4) + 10 * Z,
              Y = rnorm(n = 50, mean = 20, sd = 2) + 8 * Z) 



# the pipe
fake_pipe = tibble(aid = rnorm(n = 200, mean = 10), 
                   corruption = rnorm(n = 200, mean = 10) + 8 * aid, 
                   protest = rnorm(n = 200, mean = 10) + 4 * corruption)



# the collider
fake_collider = tibble(x = rnorm(n = 100, mean = 10), 
                       y = rnorm(n = 100, mean = 10),
                       m = rnorm(n = 100, mean = 10) + 8 * x + 4 * y)