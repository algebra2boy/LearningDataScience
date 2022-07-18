## Housekeeping
rm(list=ls()) # clear environment
cat('\014') # clear console

# install.packages('tidyverse')
# library(tidyverse)

# Functions
sample <- c(8, 32, 33, 62, 55, 62, 91, 22, 69, 57, 
            66, 92, 59, 16, 94, 52, 26, 84, 88, 2, 
            85, 37, 56, 44, 40, 53, 67, 80, 18, 92, 
            19, 72, 12, 82, 10, 25, 78, 64, 44, 52, 
            39, 97, 91, 79, 81, 5, 11, 7, 28, 42)

mean(sample)

sample_with_NA <- c(76, 69, 2, 64, 29, 87, 5, 96, NA, 4, 
                    92, 91, 66, 76, NA, 45, 46, 3, 90, 16, 
                    28, NA, 50, 63, 61, 86, 28, 18, 1, 58, 
                    65, 88, 89, 41, NA, 74, 66, 49, 11, 98, 
                    18, 72, NA, 90, 12, 79, 5, 25, 13, 22)

mean(sample_with_NA)
mean(sample_with_NA, na.rm = TRUE)

#User defined functions

my_function<-function()
{
  #do something
}
class(my_function)


# 1) Write a function called 'squared' that will take a number and then return the square of that number.
# 2) Add an argument called 'power' that allows the user to specify whatever exponent they would like instead of 2x
# 3) Add a third argument called 'inverse' that, if TRUE, will return the inverse of the result (i.e., 1/result)

squared <-function(x,power = 2,inverse = FALSE)
{
  x_squared = x^(power)
  if(inverse == TRUE)
  {
    x_squared = 1/(x_squared)
  }
  return (x_squared)
}

squared(3,power = 3)

# even works on vectors!
sample <- c(6, 5, 2, 3, 10, 9, 4, 7, 8, 1)
squared(sample, power = 2)


sample_data <- data.frame('sample' = sample, 'sample_with_NA' = sample_with_NA)
str(sample_data)

# using a for() loop to calculate the mean of each column in sample_table
for(j in 1:ncol(sample_table)){
  print(mean(sample_table[,j], na.rm = TRUE))
}

#apply is expecting a vector or table
# mean over columns
apply(X = sample_table, MARGIN = 2, FUN = mean, na.rm = TRUE)

# mean over rows
apply(X = sample_table, MARGIN = 1, FUN = mean, na.rm = TRUE)


# Example 2
mat <- matrix(data = c(1, 2, 3, 4, 5, 
                       6, 7, 8, 9, 10, 
                       11, 12, 13, 14, 15, 
                       16, 17, 18, 19, 20, 
                       21, 22, 23, 24, 25), 
              nrow = 5, ncol = 5)

apply(mat,1,sum)
apply(mat,2,sum)

# lapply(), it is for list
iris_df <- iris
lapply(iris_df,class)

names <- c('Alex', 'Kyle', 'Melissa')
letters <- c('A', 'B', 'C', 'D')
numbers <- c(31, 32, 23, 3, 20, 36, 44,  1, 49, 26)
bools <- c(TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, 
           FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, TRUE, FALSE, 
           TRUE, TRUE, TRUE, FALSE, FALSE)

my_list <- list(names = names,
                letters = letters,
                numbers = numbers,
                bools = bools)
foo_list <-list(names = names)
str(my_list)

lapply(my_list,class)
unlist(lapply(my_list,class))


# sapply() sapply() ==unlist(lapply(...))
sapply(my_list,class)

#Housekeeping
rm(list=ls())
cat('\014')

#install.packages('dplyr')
library(dplyr)

df_sw = as.data.frame(starwars)

# define a function to acount # of NA
count_na <- function(df)
{
  na_na <- sum(is.na(df))
}

# use our new function in the apply family
lapply(df_sw,count_na) # returns a list
sapply(df_sw,count_na) # returns a vector
apply(df_sw,2,count_na) #columns
apply(df_sw,1,count_na) # row

# use apply to calculate number of NA values within each row
df_sw$number_of_null <- apply(df_sw,1,count_na)

# same result as above, but using anonymous function is our sapply function
sapply(df_sw,FUN = function(df){na_na <- sum(is.na(df))})

# use sapply to calculate number of films each character appeared in
df_sw$number_of_films = sapply(df_sw$films,length)











