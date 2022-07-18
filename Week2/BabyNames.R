#naming a baby
rm(list=ls())
library(stringr)
babynames<-read.csv("babynames.csv",header=T,stringsAsFactors = F)
babynames[1:10,]

babynames[babynames$Girls=="Melissa",]
babynames[babynames$Boys=="Rowan",]

babynames[substr(babynames$Girls,1,3)=="Mel",]

table(nchar(babynames$Girls))
table(nchar(babynames$Boys))

babynames[nchar(babynames$Boys)==2,]

bigramsGirl<-NULL
j<-1
for(i in 1:nrow(babynames))
{
  n<-nchar(babynames$Girls[i])
  for(k in 1:(n-1))
  {
    bigramsGirl[(j+k-1)]<-substr(str_to_lower(babynames$Girls[i]),k,(k+1))
  }
  
  j<-j+n-1 
}




bigramsBoy<-NULL
j<-1
for(i in 1:nrow(babynames))
{
  n<-nchar(babynames$Boys[i])
  if(n == 2)
  {
    bigramsGirl[j]<-str_to_lower(babynames$Boys[i])
  }
  else
  {
    for(k in 1:(n-1))
    {
      bigramsBoy[(j+k-1)]<-substr(str_to_lower(babynames$Boys[i]),k,(k+1))
    }
  }
  j<-j+n-1
}


table(table(bigramsGirl))
table(table(bigramsBoy))


#create random names

set.seed(1941851)
#names with 6 letters
paste(sample(bigramsGirl,3,replace=TRUE),collapse="")
paste(sample(bigramsBoy,3,replace=TRUE),collapse="")

#names with 4 letters
set.seed(510957)
paste(sample(bigramsGirl,2,replace=TRUE),collapse="")
paste(sample(bigramsBoy,2,replace=TRUE),collapse="")

#names with 8 letters
set.seed(18417852)
paste(sample(bigramsGirl,4,replace=TRUE),collapse="")
paste(sample(bigramsBoy,4,replace=TRUE),collapse="")