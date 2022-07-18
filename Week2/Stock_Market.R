###################################################
#Introduction to Statistical Programming in R
#Stock Market data, animated gifs
###################################################

rm(list=ls())

########################
#Stock Market Data in R
#######################

#we will be using an API to interact with Yahoo Finance

#how to download the data (for example)- if not using API
#https://finance.yahoo.com/quote/GOOG/history/
#choose your time period and click apply (note: you can also choose 1 yr, 5 yrs, max = since initial offering)
#click download data
#an excel file will be created. save as a .csv


#let's look at Clorox, Delta, Uber, and  
#symbols are clx, dal, uber, and moderna (pharmaceutical)
#start date at Jan 1, 2015

install.packages("rtsdata")
library("rtsdata")
clorox<-ds.getSymbol.yahoo("clx", from = "2015-01-01", to = Sys.Date())
delta<-ds.getSymbol.yahoo("dal", from = "2015-01-01", to = Sys.Date())
uber<-ds.getSymbol.yahoo("uber", from = "2015-01-01", to = Sys.Date())
moderna<-ds.getSymbol.yahoo("mrna", from = "2015-01-01", to = Sys.Date())

head(clorox)

#we have info about date, opening price, high, low, closing price, and volume (number of shares that were traded that day)

dim(clorox)
dim(delta)
dim(uber)
dim(moderna)
#different lengths of time due to when each company became publicly traded

class(clorox)
#this is a time series object

#now make a plot, starting from the earliest date in the time series
#use highest daily price per share
plot(clorox$CLX.High,main="High Price")
#add the other stocks
lines(delta$DAL.High)
#problem: delta prices are not on this axis
#change axis scales
plot.xts(clorox$CLX.High,main="High Price",ylim=c(0,230),grid.col=NA)
#add a legend before we add the other lines
addLegend(legend.loc="topleft", on = 0,
          legend.names = c("Clorox","Delta","Uber","Moderna"), 
          lty=1,
          col=c("black", "red", "blue", "purple"))
lines(delta$DAL.High,col="red")
lines(uber$UBER.High,col="blue")
lines(moderna$MRNA.High,col="purple")


#local min and max
#can select time period if necessary
#it will automatically do it by month:
period.max(clorox$CLX.High,endpoints(clorox))
#or we can do full time period
period.max(clorox$CLX.High,endpoints(clorox)[c(1,length(endpoints(clorox)))])
#local max at March 31 (around the time everything was being shut down)

#check other stocks
period.max(moderna$MRNA.High,endpoints(moderna))
#we see a local max at the end of may

#uber and delta lose value in recent months
period.min(uber$UBER.High,endpoints(uber))
#local min around March 31
period.min(delta$DAL.High,endpoints(delta))
#sharp decrease on March 31 followed by min at end of May

# Today is July 15th
#add a line at July 15
addEventLines(uber["2020-07-15"],lty=2)


#now let's compare the opening and closing price for each stock

#test for Moderna:
moderna$diff<-moderna$MRNA.Close-moderna$MRNA.Open
#neg values = open was higher than close
#pos values = close was higher than open

plot(moderna$diff)
#notice the volitility around March 2020 and later

#try for other stocks
clorox$diff<-clorox$CLX.Close-clorox$CLX.Open
plot(clorox$diff)

uber$diff<-uber$UBER.Close-uber$UBER.Open
plot(uber$diff)

delta$diff<-delta$DAL.Close-delta$DAL.Open
plot(delta$diff)


################
#Animated GIF
################

#let's make a gif of the opening, closing, low, and high for one stock
install.packages("animation")
library("animation")

saveGIF(
  {
    p<-plot(clorox$CLX.High,main="High Price")
    print(p)
    p<-plot(clorox$CLX.Low,main="Low Price")
    print(p)
    plot(clorox$CLX.Open,main="Opening Price")
    p<-print(p)
    plot(clorox$CLX.High,main="Closing Price")
    p<-print(p)
    
  },movie.name="Clorox.gif")

#this is saved under Files as Clorox.gif 

#now show the fluctuation of all stocks over time (opening values)
#let's take only 2020 as an example
clorox<-ds.getSymbol.yahoo("clx", from = "2020-01-01", to = Sys.Date())
delta<-ds.getSymbol.yahoo("dal", from = "2020-01-01", to = Sys.Date())
uber<-ds.getSymbol.yahoo("uber", from = "2020-01-01", to = Sys.Date())
moderna<-ds.getSymbol.yahoo("mrna", from = "2020-01-01", to = Sys.Date())


dates<-seq(as.Date("2020-01-01"),as.Date(Sys.Date()),1)
datesaveGIF(
  {
    for(i in 1:nrow(clorox))
    {
      clorox.open<-clorox$CLX.Open[i]
      delta.open<-delta$DAL.Open[i]
      uber.open<-uber$UBER.Open[i]
      moderna.open<-moderna$MRNA.Open[i]
      
      plot.temp<-barplot(height=c(clorox.open,delta.open,uber.open,moderna.open),
                         names=c("Clorox","Delta","Uber","Moderna"),ylim=c(0,215),
                         main=dates[i],ylab="Opening Price ($)",las=1)
      p<-print(plot.temp)
      
    }
    
  },movie.name="Daily_stock_prices.gif",interval=.1)



################################
#forecasting future data points
################################

install.packages("forecast")
library("forecast")

#create time series
deltaTS<-ts(delta$DAL.High)
summary(deltaTS)
class(deltaTS)

#fit a smooth function to the data
deltaSmooth<-ets(deltaTS)
summary(deltaSmooth)

plot(deltaTS)
lines(fitted(deltaSmooth), col='red')
#h = number of steps to forecast ahead
lines(fitted(deltaSmooth, h=2), col='green')
lines(fitted(deltaSmooth, h=3), col='blue')
lines(fitted(deltaSmooth, h=20), col='red')

#forecast
#forecasting a mean value only: 365 steps ahead (1 year)
#level = confidence level
mf = meanf(deltaTS,h=365,level=c(90,95),fan=FALSE,lambda=NULL)
plot(mf)

#random walk model
md = rwf(deltaTS,h=365,drift=T,level=c(90,95),fan=FALSE,lambda=NULL) 
plot(md) 

#auto arima model (autoregressive integrated moving average)
arimaMod<-auto.arima(deltaTS)
fc.arima<-forecast(arimaMod,h=365)
plot(fc.arima)




plot(clorox$CLX.High, main = "High-prices")
plot.xts(clorox$CLX.High,main="High Price",ylim=c(0,400),grid.col=NA)
lines(delta$DAL.High, col = "blue")
lines(uber$UBER.High, col = "red")
lines(moderna$MRNA.High, col = "green")
addLegend(legend.loc = "topleft", legend.names =c("clorox","delta","uber","moderna"),
                  col = c("black","blue","red","green"),lty = 1)

date <- seq(as.Date("2020-1-1"),as.Date(Sys.Date()),1)
saveGIF(
{
    for(i in 1:nrow(clorox))
    {
      clorox <- clorox$CLX.High[i]
      delta  <-  delta$DAL.High[i]
      uber   <-  uber$UBER.High[i]
      moderna<-  moderna$MRNA.High[i]
      
    plot.temp <- barplot(height = c(clorox,delta,uber,moderna),
                         name = c("clorox","delta","uber","moderna"),
                         ylim = c(0,400),
                         main=date[i])
    p<-print(plot.temp)
    }
  
},movie.name = "stock.gif")

