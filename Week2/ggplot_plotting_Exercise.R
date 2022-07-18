#1
load("covid data ctp atlantic.RData")
#2
data1$date  %<>% ymd

#3
data1_MA <- data1 %>% filter(state == "MA")
data1_MA$date  %<>% ymd
#4 
# I picked the cases_total

#5
data1_MA$cases_total %<>% as.numeric
ggplot(data1_MA, aes(x = date, y = cases_total))+
  geom_point() + 
  labs(title = "The cases in MA during the Covid 19",
       x = "Date", y = "cases") + theme_classic() +
  ggsave("cases_MA.png")

#6
table(data1$state)
# I choose TX, NJ, MA, CA
data1_state <- data1 %>% filter(state == "MA"|state == "TX"|state == "NJ"|state =="CA")
data1_state$cases_total %<>% as.numeric
#7 and #8 
data1_state %<>% mutate(cases_per_million = case_when(state == "MA" ~ (cases_total/ 6893000),
                                                             state == "TX" ~ (cases_total/ 29000000),
                                                             state == "NJ" ~ (cases_total/ 8882000),
                                                             state == "CA" ~ (cases_total/ 39510000)))

data1_state$cases_per_million_percentage <- data1_state$cases_per_million * 100 

ggplot(data1_state, aes(x = date, y = cases_per_million_percentage, color = state))+
  geom_point() + 
  geom_line() +
  labs(title = "The percentage of cases in the population of the state in MA,TX,NJ,CA",
       subtitle = "A visualization on the Covid 19 outbreak",
       x = "Date", y = "cases_per_million") + theme_foundation() +
  geom_smooth(method = "lowess", se = F) +
  ggsave("covid19Report.png", width = 7, height = 7)

