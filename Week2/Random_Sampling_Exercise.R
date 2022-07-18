#1
sample(1:10,10, replace = TRUE)
# I got 4 repeats 

#2
sample(1:10,10, replace = FALSE)

#3 
sample3<-sample(10,100000, replace = TRUE)
hist(sample3)
# Yes, they are evenly distributed between 1 and 10

#4

#A 
roll.1 <- sample(c(1:6),100000, replace = T)
roll.2 <- sample(c(1:6),100000, replace = T)

#B
sum(roll.1 == 6 & roll.2 ==6) / length(roll.1)
1/36 

#C
sum(roll.1 == 1 & roll.2 ==1) / length(roll.1)
sum(roll.1 == 2 & roll.2 ==2) / length(roll.1)
sum(roll.1 == 3 & roll.2 ==3) / length(roll.1)
sum(roll.1 == 4 & roll.2 ==4) / length(roll.1)
sum(roll.1 == 5 & roll.2 ==5) / length(roll.1)

#D 
table(roll.1)
table(roll.2)

#E 
roll.1 <- sample(c(1:6),10, replace = T)
roll.2 <- sample(c(1:6),10, replace = T)

#F 

(roll.1 + roll.2)==10
table((roll.1 + roll.2)==10)

#G 
roll.1 <- sample(c(1:6),100000, replace = T)
roll.2 <- sample(c(1:6),100000, replace = T)

sum((roll.1+roll.2)==10)/ length(roll.1)


#H 
# it is very close when I was to estimating this, 
# I got 0.08312, which is 8.312% 

#I 
sum_all_values <- roll.1+roll.2
hist(sum_all_values)
# sum of 7 is the most common 

# J 
roll.1 <- sample(c(1:6),50, replace = T)
roll.2 <- sample(c(1:6),50, replace = T)
hist(roll.1+roll.2)

roll.1 <- sample(c(1:6),100000, replace = T)
roll.2 <- sample(c(1:6),100000, replace = T)
hist(sum_all_values)


