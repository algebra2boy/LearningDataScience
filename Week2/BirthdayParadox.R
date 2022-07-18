#1 My birthday is April 9th

#2 the probability of 2 matching birthdays in a group of 10

1 - (365/366)^(choose(10,2))
# 0.1158416


#3
numberMatch <- NULL
for(i in 1:100000)
{
  randomBirthdays<-sample(1:366,10,replace=T)
  tab<-table(randomBirthdays)
  # only the 2 matching birthdays would be recorded
  numberMatch[i]<-sum(tab==2)
  if(i %% 10000 == 0)
  {
    print(i)
  }
}

table(numberMatch)
table(numberMatch) / length(numberMatch)
# we are not included the none matching numbers
sum(numberMatch>0) / length(numberMatch)