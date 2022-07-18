# not switching case
correct <- 0
number_of_times_run <- 100000
for(i in 1:number_of_times_run)
{
    doors<- c(1,2,3)
    select_door <- sample(c(1:3),1)
    prize_door <- sample(c(1:3),1)
    
    if(select_door == prize_door)
    {
      correct <- correct +1
    }
}
print(correct / number_of_times_run)

# the probability of not switching doors is very close to 1/3



# switching case

correct <-0
for(i in 1:10000)
{
  doors <- c(1,2,3)
  select_door <- sample(c(1:3),1)
  prize_door <-  1
  
  if(select_door == 2)
  {
    doors <- doors[-3]
  }else if(select_door == 1)
  {
    doors <- doors[-sample(c(2:3),1)]
  }else
  {
      doors <- doors[-2]
  }
  # second time selecting
  reselect_door <- sample(doors,1)
  
  if(select_door == reselect_door)
  {
    correct <- correct+1
  }
}
print(correct / 10000)
