Best <- read.csv("Best_mask_hospitalization_all_locs.csv", header = T)
worst<- read.csv("Worse_hospitalization_all_locs.csv", header = T)
summary <- read.csv("Summary_stats_all_locs.csv", header = T)
masks_state <- read.csv("state_mask_data - Sheet1.csv", header = T)

library(stringr)
# sorting out the state we want
masks_state <- filter(masks_state, mask_date != "NA")

# To capitalise 
apply(masks_state,2,str_to_title)

Best <- filter(Best, location_name =="California"|
                location_name =="Connecticut"|
                location_name =="Hawaii"|
                location_name =="Illinois"|
                location_name =="Massachusetts"|
                location_name =="Maryland"|
                location_name =="New Mexico"|
                location_name =="New York")

worst <- filter(worst, location_name =="California"|
                  location_name =="Connecticut"|
                  location_name =="Hawaii"|
                  location_name =="Illinois"|
                  location_name =="Massachusetts"|
                  location_name =="Maryland"|
                  location_name =="New Mexico"|
                  location_name =="New York")

summary <- filter(summary, location_name =="California"|
                  location_name =="Connecticut"|
                  location_name =="Hawaii"|
                  location_name =="Illinois"|
                  location_name =="Massachusetts"|
                  location_name =="Maryland"|
                  location_name =="New Mexico"|
                  location_name =="New York")
library(ggplot2)
ggplot(mask_data, aes(x = date, y = positive, color = state)) + 
  geom_point() +
  geom_line()+
  labs(title ="positive cases over time in 8 states",
       x = "Data",
       y = "Postive") +
    theme_light() + ggsave("positive.png")
 
ggplot(mask_data, aes(x = date, y = negative, color = state)) + 
  geom_point() +
  geom_line()+
  labs(title ="negative cases over time in 8 states",
       x = "Data",
       y = "negative") +
  theme_light() + ggsave("negative.png")

# massive work


# New York graph
load("mask_california.RData")
load("mask_connecticut.RData")
load("mask_hawaii.RData")
load("mask_illinois.RData")
load("mask_maryland.RData")
load("mask_new_mexico.RData")
load("mask_new_york.RData")
load("mask_massachuesetts.RData")



# New York
ggplot(data = mask_new_york, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in New York", subtitle = "Before and after mask mandate", 
       x = "Date (April 1, 2020- April 28, 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_new_york$mask_date) + ggsave("NewYork.png")

# MA
ggplot(data = mask_massachusetts, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in Massachusetts", subtitle = "Before and after mask mandate", 
       x = "Date (April 22, 2020- May 19, 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_massachusetts$mask_date) + ggsave("MA.png")

#New Mexico
ggplot(data = mask_new_mexico, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in New Mexico", subtitle = "Before and after mask mandate", 
       x = "Date (May 2, 2020- May 29, 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_new_mexico$mask_date) + ggsave("NewMexico.png")
  

# Maryland
ggplot(data = mask_maryland, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in Maryland", subtitle = "Before and after mask mandate", 
       x = "Date (April 1, 2020- April 28 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_maryland$mask_date) + ggsave("Maryland.png") 

# illionis
ggplot(data = mask_illinois, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in Illinois", subtitle = "Before and after mask mandate", 
       x = "Date (April 17, 2020- May 14 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_illinois$mask_date) + ggsave("Illinois.png") 

#Connecticut
ggplot(data = mask_connecticut, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in Connecticut", subtitle = "Before and after mask mandate", 
       x = "Date (April 6, 2020- May 3 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_connecticut$mask_date) + ggsave("Conn.png") 

#CAlifornia
ggplot(data = mask_california, aes(x = date, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + 
  labs(titles = "Covid- 19 Hospitalizations in California", subtitle = "Before and after mask mandate", 
       x = "Date (June 4, 2020- July 1 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
  geom_vline(xintercept = mask_california$mask_date) + ggsave("CA.png") 


load("mask_california.RData")
load("mask_connecticut.RData")
load("mask_hawaii.RData")
load("mask_illinois.RData")
load("mask_maryland.RData")
load("mask_new_mexico.RData")
load("mask_new_york.RData")
load("mask_massachuesetts.RData")

days <- -14
for(i in 1:nrow(mask_massachusetts))
{
  mask_massachusetts$day_away_mandate[i] <- days
  days <- days+1
}

# New York 2 
plot1 <-ggplot(data = mask_new_york, aes(x = day_away_mandate, y = hospitalizedCurrently)) + 
  geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
  labs(titles = "Covid-19 Hospitalizations in New York", subtitle = "Before and after mask mandate (April 15, 2020)", 
       x = "Date (April 1, 2020- April 28, 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") + 
  geom_vline(xintercept = 0, color = "red") + ggsave("NewYork2.png")
  

  # MA 2
plot2 <-  ggplot(data = mask_massachusetts, aes(x = day_away_mandate, y = hospitalizedCurrently)) + 
    geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
    labs(titles = "Covid-19 Hospitalizations in Massachusetts", subtitle = "Before and after mask mandate (May 6, 2020)", 
         x = "Date (April 22, 2020- May 19, 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
    geom_vline(xintercept = 0) + ggsave("MA2.png")
  
  #New Mexico 2
plot3 <-  ggplot(data = mask_new_mexico, aes(x = day_away_mandate, y = hospitalizedCurrently)) + 
    geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
    labs(titles = "Covid-19 Hospitalizations in New Mexico", subtitle = "Before and after mask mandate (May 16, 2020)", 
         x = "Date (May 2, 2020- May 29, 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
    geom_vline(xintercept = 0) + ggsave("NewMexico2.png")
  
  
  # illionis 2 
plot4 <-  ggplot(data = mask_illinois, aes(x = day_away_mandate, y = hospitalizedCurrently)) + 
    geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
    labs(titles = "Covid-19Hospitalizations in Illinois", subtitle = "Before and after mask mandate (May 1, 2020)", 
         x = "Date (April 17, 2020- May 14 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
    geom_vline(xintercept = 0) + ggsave("Illinois2.png") 
  
  #Connecticut 2
plot5 <-  ggplot(data = mask_connecticut, aes(x = day_away_mandate, y = hospitalizedCurrently)) + 
    geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
    labs(titles = "Covid-19 Hospitalizations in Connecticut", subtitle = "Before and after mask mandate (April 20, 2020)", 
         x = "Date (April 6, 2020- May 3 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
    geom_vline(xintercept = 0) + ggsave("Conn2.png") 
  
  #CAlifornia 2
plot6<-  ggplot(data = mask_california, aes(x = day_away_mandate, y = hospitalizedCurrently)) + 
    geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
    labs(titles = "Covid-19 Hospitalizations in California", subtitle = "Before and after mask mandate (June 18, 2020)", 
         x = "Date (June 4, 2020- July 1 2020)", y = "Currenly Hospitalized Covid-19 Patients", caption = "Data provided by the Atlantic") +
    geom_vline(xintercept = 0) + ggsave("CA2.png") 
  
  
grid.arrange(plot1,plot2,plot3,plot4,plot5,plot6,ncol =3) 



load("mask_data_updated.RData")
mask_data

column <- seq(-14,13,1)
mask_data$day_away <- column
mask_data


final_plot <- ggplot(data = mask_data, aes(x = day_away, y =hospitalizedCurrently, color = state)) + 
  geom_point() + geom_line() + xlim(-15,15) + scale_x_continuous(breaks = seq(-15,15, by = 3)) +
  labs(title = "Covid-19 Hospitalizations",
       substitle ="Before and after mask mandate",
       x = "Days away from mask mandate",
       y = "Currently Hospitalized Covid-19 Patients",
       caption = "Data provided by the Atlantic") +
      geom_vline(xintercept = 0, color = "red") +
      theme_fivethirtyeight() +
     theme(axis.title.x = element_text(color = "gray32", face = "bold"),
       axis.title.y = element_text(color = "gray32", face = "bold"),
       plot.title = element_text(hjust = 0.5)) + 
      ggsave("CombinationALLState.png", width = 6, height = 6)
    
  
  
  
