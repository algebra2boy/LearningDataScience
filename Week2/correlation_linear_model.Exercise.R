#1
install.packages("mlbench")
library("mlbench")
data("PimaIndiansDiabetes")
?PimaIndiansDiabetes

#2
?cor
cor.test(PimaIndiansDiabetes$mass, PimaIndiansDiabetes$glucose)
# p -value is 5.891e-10 <0.05 and correlation coeff. is 0.2210711 >0
# Yes, the variables are significantly and positively correlated

#3
cor.test(PimaIndiansDiabetes$mass, PimaIndiansDiabetes$pressure)
# p- value is  1.738e-15 and correlation coeff. is 0.2818053 
# Yes, mass and pressure are significantly and positively correlated 

#4
?subset
PimaIndiansDiabetes_without_diabete <- subset(PimaIndiansDiabetes,select = -c(diabetes))
corrplot(cor(PimaIndiansDiabetes_without_diabete),method = "pie")

#5 
# whether number of pregnancies is related to blood glucose level
data<- lm(glucose~pregnant,data = PimaIndiansDiabetes)
plot(PimaIndiansDiabetes$glucose~PimaIndiansDiabetes$pregnant, xlab ="pregnant", 
     ylab ="glucose",pch = 16, las= 1, col = "orange", main = "pregant vs. diabete")
abline(data, col = "green")
summary(data)$coefficients
# p- value is 3.219491e-04
# beta 1 is 1.228383
# conclusion: the number of pregnancies is significantly associated with blood glucose level

#6
data2 <- lm(age~mass, data = PimaIndiansDiabetes)
plot(PimaIndiansDiabetes$age, PimaIndiansDiabetes$mass, xlab = "mass",
     ylab = "age", pch = 16, las = 1, col = "black", main = "age vs. mass")
abline(data2, col = "purple")
summary(data2)$coefficients
# p- value is 3.158330e-01, and beta 1 is 0.05405938
# conclusion: there is not really a relationship between the mass and age(not significantly associcated)