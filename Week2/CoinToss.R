#Coin Toss
#flip a coin:
rbinom(n=1,size=1,prob=.5)
#n = number of observations (aka number of coin tosses in one experiment)
#size = 1 (number of trials- we are only running this experiment once)
#prob = .5 (equal probability of rolling a 0 or 1)
?rbinom
#flip a coin 10 times:
rbinom(10,1,.5)
rbinom(10,1,.5)
#each time you run this you will get different results

#save this as a vector
coinToss<-rbinom(10,1,.5)
coinToss
table(coinToss)
#this gives you the number of 0s and the number of 1s

#roll more times
coinToss<-rbinom(100,1,.5)
table(coinToss)

#even more times
coinToss<-rbinom(1000,1,.5)
table(coinToss)

#plot number of 0s and 1s
hist(coinToss)
#or:
barplot(table(coinToss))

#probability of rolling 10 heads (or tails) in a row in 10 rolls
dbinom(10,10,.5)
#0.000977 = approximately .1%

#check this using the probability equation
(.5)^10

#probability of rolling 100 heads (or tails) in 100 rolls
dbinom(100,100,.5)
(.5)^100


#probability of rolling 5 heads in 10 rolls
#can't do (.5)^5 because 5 heads could be in any order

#use the binomial distribution
dbinom(5,10,.5)
