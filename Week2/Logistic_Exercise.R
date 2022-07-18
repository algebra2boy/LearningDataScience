#1
load("TCORS Phase 2 CLEANED - RData - v1.0.RData")

#2

# 1 is depressed, 0 is not depressed
table(data1$x_dsm12)
# 129 subjects reported being not depressed, 175 subjects reported being depressed
prop.table(table(data1$x_dsm12))
# 42.43% is being not depressed, 57.57% is being depressed

#4
data1$age <- as.integer(data1$age)
typeof(data1$age)

#5
data1$ecvlife <- data1$ecvlife %>% Recode("
'2-5 times' = 3.5;
'6-15 times' = 10.5 ;
'16-25 times' = 20.5;
'26-99 times' = 62.5;
'100-499 times' = 299.5;
'500 plus times' = 500;") %>% as.character %>% as.numeric

#6 
result <- glm(x_dsm12~ecvlife, data = data1, family = "binomial")
summary(result)$coefficients
# beta 1 is -0.00066, p- value is 0.51020568
exp(-0.00066)
# the odds ratio is 0.9993402
# The odds of being a case increased by 100% with times of used e-cig in your life,
# p- value is 0.51020568, so this is not significant at all


#7 and #8
result2 <-glm(x_dsm12~ecvlife+gender+age, data = data1, family = "binomial")
summary(result2)$coefficients
exp(-0.2550203761)
# only the age variables are significant afterI adjusted,
# p- value is 0.006045672 and the Odd ratio is 0.775



