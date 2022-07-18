#Monte Hall Problem

#in this simulation, we assume that door 1 is always correct

#without switching
correct<-NULL
for(i in 1:10000)
{
  vec<-c(1:3)
  #randomly select a door
  door.select<-sample(1:3,1)
  
  correct[i]<-0
  if(door.select==1)
  {
    correct[i]<-1
  }
}

table(correct)
table(correct)/10000

#switch
correct<-NULL
for(i in 1:10000)
{
  door.vec<-c(1:3)
  
  door.select<-sample(1:3,1)
  #now select one of the empty doors to open
  #select an empty door that you haven't already chosen
  #in this scenario, 2 and 3 are empty
  if(door.select==1)
  {
    door.open<-sample(2:3,1)
  }
  if(door.select==2)
  {
    door.open<-3
  }
  if(door.select==3)
  {
    door.open<-2
  }
  
  door.switch<-door.vec[-c(door.select,door.open)]
  
  correct[i]<-0
  if(door.switch==1)
  {
    correct[i]<-1
  }
}
table(correct)
table(correct)/10000


#switch only 50% of the time
correct<-NULL
for(i in 1:10000)
{
  door.vec<-c(1:3)
  door.select<-sample(1:3,1)
  #with 50% probability, either keep the door you have or switch
  switch<-sample(0:1,1)
  #if switch = 0, stick with the same door  
  if(switch==0)
  {
    door.switch<-door.select
  }
  #if switch = 1, switch doors as before
  if(switch==1)
  {
    if(door.select==1)
    {
      door.open<-sample(2:3,1)
    }
    if(door.select==2)
    {
      door.open<-3
    }
    if(door.select==3)
    {
      door.open<-2
    }
    door.switch<-door.vec[-c(door.select,door.open)]
  }
  
  correct[i]<-0
  if(door.switch==1)
  {
    correct[i]<-1
  }
}
table(correct)
table(correct)/10000

