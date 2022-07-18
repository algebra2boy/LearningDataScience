rm(list=ls())

data("Seatbelts")
Seatbelts<- data.frame(Seatbelts)

# number of drivers vs. seatbelt law
# 0 is no law, 1 is with law, so this is categorical data
?t.test
t.test(DriversKilled~law,data = Seatbelts)

# mean of without seatbelt law is 125.87
# mean of with seatbelt law is 100.26
# p- value is 1.693e-05
#
# p-value is less than 0.05, so it is statistically significant and 
# we can conclude that more drivers were significantly killed when there wasn't a seatbelt law



t.test(rear~law, data = Seatbelts)
# mean no law   is 400.3195
# mean with law is 407.7391 
# p- value is 0.6455(p>0.10)
# p- value is bigger than 0.05 and 0.10, so there is no relationship at all between 
# the data of seatbelt law and number of passengers killed by the rear





t.test(front~law, data = Seatbelts)
# mean no law is  873.4556 
# mean with law is 570.9565 

# p- value is 2.2e-16
# p- value is less than 0.05, so there is statistically significant and 
# we can conclude there is more number of passengers killed by the front without law

