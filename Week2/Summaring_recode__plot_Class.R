# Remove everything from the global environment

rm(list=ls())

install.packages("car")
install.packages("Rcpp")
# load packages
library(psych)
library(car)
library(Rcpp)
library(expss)
library(magrittr)
library(dplyr)

getwd()
setwd("/Users/hugospersonalcenter/Documents/Brown/Week2")
list.files()
load("TCORS Phase 2 CLEANED - RData - v1.0.RData")

data1$gender %>% table
data1$gender %>% table %>% prop.table

#making a table 
table(data1$gender, data1$x_dsm_diag)
table(data1$gender, data1$x_dsm_diag) %>% prop.table
# making a percentage table
prop.table(table(data1$gender, data1$x_dsm_diag))

# it is more formatted table
cro(data1$gender) # number of occurrence
cro_cpct(data1$gender) # percentage of occurrence
cro(data1$x_dsm_diag)
cro(data1$gender, data1$x_dsm_diag)
cro_cpct(data1$gender, data1$x_dsm_diag)
cro(data1$gender, data1$x_dsm_diag)
cro_rpct(data1$gender, data1$x_dsm_diag)

# coding challenge
# 1. quit means have you ever attempted to stop using e-cig or nicotine vaporizers
cro(data1$quit)
cro(data1$x_dsm_diag)
cro(data1$quit,data1$x_dsm_diag)

cro_cpct(data1$quit)
cro_cpct(data1$x_dsm_diag)
cro_cpct(data1$quit,data1$x_dsm_diag)


# summarizing numeric data - simple
data1$age
data1$age %<>% as.character %<>% as.numeric #for data cleaning
summary(data1$age)
describe(data1$age)
describeBy(data1$x_dsm_count,list(data1$gender,data1$ethnic))

data1 %>% group_by(gender, ethnic) %>% summarize(age = mean(age, na.rm = T))


# computing new variables
data1$new_variable <-1
data1$new_variable 
data1$new_variable <- c(1,2,3) # doesn't work too short

data1$age_months <- data1$age * 12
data1$age_months

data1$age_dep_ratio <- data1$age / data1$x_dsm_count
data1$age_dep_ratio


data1$x_dsm_count_2 <-data1$x_dsm_crit1 + 
                      data1$x_dsm_crit2 +
                      data1$x_dsm_crit3 + data1$x_dsm_crit4 + data1$x_dsm_crit5+
                      data1$x_dsm_crit6 + data1$x_dsm_crit7
data1$x_dsm_count_2 == data1$x_dsm_count



# Recode
?Recode
data1$age21 <- data1$age %>% Recode("18:20 = 'no'; 21:24 = 'yes'", as.factor = T)
data1 %>% select(age, age21)
data1$age21 <- data1$age %>% Recode("lo:20 = 'no'; 21:hi = 'yes'", as.factor = T)
data1 %>% select(age, age21)
data1$smk30numdays <- data1$smk30 %>% Recode("'I did not smoke cigarettes during the last 30 days' = 0")
data1$smk30numdays %<>% as.character %>% as.numeric
data1$smk30numdays


levels(data1$ecvfreq)
# when you recode, remember to convert them to character then to numeric, because 
# recode makes them to factor value as you assign values
data1$ecvfreqnum <- data1$ecvfreq %>% Recode(" '10+ times per day' = 10;
'7-9 times per day' = 8; 
'4-6 times per day' = 5; 
'1-3 times per day' = 2; 
'5-6 times per week' = 0.78571;
'3-5 times per week' = 0.571429; 
'3-4 times per week' = .5;
'1-2 times per week' = 0.214286 ; 
'Less than one time per week' = 0.071429") %>% as.character %>%as.numeric
data1$ecvfreq
data1$ecvfreqnum 

# visualization
plot(data1$ecvdays30,data1$smk30numdays)
# abline(lm(yvar ~ xvar, data = name_of_data), col="color")
abline(lm(smk30numdays~ecvdays30,data = data1), col = "blue")
# lines(lowess(data_frame$xvar, data_frame$yvar), col = "color")
lines(lowess(data1$ecvdays30,data1$smk30numdays), col = "red")

