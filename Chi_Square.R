## Chi-Square Test of Independence in R
## Ref: http://www.sthda.com/english/wiki/chi-square-test-of-independence-in-r

##### Presetting ######
rm(list = ls()) # Clean variable
memory.limit(150000)

#### Data format: Contingency tables ####
# Import the data
file_path <- "http://www.sthda.com/sthda/RDoc/data/housetasks.txt"
housetasks <- read.delim(file_path, row.names = 1)
head(housetasks)


#### Graphical display of contengency tables ####
library("gplots")
# 1. convert the data as a table
dt <- as.table(as.matrix(housetasks))
# 2. Graph
balloonplot(t(dt), main ="housetasks", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)


library("graphics")
mosaicplot(dt, shade = TRUE, las=2,
           main = "housetasks")

# Standardized residual 標準化殘差（也稱為Pearson 殘差）的平均數為0，標準差為1。 是以模型離差為基礎的殘差。
# Blue color indicates that the observed value is higher than the expected value if the data were random
# Red color specifies that the observed value is lower than the expected value if the data were random

# install.packages("vcd")
library("vcd")
# plot just a subset of the table
assoc(head(dt, 5), shade = TRUE, las=3)
assoc(head(dt, 13), shade = TRUE, las=3)

#### Compute chi-square test in R ####
chisq <- chisq.test(housetasks)
chisq

# Observed counts
chisq$observed

# Expected counts
round(chisq$expected,2)


####  Nature of the dependence between the row and the column variables ####
round(chisq$residuals, 3)
library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)


# Contibution in percentage (%)
contrib <- 100*chisq$residuals^2/chisq$statistic
round(contrib, 3)

# Visualize the contribution
corrplot(contrib, is.cor = FALSE)

# # printing the p-value
# chisq$p.value
# # printing the mean
# chisq$estimate
#
