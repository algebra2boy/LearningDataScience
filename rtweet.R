#https://gwu-libraries.github.io/sfm-ui/posts/2017-09-14-twitter-data
#there is an R package called rtweet

install.packages("rtweet")
library("rtweet")
#note: this will search all tweets, and you need a twitter account
#this searches for "rstats"
rt <- search_tweets(
  "#rstats", n = 18000, include_rts = FALSE
)
#note: max number returned is 18,000

attributes(rt)
#name of person who tweeted
rt$screen_name[1:10]
#date and time of tweet
rt$created_at[1:10]
#actual tweet
rt$text[1:10]

#search for covid
rt <- search_tweets(
  "covid", n = 18000, include_rts = FALSE
)

rt[1:10]
#many more tweets about this than about r
rt$text[1:10]

library("ggplot")
#plot a time series of the tweets
rt %>%
  ts_plot("1 minute") +
  ggplot2::theme_minimal() +
  ggplot2::theme(plot.title = ggplot2::element_text(face = "bold")) +
  ggplot2::labs(
    x = NULL, y = NULL,
    title = "Frequency of 'covid' Twitter statuses from past hour",
    subtitle = "Twitter status (tweet) counts aggregated using three-hour intervals",
    caption = "\nSource: Data collected from Twitter's REST API via rtweet"
  )


#a nicer way of displaying it
covid<-search_tweets("#covid", n = 200, include_rts = FALSE)
library(reactable)
reactable(covid)
