## Housekeeping
# rm(list=ls()) # clear environment
# cat('\014') # clear console

## Examples - Relational and Logical Operators

TRUE == TRUE
33 >= 19
TRUE == FALSE
TRUE != TRUE
TRUE != FALSE
TRUE > 1
TRUE >= 1

x <- c(9, 10, 5, 3, 24, 1, 3, 5)
x < 10

x <- c(9, 10, 5, 3, 24, 1, 3, 5)
y <- c(2, 6, 4, 1, 73, 28, 2, 1000)
x >= y

TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

y <- 33
(y > 25) & (y <= 41)

y <- 45
(y > 25) & (y <= 41)

TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

y <- 33
(y < 25) | (y > 41)


y <- 45
(y < 25) | (y > 41)


!TRUE
!(123 == 456)
!('hello' == 'goodbye')

?is.na()
x <- NA
is.na(x)
!is.na(x)

y <- c(NA, 10, NA, 3, 24, 1, NA, 5)
is.na(y)
!is.na(y)

x <- 'hello'
if(x == 'hello'){
  paste(x, ',world',sep = '')
}

# if() only
x <- "goodbye"
if(x == "hello"){
  paste(x, ", world", sep = '')
}

# if() else - example 1
x <- "goodbye"
if(x == "hello"){
  paste(x, ", world", sep = '')
} else {
  print("Please don't go!")
}


# if() else - example 2
x <- 5
if (x > 0) {
  print("x is positive")
} else {
  print("x is not positive")
}

# if() else if() else if
x <- 0
if (x > 0) {
  print("x is positive")
} else if (x < 0) {
  print("x is negative")
} else if (x == 0) {
  print("x is equal to zero")
}

dataframe <- data.frame(number = runif(15,min = -1,max = 20))
dataframe$result <- ifelse((dataframe$number>15),print("Big"),print("small"))
dataframe

dataframe2 <- data.frame(variables = runif(20,min = 10,max =30))
dataframe2$output <-ifelse((dataframe2$variables>20),print("bigger than 20"),ifelse((dataframe2$variables<=15),print("less than or equal to 15"),print("between 15 and 20")))
dataframe2

#for loop
for(i in 1:10)
{
  print(paste("this is loop#",i))
}

breeds <- c('poodle', 'dachshund', 'shih tzu', 'great dane', 'greyhound', 
            'german shepherd', 'bulldog', 'pug', 'beagle', 'dobermann')
#for each loop
for(dogs in breeds)
{
  print(dogs)
}
#each index
for(i in 1:length(breeds))
{
    print(breeds[i])
}
?cat()
for(dogs in breeds)
{
  cat(dogs, ":length",nchar(dogs),"\n")
}

# for loop for table
df_cars <-mtcars
?rownames
df_cars$model <- rownames(df_cars)

for(i in 1:nrow(df_cars))
{
  for(j in 1:ncol(df_cars))
  {
    cat(rownames(df_cars)[i],"-",colnames(df_cars)[j],":",df_cars[i,j],"\n")
  }
}

number <- 10
counter <- 0
while(number >= 5){
  cat("number is set equal to", number, "\n")
  number <- number + 1
  counter <- counter + 1
  if(counter > 200) {
    print("Counter exceeds 200 iterations.")
    break
  }
}


# While Loop - Example 3
number <- 100
while(number >= 5){
  if(number %% 3 == 0){
    number <- number - 1
    next
  }
  cat("number is set equal to", number, "\n")
  number <- number - 1
}
