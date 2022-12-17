## Ref: https://www.geeksforgeeks.org/chi-square-distribution-in-r/

# computing values of set_N random values with set_DF degrees of freedom
set_N <-5000000
set_DF <- 1
set_ylim <- 0.5

x <- rchisq(set_N, df = set_DF)

hist(x,
     freq = FALSE,
     xlim = c(0,16),
     ylim = c(0,set_ylim))

curve(dchisq(x, df = set_DF), from = 0, to = 15,
      n = set_N, col= 'red', lwd=2, add = T)
