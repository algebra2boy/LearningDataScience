load("covid data ctp atlantic.RData")


# time object 
install.packages("lubridate")
library(lubridate)

data1$date
as_date(data1$date)
# ymd is year - month -day
data1$date <- ymd(data1$date)

# mdy is month- day-year
temp1 <- "12/30/93"
temp1<- mdy(temp1)


temp2 <- "12/30/93  11:14:03"
mdy_hms(temp2)
temp2 <- mdy_hms(temp2, tz = "EST")

data1$date[1:10]
data1$date[1:10]-1
temp2
temp2-1
temp2 <- "8/2/12 10:34:20"
temp2<- mdy_hms(temp2, tz = "EST")

difftime(temp1,temp2)
difftime(temp2,temp1)
abs(difftime(temp1,temp2,units = "secs"))
abs(difftime(temp1,temp2,units = "mins"))
abs(difftime(temp1,temp2,units = "weeks"))


install.packages("ggplot2")
library(ggplot2)

# gg plots
data1_ma <- data1 %>% filter(state == "MA")
ggplot(data1_ma, aes(x = date, y = deaths_total)) + geom_line() + geom_point()

ggplot(data1_ma, aes(x = date, y = deaths_total))

ggplot(data1_ma, aes(x = date, y = deaths_total)) +
  geom_line()

ggplot(data1_ma, aes(x = date, y = deaths_total)) +
  geom_line() +
  geom_point()
       
data_us <- data1 %>% group_by(date) %>% summarize(deaths_total = sum(deaths_total, na.rm= T))
ggplot(data_us, aes(x = date , y = deaths_total)) +geom_line() +geom_point()

# labels
ggplot(data1_ma, aes(x = date , y = deaths_total)) +geom_line() +geom_point() + 
  labs(title = "Covid_19 Deaths Masschusettes", subtitle = "A visual exploration", 
       x = "Data = April 12 2020 - July 12 2020", y = "deaths_totals",
       caption = "Data provided by the Covid 19 project")

# Fit Lines
ggplot(data1_ma, aes(x = date , y = deaths_total)) +geom_line() +geom_point() + 
  labs(title = "Covid_19 Deaths Masschusettes", subtitle = "A visual exploration", 
       x = "Data = April 12 2020 - July 12 2020", y = "deaths_totals",
       caption = "Data provided by the Covid 19 project")+ geom_smooth(method ="lm")


ggplot(data1_ma, aes(x = date , y = deaths_total)) +geom_line() +geom_point() + 
  labs(title = "Covid_19 Deaths Masschusettes", subtitle = "A visual exploration", 
       x = "Data = April 12 2020 - July 12 2020", y = "deaths_totals",
       caption = "Data provided by the Covid 19 project")+ geom_smooth(method ="lm", se = F)


ggplot(data1_ma, aes(x = date , y = deaths_total)) +geom_line() +geom_point() + 
  labs(title = "Covid_19 Deaths Masschusettes", subtitle = "A visual exploration", 
       x = "Data = April 12 2020 - July 12 2020", y = "deaths_totals",
       caption = "Data provided by the Covid 19 project") + geom_smooth(method ="loess",se = F)


# saving the picture into the working directories
ggplot(data1_ma, aes(x = date , y = deaths_total)) +geom_line() +geom_point() + 
  labs(title = "Covid_19 Deaths Masschusettes", 
       subtitle = "A visual exploration", 
       x = "Data = April 12 2020 - July 12 2020",
       y = "deaths_totals",
       caption = "Data provided by the Covid 19 project")+
       geom_smooth(method ="loess",se = F) +
       ggsave("my_plot.png", width = 4, height = 4)


# color 
ggplot(data1_ma, aes(x = date, y = deaths_total)) +
  geom_line() +
  geom_point() +
  labs(title = "COVID-19 Deaths in Massachusetts",
       subtitle = "A visual exploration",
       x = "Date (April 12, 2020 - July 12, 2020)",
       y = "Total Deaths",
       caption = "Data provided by the COVID Tracking Project") +
  geom_smooth(method = "loess", se = F, color = "aquamarine4") + 
  ggsave("my_plot2.png", width = 6, height = 6)

# grouped scatterplot
# grouped variables must be categorical variables 
data1_ma_fl <- data1 %>% filter(state == "MA"| state == "FL")
data1_ma_fl$deaths_per_mil <- ifelse(data1_ma_fl$state == "MA", 
                                     data1_ma_fl$deaths_total / 6.8925,
                                     data1_ma_fl$deaths_total / 21.4777)
 
ggplot(data1_ma_fl, aes(x = date, y = deaths_total, color = state)) +
  geom_point() +
  labs(title = "COVID-19 Deaths in Massachusetts and Florida",
       subtitle = "A visual exploration",
       x = "Date (April 12, 2020 - July 12, 2020)",
       y = "Total Deaths",
       caption = "Data provided by the COVID Tracking Project",
       color = "State") +
  geom_smooth(method = "loess", se = F) + 
  ggsave("my_plot4.png", width = 6, height = 6)
 
# coding challenge
cars <- mtcars
ggplot(cars, aes(x = hp , y = mpg)) + 
  geom_point() +
  geom_smooth(method = "loess", se = F) +
  labs(title = "Efficiency BY Engine Power", 
         x = "horpower", y ="miles per hour" ) +
  ggsave("mtcars.png", width= 8, height = 8)
  
cars$cyl %<>% factor
ggplot(cars, aes(x = hp , y = mpg, color = cyl)) + geom_point() +
  geom_smooth(method = "lm", se = F, color = "yellow") +
  labs(title = "Efficiency BY Engine Power and Number of Cylinders", 
       x = "horsepower", y ="miles per hour", color = "Cyl" ) +
  ggsave("mtcars2.png", width= 8, height = 8)

# Themes 
cars$cyl %<>% factor
ggplot(cars, aes(x = hp , y = mpg, color = cyl)) + geom_point() +
  geom_smooth(method = "lm", se = F, color = "yellow") +
  labs(title = "Efficiency BY Engine Power and Number of Cylinders", 
       x = "horsepower", y ="miles per hour", color = "Cyl" ) +
  theme_minimal()

library(ggthemes)
cars$cyl %<>% factor
ggplot(cars, aes(x = hp , y = mpg, color = cyl)) + geom_point() +
  geom_smooth(method = "lm", se = F, color = "yellow") +
  labs(title = "Efficiency BY Engine Power and Number of Cylinders", 
       x = "horsepower", y ="miles per hour", color = "Cyl" ) +
  theme_fivethirtyeight()
