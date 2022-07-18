#google trends
rm(list=ls())
#install.packages("gtrendsR")
library("gtrendsR")

heat.search<-gtrends(keyword="heat",geo="US",time="today+5-y")
#all US heat searches in the past 5 years
attributes(heat.search)
#broken down by city
heat.search$interest_by_city[1:10,]
#this just counts the number of hits per city in the past 5 years
length(unique(heat.search$interest_by_city$location))
#70 unique cities
heat.search$interest_by_city[heat.search$interest_by_city$location=="Boston",]
#note: providence is not in the data

#over time
heat.search$interest_over_time[1:5,]
#data is weekly
summary(heat.search$interest_over_time$date)

plot(heat.search$interest_over_time$date,heat.search$interest_over_time$hits,type="l",
     xlab="Date",ylab="Hits")


#get data for a more particular region (Rhode Island in this case)
heat.search<-gtrends(keyword="heat",geo="US-RI",time="today+5-y")
plot(heat.search$interest_over_time$date,heat.search$interest_over_time$hits,type="l",
     xlab="Date",ylab="Hits")
heat.search$interest_over_time[1:5,]
#every 7 days in RI


#try other keywords
covid.search<-gtrends(keyword="covid",geo="US",time="today+5-y")
plot(covid.search$interest_over_time$date,covid.search$interest_over_time$hits,type="l",
     xlab="Date",ylab="Hits")
#sharp increase at the end compared with 0 hits at most time points (and missing data)
table(covid.search$interest_over_time$hits)
#problem: this is categorical (<1)
#anything <1 is set to NA
#we can change that
covid.search$interest_over_time$hits[covid.search$interest_over_time$hits=="<1"&!is.na(covid.search$interest_over_time$hits)]<-.5
covid.search$interest_over_time$hits<-as.numeric(as.character(covid.search$interest_over_time$hits))
plot(covid.search$interest_over_time$date,covid.search$interest_over_time$hits,type="l",
     xlab="Date",ylab="Hits")

#just do past week
covid.search<-gtrends(keyword="covid",geo="US",time="now 7-d")
plot(covid.search$interest_over_time$date,covid.search$interest_over_time$hits,type="l",
     xlab="Date",ylab="Hits")
table(covid.search$interest_over_time$hits)
#Note: it's not actual hits, it's a scale where 100 = max
covid.search$interest_over_time[1:10,]
#we now have hourly data
covid.search$interest_by_city[1:10,]
table(covid.search$interest_by_city$hits)
#which city has the most hits?
covid.search$interest_by_city[covid.search$interest_by_city$hits==100&!is.na(covid.search$interest_by_city$hits),]

#related keywords
covid.search$related_topics[1:5,]
table(covid.search$related_topics$value)


#by state
covid.search$interest_by_region[1:10,]
#we can even map by searchs per area
library("usmap")
library("ggplot2")
library("stringr")
library("maps")
library("ggmap")

usa<-map_data("state")
head(usa)
table(usa$region)

#built-in data from usmap package
data(statepop)
statepop<-data.frame(statepop)
#statepop includes population by state in 2015
#we can add more variables to this


stateSearch<-covid.search$interest_by_region
sum(statepop$full%in%stateSearch$location)
#match these
stateMatch<-match(statepop$full,stateSearch$location)
statepop$covid.hits<-stateSearch$hits[stateMatch]

#test:
plot_usmap(data = statepop, values = "covid.hits", color = "red") + 
  scale_fill_continuous(
    low = "white", high = "red", name = "COVID Searches", label = scales::comma
  ) + theme(legend.position = "right")




#other searches by state
#what state searches for cats the most?
cat.search<-gtrends(keyword="cats",geo="US",time="now 7-d")
cat.by.region<-cat.search$interest_by_region
stateMatch<-match(statepop$full,cat.by.region$location)
statepop$cat.hits<-cat.by.region$hits[stateMatch]
plot_usmap(data=statepop,values="cat.hits")
#default color is blue
cat.by.region[cat.by.region$hits==100,]
cat.by.region[cat.by.region$hits==min(cat.by.region$hits),]



#is there a relationship between how a state voted in 2016 and searches for cats?
statepop$vote2016<-"red"
statepop$vote2016[statepop$full%in%c("California","Colorado","Connecticut","Delaware",
                                     "District of Columbia","Hawaii","Illinois",
                                     "Maine","Maryland","Massachusetts","Minnesota",
                                     "New Hampshire","New Jersey","New Mexico",
                                     "New York","Oregon","Rhode Island","Vermont",
                                     "Virginia","Washington")]<-"blue"
table(statepop$vote2016)
t.test(statepop$cat.hits~statepop$vote2016)
#not significant (everyone likes cats)
t.test(statepop$covid.hits~statepop$vote2016)
#not significant




#another question: which country searches for climate change the most?
#note: this is only searching in english so it is biased
#let's look over the past year
climate.search<-gtrends(keyword="climate change",geo="",time="today 12-m")
climate.search$interest_by_country[1:10,]
#take only non-missing
datNonMiss<-climate.search$interest_by_country[climate.search$interest_by_country$hits!="",]
datNonMiss[1:10,]
#can we match this to map data
#only 60 countries here
datNonMiss$location


data(worldMapEnv)

map.temp<-map("world",plot=F)
attributes(map.temp)
#has lat, long, range, and names
sum(map.temp$names%in%catNonMiss$location)
#50 matches- not bad
#note that in datNonMiss the US is coded as United States while in map.temp it is USA
map.temp$names[map.temp$names=="USA"]<-"United States"
sum(map.temp$names%in%catNonMiss$location)
#51 matches

countryMatch<-match(map.temp$names,datNonMiss$location)
map.temp$climate.count[!is.na(countryMatch)]<-catNonMiss$hits[countryMatch[!is.na(countryMatch)]]
table(map.temp$climate.count)
map.temp$climate.count[map.temp$climate.count=="<1"&!is.na(map.temp$climate.count)]<-"0"
map.temp$climate.count<-as.numeric(map.temp$climate.count)
#colors: <=1 = pink
#2- <10 = hotpink
#10 - <20 = red
#>=20 = darkred
#white = no data
map.temp$color<-rep("white",length(map.temp$climate.count))
map.temp$color[map.temp$climate.count<=2&!is.na(map.temp$climate.count)]<-"pink"
map.temp$color[map.temp$climate.count>2&map.temp$climate.count<10&!is.na(map.temp$climate.count)]<-"hotpink"
map.temp$color[map.temp$climate.count>=10&map.temp$climate.count<20&!is.na(map.temp$climate.count)]<-"red"
map.temp$color[map.temp$climate.count>=20&!is.na(map.temp$climate.count)]<-"darkred"

map("world",fill=T,col=map.temp$color)



