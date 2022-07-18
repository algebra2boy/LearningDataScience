#1
data()
data(UCBAdmissions)
#save(admission, file = "Admission.RData")

#2
adm.full <- apply(UCBAdmissions,c(1,2),sum)

#3
prop.table(adm.full)
# the proportion of males admitted 
1198/(1198+1493)
# the proportion of females admitted 
557/(557+1278)


#4
?chisq.test
#chisq.test(admitted and rejected, gender)
chisq.test(adm.full)
# the p-value is 2.2e-16
# conclusion: males were more likely to be admitted overall than females(p<0.05)

#5 
adm.A <-UCBAdmissions[,,1]
chisq.test(adm.A)
# the p - value is 5.205e-05
# conclusion : males are more likely to be accepted because p<0.05 