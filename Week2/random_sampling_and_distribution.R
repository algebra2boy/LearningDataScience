#taking random samples
#note that "sample" will return the uniform distribution
#each value has an equal chance of occuring 
?sample
sample(1000,1)
#this samples 1 number between 1-1000
sample(10:20,1)
#this samples 1 number between 10-20
sample(c(50:100),10)
#this samples 10 numbers between 50 and 100
sample(c(50:100),10,replace=TRUE)
#this does the same, but allows the same number to be repeated
#numbers are sampled at random, and uniformly. for example:
sampleTest<-sample(100,1000,replace=TRUE)
#samples 1000 numbers between 1-100, with replacement
hist(sampleTest)
#we can tell from the histogram that the numbers are evenly distributed (approx)
#try it with larger samples
sampleTest<-sample(100,100000,replace=TRUE)
hist(sampleTest)

#distributions in R
?Distributions

#normal distribution (aka gaussian, or bell curve)
?rnorm
normDat<-rnorm(100)
hist(normDat)
#the more data you generate, the more symmetric it will look
normDat<-rnorm(1000)
hist(normDat)
normDat<-rnorm(10000)
hist(normDat)
normDat<-rnorm(10)
hist(normDat)

#change mean and standard deviation
normDat<-rnorm(10,mean=100,sd=10)
mean(normDat)
sd(normDat)

#more samples = random data's mean/sd come closer to theoretical mean/sd
normDat<-rnorm(1000,mean=100,sd=10)
mean(normDat)
sd(normDat)

normDat<-rnorm(10,mean=10,sd=0)
mean(normDat)
sd(normDat)
normDat
#sd = 0 means that there's no variation

#compare different normally generated data sets
?par
par(mfrow=c(2,2))
hist(rnorm(1000,100,10))
hist(rnorm(1000,100,100))
hist(rnorm(1000,100,1))
hist(rnorm(1000,100,50))


#binomial distribution (coin toss)
rbinom(n = 10, size = 1, prob = .5)
#10 tosses, options are either 0 or 1 with equal probability
table(rbinom(n = 10, size = 1, prob = .5))

table(rbinom(n = 100, size = 1, prob = .5))

table(rbinom(n = 1000, size = 1, prob = .5))

table(rbinom(n = 100, size = 1, prob = .25))
#probability of getting a 1 is .25

table(rbinom(n = 1000, size = 1, prob = .001))
#probability of getting a 1 is .001 or 1/1000

binomDat<-rbinom(n = 1000, size = 1, prob = .75)
pie(table(binomDat))
#note: if you do:
dev.off()
#the plotting settings with go back to default


#poisson distribution: count data (>= 0)
?rpois
rpois(n = 100, lambda = 5)
#lambda = the mean
hist(rpois(n=10000,lambda=5))