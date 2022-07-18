#Simpson's Paradox Example code
rm(list=ls())

?UCBAdmissions
#this gives info about the UC Berkeley gender bias example

UCBAdmissions
#find the overall number of rejected/accepted

#how can we look at this data
UCBAdmissions[1,,]
#table of gender by department
UCBAdmissions[,1,]
#table of admission by department
UCBAdmissions[,,1]
#admission by gender for department A


apply(UCBAdmissions, c(1, 2), sum)
#this takes the sum over each row and column

#% of males accepted
1198/(1198+1493)
#44.5%

#% females accepted
557/(557+1278)
#30.4%

#for fun, let's do a chi-squared test
chisq.test(apply(UCBAdmissions, c(1, 2), sum))
#p < 2.2e-16

#now let's look at individual departments
deptA<-UCBAdmissions[,,1]
chisq.test(deptA)
#also signif
#males accepted:
512/(512+313)
#62.1%
#females accepted
89/(89+19)
#82.4%

#department B
deptB<-UCBAdmissions[,,2]
chisq.test(deptB)
#not signif
#males accepted:
353/(353+207)
#63.0%
#females accepted
17/(17+8)
#68%

#make a loop to find the acceptance rates for each dept
#and get chisq p-value

pct.male.accept<-NULL
pct.fem.accept<-NULL
pval<-NULL

#do this for 6 departments

for(i in 1:6)
{
  tab<-UCBAdmissions[,,i]
  pct.male.accept[i]<-tab[1,1]/(tab[1,1]+tab[2,1])
  pct.fem.accept[i]<-tab[1,2]/(tab[1,2]+tab[2,2])
  pval[i]<-chisq.test(tab)$p.value
}

cbind(pct.male.accept,pct.fem.accept,pval)

