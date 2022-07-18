# Correlation 
x <-c(1,2,3,4,5)
y <- x^2
cor.test(x,y)


HeatDeath <- read.csv("Heat_index_death_data_RI.csv", header = T)

?subset

HeatTemp <- subset(Heat, select = -c(date, month, year, day, dow, weekend, holiday))
HeatTemp
# correlation between 2 variables
cor(HeatTemp$max.temp,Heat$O3)
# correlation test
cor.test(HeatTemp$max.temp,Heat$O3)

# make a plot of the 2 variables
plot(HeatTemp$max.temp,Heat$O3)
# we can see the positive correlation


#2 other variables
cor(HeatTemp$max.temp,Heat$NO2)
# a negative correlation
cor.test(HeatTemp$max.temp,Heat$NO2)
plot(HeatTemp$max.temp,Heat$NO2)
#although the correlation is significant, the relationship in the plot is unclear

cor(HeatTemp)
install.packages("corrplot")
library("corrplot")
?corrplot
corrplot(cor(HeatTemp))

corrplot(cor(HeatTemp), method = "number")
corrplot(cor(HeatTemp), method = "pie")

a<- c(1,2,3,4,5,6,7)
b<- c(2,3,4,5,NA,5,2)
cor(a,b)
# cor(a,b) = NA, so use below 'use' to not use NA
cor(a,b,use = "pairwise.complete.obs")

# Linear models
