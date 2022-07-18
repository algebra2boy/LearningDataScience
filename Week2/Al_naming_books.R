? read.csv
setwd("/Users/hugospersonalcenter/Documents/Brown/Week2")
#1
books <- read.csv("books.csv", header = T, stringsAsFactors = F) 

?strsplit
#2
title.names <- strsplit(x = books$title, split = " ")

#3
title.names <- unlist(title.names)
title.names

#4
new_title <- NULL
for(i in 1 : 10)
{
  new_title[i] <- cat("#",i, sample(title.names,sample(2:4,1),replace = T),'\n')
}

#5 
title.names <- title.names[title.names!=""]
title.names

# I added this myself, this is for getting rid of the parentheses of each word(Errors somehow)
for(i in 1:length(title.names))
{
  front_parenthese <- str_sub(title.names[i],1,1)
  back_parenthese  <- str_sub(title.names[i],nchar(title.names[i]))
  if(front_parenthese =="(")
  {
    title.names[i] = str_sub(title.names[i],2)
  }else if(back_parenthese ==")")
  {
    title.names[i] = str_sub(title.names[i],1,nchar(title.names)-1)
  }
}
  
#6
for(i in 1 : 10)
{
  new_title[i] <- cat("#",i, sample(title.names,sample(2:4,1),replace = T),'\n')
}

