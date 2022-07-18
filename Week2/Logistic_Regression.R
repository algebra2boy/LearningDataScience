######################
#logistic regression
######################

#read in new data set
datCase<-read.csv("head_and_neck_data.csv",header=T)

#summarize the data
head(datCase)
table(datCase$case)
table(datCase$gender)
summary(datCase$packyrs)

table(datCase$case,datCase$gender)

#we can do a chi-squared test and a t-test as a re-cap before moving on to a linear model

#question: are males or females more likely to be cases?
chisq.test(table(datCase$case,datCase$gender))
#p = 0.65
#no evidence that males or females are more likely to be a case

#question: are cases more likely to smoke?
t.test(packyrs~case,data=datCase)
#p = 0.02
#mean pack years for controls = 10
#mean pack years for cases = 43.5
#cases are significantly more likely to smoke

#logistic regression:
#unadjusted
modLog<-glm(case~packyrs,data=datCase,family="binomial")
summary(modLog)$coefficients
#OR:
exp(.047) # 1.048122 # logistic uses natural log, so here we need to add base e 
# 5% of odds ratio of being a case 

modLog<-glm(case~packyrs+gender,data=datCase,family="binomial")
summary(modLog)$coefficients
#OR:
exp(.047)
#same as unadjusted but higher p-value