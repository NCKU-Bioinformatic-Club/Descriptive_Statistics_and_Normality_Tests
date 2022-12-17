## Basic Statistical Analysis
## Ref: https://hackmd.io/@mutolisp/H1O00yGjZ/https%3A%2F%2Fhackmd.io%2Fs%2FSyowFbuAb

#### Use iris example #####
View(iris)

summary(iris)

mean(iris$Sepal.Length)
sd(iris$Sepal.Length)

mean(iris$Sepal.Width)
sd(iris$Sepal.Width)

#### aggregate ####
aggregate(iris$Petal.Length, by = list(iris$Species), FUN = mean)
aggregate(Petal.Length ~ Species, data = iris, FUN = mean)
aggregate(. ~ Species, data = iris, mean)

## Fun
customLog <- function(x)
{
  y <- sum(log10(x) * 10)
  return(y)
}

aggregate(. ~ Species, data = iris, FUN = customLog)


#### Table ####
if(!require("data.table")) install.packages("data.table")
library(data.table)

if(!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)

iris.dt <- data.table(iris)

setkey(iris.dt, Species)
iris.dt[, mean(Petal.Width), by = Species]

#### Data filtering ####
subset(iris, Petal.Length >=2.0)


#### T-test ####
iris_sv <- iris.dt[iris.dt[, Species == 'setosa' | Species == 'virginica']]
t.test(Sepal.Length ~ Species, data = iris_sv)


