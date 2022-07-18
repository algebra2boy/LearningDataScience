# R as a calculator

1 + 1
2 * 2
2.9 ^ 92
1 == 1
2 >= 1
1 != 1
2 < 1

# R to run commands, ? and #

log(8)
log10(8)
log(8, 10)
?log

# install packages

install.packages("magrittr")
library(magrittr)

# Working directory

getwd()
setwd("C:/Users/Alexander")
getwd()
list.files()
setwd("C:/Users/Alexander/Dropbox (Brown)")
getwd()

# Choosing directories

choose.dir()
setwd(choose.dir())
getwd()

# Built-in data

data()
data(mtcars)

# Saving data

getwd()
setwd("C:/Users/Alexander/Dropbox (Brown)/Teaching/Intro to R 2020/Week 1 Day 1/")
getwd()
save(mtcars, file="car_summary.RData")
list.files()

# Load data

rm(mtcars)
list.files()
load("car_summary.RData")
