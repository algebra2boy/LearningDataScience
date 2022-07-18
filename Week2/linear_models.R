#start with the sleep data set again
data(sleep)

mod<-lm(extra~group,data=sleep)
summary(mod)$coefficients
#p = 0.079 (not significant)
#beta 1 = 1.58 (this is the difference between groups 1 and 2)
#recall that when we ran the t-test we also concluded that there was no significant difference

#Heat index and daily deaths in RI:
#remember to change your working directory if you're not in the right directory

datDeath<-read.csv("Heat_index_death_data_RI.csv",header=T)
head(datDeath)
#contains date, max and min temp, weekend/holiday indicators, pollutants, number of deaths, and max daily heat index (HI.max)

#is there a difference in deaths vs weekend?
t.test(number.deaths~weekend,data=datDeath)
#p = 0.6489 (no significant difference)

#is there a relationship between temperature and deaths using linear model?
mod.death<-lm(number.deaths~max.temp,data=datDeath)
summary(mod.death)$coefficients
#yes

#add confounders:
mod.death<-lm(number.deaths~max.temp+month+weekend+holiday+dwpt,data=datDeath)
summary(mod.death)$coefficients
#not significant anymore

#plot a regression line
plot(datDeath$number.deaths~datDeath$max.temp,xlab="Temperature",ylab="Number of deaths",pch=16)
abline(mod.death)

#relationship between temperature and ozone
mod.ozone<-lm(max.temp~O3,data=datDeath)
summary(mod.ozone)$coefficients
#highly related

#regression line
plot(datDeath$max.temp~datDeath$O3,xlab="Temperature",ylab="Ozone",pch=16)
abline(mod.ozone)

#add some color to the plot
plot(datDeath$max.temp~datDeath$O3,xlab="Temperature",ylab="Ozone",pch=16,col="orange")
abline(mod.ozone,col="red")

#flip the direction of the y-axis labels
plot(datDeath$max.temp~datDeath$O3,xlab="Temperature",ylab="Ozone",pch=16,col="orange",las=1)
abline(mod.ozone,col="red")

#add a title
plot(datDeath$max.temp~datDeath$O3,xlab="Temperature",ylab="Ozone",pch=16,col="orange",las=1,
     main="Temperature vs. Ozone")
abline(mod.ozone,col="red")