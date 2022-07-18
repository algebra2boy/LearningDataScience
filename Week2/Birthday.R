#estimate the probability of having 2 pairs of matching birthdays in a class of 24

#use equation:
1-(364/365)^(choose(24,2))

#and use a loop to simulate it:
numberMatch<-NULL
for(i in 1:100000)
{
  #assume that 1 = Jan 1, 366 = Dec 31
  randomBirthdays<-sample(1:366,24,replace=T)
  tab<-table(randomBirthdays)
  numberMatch[i]<-sum(tab>=2)
  if(i %% 10000 == 0)
  {
    print(i)
  }
}

table(numberMatch)
#this is the number of times there were 0 matches, 1 match, 2 matches, etc

table(numberMatch)/length(numberMatch)
#this is the proportion of times there were 0 matches, 1 match, matches, etc

sum(numberMatch>0)/length(numberMatch)
#this is the proportion of times there were >0 matches
