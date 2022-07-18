# Creating objects

name <- "Alex"
fingers <- 10
name
fingers
ls()
fingers^2
rm(fingers)
fingers <- 10
fingers <- fingers* fingers
name * name

#coding chanllenge
my_object <- 4L
my_object

my_object <- 4
my_object

my_object <- my_object ^3
my_object

my_object <-my_object^(1/3)
my_object

#data types

typeof(8L)
typeof(8)
typeof(TRUE)
typeof(F)
typeof("Hugo")
typeof(4567)
typeof("4567")
4567 == 4567
4567 == "4567"
my_logical <-T
my_integer <-12L
my_double <- 12

# vectors
my_vector <- c(1,2,3,4,5)
my_vector
typeof(my_vector)
length(my_vector)
my_name <- c("Hugo","zhi","AJ")
my_name
typeof(my_name)
length(my_name)

num <- 11:20
?seq()
seq(1) 
?rep()

#coding challenge 
#1
my_vector <- 10:20
my_vector

#2
?seq()
my_vector2 <-seq(10,20)
# is identical to
my_vector2 <- seq(from = 10, to = 20)
my_vector2

#3
my_vector == my_vector2

#4
my_vector3 <-seq(10,20,2)
# is identical to
my_vector3 <- seq(from = 10, to = 20, by = 2)
my_vector3

#5
?rep()
my_vector4 <-rep(4,4)
my_vector4

#6
my_vector5 <-rep(seq(1,4),4)
my_vector5

#7
length(my_vector5)


# some matrices
my_matrix <-rbind(c(1,2,3),c(4,5,6),c(7,8,9))
my_matrix
my_matrix <-cbind(c(1,2,3),c(4,5,6),c(7,8,9))
my_matrix
typeof(my_matrix)

my_matrix2 <-rbind(c("Hugo","AJ"),c("jack","marques"))
my_matrix2

# Modes versus classes
typeof(my_matrix) # "double"
class(my_matrix) # "matrix"

# Factors
vector1 <-c(1,2,3,4)
vector2 <-factor(c(1,2,3,4))
vector1
vector2
vector3 <-factor(c(1,2,3,4,1,2,3,4))
vector3
typeof(vector1)
typeof(vector2)
class(vector1)
class(vector2)
sum(vector1)
sum(vector2)
?sum
levels(vector1)
levels(vector2)
?levels

#Create a list

my_name
fingers
num
vector1
vector3
my_list <-list(my_name,fingers,num,
vector1,vector3)
my_list
typeof(my_list)
class(my_list)

# creating a data frame

my_name
sex <- factor(c("Male","Male","Female"))
bicycles <-c(3,2,2)
data1 <-data.frame(my_name,sex,bicycles)
data2 <-data.frame(name = c("Hugo","Phone","Ding"),
                   money= c(10,30,40),
                   rich = c("T","T","F"))
data1 == data2
typeof(data1)
class(data1)

# Using str internal structure
str(data1)
str(fingers)
str(my_vector)
str(vector1)

#additional commands for structure
length(my_object)
length(vector3)
length(my_name)
length(data1)
is.vector(vector1)
is.vector(data2)
is.vector(my_matrix)
nrow(my_matrix2)
ncol(my_matrix)


#changing data structure
my_vector
length(my_vector)
str(my_vector)
length(my_vector) <-2
my_vector
length(my_vector) <-11
my_vector

vector4 <- c(1,0,1,0,0,1,1)
str(vector4)
vector4 <- as.character(vector4)
str(vector4)
vector4 <- as.numeric(vector4)
str(vector4)
vector4 <- as.logical(vector4)
str(vector4)
vector4 <- as.matrix(vector4)
str(vector4)
vector4 <- as.matrix(vector4)
vector4 <- as.factor(vector4)
str(vector4)

#coding challenge
vector5 <- factor(c(12,13,14,15,12))
sum(as.numeric(as.character(vector5)))

#subscripting
my_name
my_name[1]
my_name[2:3]

my_matrix
my_matrix[1:3,1:3]
range <- c(1,2)
my_matrix[range,range]
my_matrix[range,]
my_matrix[]

data1
data1[1,]
data1[1,1]

#subscripting a list
my_list
my_list[[1]]
my_list[[1]][2]

#loading package
install.packages("magrittr")
install.packages("dplyr")
library(magrittr)
library(dplyr)


#Examining and manipulating data frames
data1
rm(my_name)
data1
data1$my_name
data1$sex
length(data1$my_name)
data1
data1$my_name <-c("Yongye","Zijie","WOW")
data1

#subsetting
data2 <-mtcars
data2
data3 <- data2 %>% filter(cyl ==4 & carb ==1 & am == 1)
data3

#piping
as.numeric(as.character(as.factor(c(12,13,14,15,12))))
c(12,13,14,15,12) %>% as.factor %>% as.character %>% as.numeric

2%>%log(8,base = .)
2%>%log(8,.)

data1$my_name <- data1$my_name %>% tolower
data1$my_name
data1$my_name <-c("YONGYE","ZIJIE","MARQUES")
data1$my_name
data1$my_name %<>% tolower

my_factor <-as.factor(c("12","13","14"))
my_factor
my_factor %<>% as.character %>% as.numeric
my_factor
