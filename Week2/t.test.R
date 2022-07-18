#t-tests code
#built-in data set:

data(sleep)
?head
head(sleep)
?sleep
#extra = increase (or decrease in hours of sleep)
#group = drug given
#ID = patient ID

#effect of 2 different drugs on change in sleep
t.test(extra~group, data = sleep)
?t.test()
#mean in group 1 = 0.75
#mean in group 2 = 2.33
#p-value = 0.079

#conclusion: group 2 has a higher change in hours of sleep compared
#to group 1, but not significantly so (p > 0.05)

#another example:
#read in a csv file:
#make sure you are in the right directory
getwd()
#if not, you can go to:
#Session -> Set Working Directory
smokingDat<-read.csv("Smoking_pheno.csv",header=T)
head(smokingDat)
#smoke.cfn = current/former/never smoker
table(smokingDat$smoke.cfn)
table(smokingDat$gender)
summary(smokingDat$age)

#is there a relationship between age and gender?
t.test(age~gender,data=smokingDat)
#yes- females in this study are older:
#mean females = 57.3
#mean males = 54.6
#p value = 2.6e-05 
#this is < 0.05 so we conclude that females are significantly older