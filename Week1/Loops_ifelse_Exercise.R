#1
TRUE == FALSE # FAlSE
15 *-7 != -315/3 #FALSE
"Hello" >="Goodbye" #TRUE


#2
vec <- c(23, 25, 6, 21, 9, 7, 2, 1)
x <-vec[3]

(x > 4) & (x <= 15) #TRUE

vec <- c(23, 25, 6, 21, 9, 7, 2, 1)
x <- vec[5]

(x < 7) | (x >= 15) # FALSE

#3
data()
data <- iris
data
data$Petal.Area <-data$Petal.Length *data$Petal.Width
data

# mean = sum / number of total
mean <- sum(data$Petal.Area) / (nrow(data))
mean

data$Comparision <- ifelse((data$Petal.Area>=mean),
                           print("greater_than_equal_to mean"),
                           print("less_than_mean"))
data

#4
library(dplyr)

df_sw <-as.data.frame(starwars)
length(df_sw) <- 11
#df_sw <- df_sw[1:nrow(df_sw),1:11]
str(df_sw)

for(i in 1:length(df_sw))
{
  if(class(df_sw[,i])=="numeric"|class(df_sw[,i])=="integer")
  {
    cat(colnames(df_sw)[i],":",class(df_sw[,i]),
    "with mean",mean(df_sw[,i],na.rm = TRUE),df_sw[1:4,i],
    "total NA is:",sum(is.na(df_sw[,i])),"\n")
  }else
  {
    cat(colnames(df_sw)[i],":",class(df_sw[,i]),":",df_sw[1:4,i],
    "total NA is:",sum(is.na(df_sw[,i])),"\n")
  }
}
