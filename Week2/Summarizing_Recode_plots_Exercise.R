# the variable I am choosing is empstat
class(data1$empstat)
#empstat describes your current job/paid employment status
data1$empstat
levels(data1$empstat)

data1$workingHOURS <- data1$empstat %>% Recode(
"'Work full-time (35 hours/week or more)' = 35;
  'Work part-time (15-34 hours/week)'      = 25;
'Work part-time (less than 15 hours/week)'  = 15;
            'Don’t work at all'            =  0") %>% as.character %>% as.numeric
data1$workingHOURS

#Justification 
#I recorded the categorical response about the status of their work to 
# a more understandable numbers that we can easily interpret how many hours they work in a week


describe(data1$workingHOURS)
cro(data1$workingHOURS, data1$gender)
describeBy(data1$workingHOURS, data1$gender)

levels(data1$income)
data1$incomenum <- data1$income %>% Recode(
  "'$0'          = 0;
  '$1-2,499'      = 2000;
  '$2,500-$4,999' = 3800;
  '$5,000-$9,999' = 8500;
  '$10,000-$14,999' =13500;
  '$15,000-$22,499' = 20000;
  '$22,500-$29,999' = 26000;
  '$30,000-$39,999' = 35000;
  '$40,000-$49,999' = 45000;
  '$50,000 or more' = 52000") %>% as.character %>% as.numeric
data1$incomenum

plot(x = data1$workingHOURS, y= data1$incomenum)
abline(lm(data1$incomenum~data1$workingHOURS, data = data1) ,col ="red")
lines(lowess(data1$workingHOURS,data1$incomenum), col = "blue")
 
