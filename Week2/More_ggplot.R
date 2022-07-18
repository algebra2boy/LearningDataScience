library(dplyr)
library(ggplot2)
library(lubridate)

load("covid data ctp atlantic2.RData")
data2 <- data2 %>% select(date, state, positiveIncrease, negativeIncrease, 
                          hospitalizedIncrease, deathIncrease)

# Goal:
# Plot the number of days per month the state of Rhode Island reported to the 
# appropriate public health authorities since the outbreak of COVID-19 in the U.S.

# Step 1: Transform `date` into a Date format using `lubridate`
# havn't loaded package lubridate
data2 <- data2 %>% mutate(date = lubridate::ymd(date))
# already loading the package
data2 <- data2 %>% mutate(date = ymd(date))

# Step 2: Make new variable called month, using lubridate's `month()`
data2 <- data2 %>% mutate(month = month(date, label = T, abbr = T))

# Step 3: Use ggplot's `geom_bar()` to plot number of days per month RI appears in data2
data2_ri <- data2 %>% filter(state == "RI")

ggplot(data2_ri, aes(x = month)) +
  geom_bar() +
  labs(
    x = "Month",
    y = "# of Days Reported",
    title = "COVID-19 Reports by Month (RI Only)",
    subtitle = "A visual exploration",
    caption = "Data provided by the COVID Tracking Project"
  ) +
  theme_minimal()

ggplot(data2_ri, aes(x = month, fill = month)) + 
  geom_bar() + 
  labs(
    x = "Month",
    y = "# of Days Reported",
    title = "COVID-19 Reports by Month (RI Only)",
    subtitle = "A visual exploration",
    caption = "Data provided by the COVID Tracking Project"
  ) + theme_minimal()

ggplot(data2_ri, aes(x = month, fill = month)) +
  geom_bar() +
  scale_fill_brewer(palette = "Reds") +
  labs(
    x = "Month",
    y = "# of Days Reported",
    title = "COVID-19 Reports by Month (RI Only)",
    subtitle = "A visual exploration",
    caption = "Data provided by the COVID Tracking Project",
    fill = "Month"
  ) +
  theme_minimal()

# coding challenege
cars <- mtcars
cars$cyl <- as.factor(cars$cyl)
ggplot(cars, aes(x = cyl, fill = cyl))+ 
  geom_bar() + 
  scale_fill_brewer(palette = "Blues") +
  labs(title = "# of Cars by Cylinders",
       x = "cyl", y = "count") 

    


# Introduction to Geospatial Plotting
library(magrittr)
library(dplyr)
library(car)
library(mapdata)
library(usmap)
library(ggplot2)
library(ggthemes)

load("covid data ctp atlantic2.RData")

# load a map of the usa
? map_data
china_map_data <- map_data("china")
usa_map_data  <- map_data("usa")
world_map_data <- map_data("world2Hires")


# making a basic map
# draw a map of the usa

usa_basic1 <- ggplot(usa_map_data) + 
  geom_polygon(aes(x = long, y = lat, group = group, fill = region)) +
  labs(title = "Map of the USA") +
  theme_fivethirtyeight() +
  theme(axis.text = element_blank(),
  panel.grid.major = element_blank())


# Projection
library(mapproj)
usa_basic2 <- ggplot(usa_map_data) + 
  geom_polygon(aes(x = long, y = lat, group = group, fill = region)) +
  labs(title = "Map of the USA") +
  theme_fivethirtyeight() + 
  theme(axis.title.x = element_text(color = "gray32"),
        axis.title.y = element_text(color = "gray32")) +
  labs(x = "Longitude", y = "Latitude")
        
usa_basic2
usa_basic2 + coord_map("mercator") # textbook display
?mapproject
usa_basic2 + coord_map("conic", lat0 =30)
usa_basic2 + coord_quickmap()
usa_basic2 + coord_map("eisenlohr")

# coding exercise
?map_data
italy_map_data<- map_data("italy")
italy <- ggplot(italy_map_data) + 
  geom_polygon(aes(x = long, y = lat, group = group, fill = region)) +
  labs(title = "Map of the France", x = "Longitude", y = "Latitude") + 
  theme_minimal() 

italy + coord_quickmap()


png_data <- map_data("world2Hires")
png_data %<>% filter(region == "Papua New Guinea")
png_data$subregion %<>% Recode("NA = 'Mainland'")
png_map <- ggplot(png_data) +
  geom_polygon(aes(x = long, y = lat, fill = subregion)) +
  theme_gdocs() +
  labs(title = "Papua New Guinea",
       x = "Longitude",
       y = "Latitude") +
  coord_quickmap()
png_map
png_map + theme(axis.title.x = element_text(face = "bold"),
                axis.title.y = element_text(face = "bold"))


# merging data
state_map_data <- map_data("state")

library(openintro)
library(lubridate)

data2$state %<>% abbr2state %>% tolower
data2$date %<>% ymd
data2_20200714 <- data2 %>% filter(date == "2020-07-14")
merge_state_data <- left_join(state_map_data, data2_20200714, by = c("region" = "state"))


state_basic1 <- ggplot(merge_state_data) +
  geom_polygon(aes(x = long, y = lat, group = region, fill = region)) +
  labs(title = "States of the USA") +
  theme_fivethirtyeight() +
  theme(axis.title.x = element_text(color = "gray32"),
        axis.title.y = element_text(color = "gray32")) +
  labs(x = "Longitude", y = "Latitude") +
  coord_quickmap()

state_basic1

merge_state_data %<>% arrange(region, order)

state_basic2 <- ggplot(merge_state_data) +
  geom_polygon(aes(x = long, y = lat, group = group, fill = region)) +
  labs(title = "States of the USA") +
  theme_fivethirtyeight() +
  theme(axis.title.x = element_text(color = "gray32"),
        axis.title.y = element_text(color = "gray32")) +
  labs(x = "Longitude", y = "Latitude") +
  coord_quickmap()

state_basic2

data3 <- read.csv("state_population_data.csv")
data3$state %<>% tolower
merge_state_data %<>% left_join(data3, by = c("region" = "state"))
merge_state_data$popestimate2019 <- merge_state_data$popestimate2019 / 1000000
merge_state_data$hospcur_per_mil <- merge_state_data$hospitalizedCurrently / merge_state_data$popestimate2019



# final plot
state_basic4 <- ggplot(merge_state_data) +
  geom_polygon(aes(x = long, y = lat, group = group, fill = hospcur_per_mil), color="black") +
  labs(title = "Hospitalized Pts Per Million Population by State") +
  theme_fivethirtyeight() +
  theme(axis.title.x = element_text(color = "gray32"),
        axis.title.y = element_text(color = "gray32")) +
  labs(x = "Longitude", y = "Latitude", fill = "Hosptialized Per Million") +
  coord_quickmap() +
  scale_fill_gradientn(colors = c("white","yellow","orange","red","darkred"),
                       limits = c(0,5000))

state_basic4




mask_data %<>% filter(state !="hawaii"&state != "maryland")
mask_data$infection_rate

for(i in 1:nrow(mask_data))
{
  state <- mask_data[i,2]
  if(state == "california")
  {
    mask_data$infection_rate<- mask_data$positive/ 39510000
  }else if(state == "connecticut")
  {
    mask_data$infection_rate<- mask_data$positive/ 3565000
  }else if(state == "illinois")
  {
    mask_data$infection_rate<- mask_data$positive/ 12670000
  }else if(state == "massachusetts")
  {
    mask_data$infection_rate<- mask_data$positive/ 6893000
  }else if(state == "new mexico")
  {
    mask_data$infection_rate<- mask_data$positive/ 2097000
  }else
  {
    mask_data$infection_rate<- mask_data$positive/ 8399000
  }
}
mask_california$infection_rate <- (mask_california$positive / 39510000)*100
plot1 <- ggplot(mask_california, aes(x = date , y = infection_rate)) + geom_area() +
  labs(title ="Positive case within the population of California", x = "Date (June 4, 2020- July 1 2020)",y = "Percentage", caption = "Data provided by the Atlantic") +
  ggsave("Infection_CA.png")

mask_connecticut$infection_rate <- (mask_connecticut$positive/ 3565000)*100
plot2<-ggplot(mask_connecticut, aes(x = date , y = infection_rate)) + geom_area() +
  labs(title ="Positive case within the population of Connecticut", x = "Date (April 6, 2020- May 3 2020)",y = "Percentage",caption = "Data provided by the Atlantic") +
  ggsave("Infection_Co.png")

mask_illinois$infection_rate <- (mask_illinois$positive/ 12670000) *100
plot3<- ggplot(mask_illinois, aes(x = date , y = infection_rate)) + geom_area() +
  labs(title ="Positive case within the population of Illinois", x = "Date (April 17, 2020- May 14 2020)", y = "Percentage",caption = "Data provided by the Atlantic") +
  ggsave("Infection_IL.png")

mask_massachusetts$infection_rate<- (mask_massachusetts$positive/ 6893000) *100
plot4<- ggplot(mask_massachusetts, aes(x = date , y = infection_rate)) + geom_area() +
  labs(title ="Positive case within the population of Massachusetts", x = "Date (April 22, 2020- May 19, 2020)",y = "Percentage", caption = "Data provided by the Atlantic") +
  ggsave("Infection_MA.png")


mask_new_mexico$infection_rate <- (mask_new_mexico$positive/ 2097000) *100
plot5<-ggplot(mask_new_mexico, aes(x = date , y = infection_rate)) + geom_area() +
  labs(title ="Positive case within the population of New Mexico", x = "Date (May 2, 2020- May 29, 2020)",y = "Percentage", caption = "Data provided by the Atlantic") +
  ggsave("Infection_NM.png")


mask_new_york$infection_rate <- (mask_new_york$positive /8399000) *100
plot6<- ggplot(mask_new_york, aes(x = date , y = infection_rate)) + geom_area() +
  labs(title ="Positive case within the population of New York", x = "Date (April 1, 2020- April 28, 2020)",y = "Percentage", caption = "Data provided by the Atlantic") +
  ggsave("Infection_NY.png")

require(gridExtra)
grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,ncol =3) 
