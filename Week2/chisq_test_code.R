#Chi squared test example 
#use the Smoking data again
smokingDat<-read.csv("Smoking_pheno.csv",header=T)

#is smoking status associated with gender?
table(smokingDat$smoke.cfn,smokingDat$gender)
chisq.test(table(smokingDat$smoke.cfn,smokingDat$gender))
#P = 0.5088
#Conclusion: smoking status is not associated with gender

#recode smoking to ever/never
#ever = former and current combined
smokingDat$smoke.ever<-0
smokingDat$smoke.ever[smokingDat$smoke.cfn%in%c("Current","Former")]<-1
table(smokingDat$smoke.ever,smokingDat$gender)
chisq.test(table(smokingDat$smoke.ever,smokingDat$gender))
#p = 0.3311
#still no significant relationship between smoking and gender