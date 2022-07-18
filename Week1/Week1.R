#install package
install.packages("magrittr")
library("magrittr")


#working dirextory

getwd()
setwd("/Users/hugospersonalcenter/")
getwd()
list.files()
setwd("Documents")
getwd()
list.files()
setwd("Brown")
list.files()

#choosing direcotires only works on Windows
?choose.dir()
setwd(choose.dir())

#install package
install.packages("magrittr")
library("magrittr")


#working dirextory

getwd()
list.files()
setwd("Documents")
getwd()

#Built- in data
data()
data("mtcars")


#saving data with an extension .RData
getwd()
list.files()
setwd("Week1")
getwd()
list.files()
save(mtcars,file="car_summary.RData")
getwd()
list.files()

# Load data
rm(mtcars)
list.files()
load("car_summary.RData")
