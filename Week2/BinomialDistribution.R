#1Using the independence rule, 
#find the probability of rolling 20 heads in a row
(1/2)^20
#  9.536743e-07



#2  Using the binomial distribution, 
#find the probability of rolling 19 heads in 20 rolls
dbinom(19,20, prob = 0.5)
# 1.907349e-05

#3 the probability of rolling 99 heads in 100 rolls
dbinom(99,100, prob = 0.5)
# 7.888609e-29

# How many ways are there to roll 5 heads in 100 rolls?
choose(100,5)
# There are 75287520 ways to roll 5 heads in 100 rolls