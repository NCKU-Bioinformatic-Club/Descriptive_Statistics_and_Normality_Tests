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
aggregate(iris$Petal.Length, by = list(iris$Species), FUN = mean) # aggregate(需計算的資料變項, 依據的變項, 函數)
aggregate(Petal.Length ~ Species, data = iris, FUN = mean) # aggregate(表示式, 資料集, 函數) # 應變數~自變數 ex: y = ax + b 中y為應變數,x為自變數
aggregate(. ~ Species, data = iris, mean) # 計算所有變項的平均，使用點(.) 來代表s

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

setkey(iris.dt, Species) # The table is changed by reference and is therefore very memory efficient.
iris.dt[, mean(Petal.Width), by = Species]

#### Data filtering ####
subset(iris, Petal.Length >= 2.0)
subset(iris, Petal.Length >= Sepal.Length/2)
subset(iris, Petal.Length + Sepal.Length > 10)
subset(iris, Species == "versicolor")
subset(iris, Species != "versicolor")
subset(iris, Species %in% c("versicolor","virginica"))

#### T-test ####
iris_sv <- iris.dt[iris.dt[, Species == 'setosa' | Species == 'virginica']]
t.test(Sepal.Length ~ Species, data = iris_sv)


