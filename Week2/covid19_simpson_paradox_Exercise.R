covid <- read.csv("covid_italy_china.csv", header = T) 

China_caseFatalites <- NULL
Italy_caseFatalites <- NULL

for(i in 1:9)
{
  China_caseFatalites[i] =  covid[i,5] / covid[i,4]
  Italy_caseFatalites[i] =  covid[i,3] / covid[i,2]
}
cbind(covid,China_caseFatalites, Italy_caseFatalites)

# In both China and Italy, the age group of 80 has higher rates.

overall_China_caseFatality <- sum(covid[,5])/sum(covid[,4])
overall_Italy_caseFatality <- sum(covid[,3])/sum(covid[,2])

# Italy has a higher case fatality rate.

sum(covid$Italy.Cases)
sum(covid$China.Cases)
# China has an older population, I think the cause of the difference in overall rate vs. age rate
# is because cases in China who got covid-19 are more concentrate between age 30-39 and age age 60-69,
# but cases in Italy who got covid- 19 are more concentrate between age 70-79 and age >=80.
# so the case fatailites in China should be lower than in Italy because of China's age group are more spread 
