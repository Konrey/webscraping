## install devtools package if it's not already
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

## install dev version of rtweet from github
devtools::install_github("mkearney/rtweet")
install.packages('httpuv')

## load rtweet package
library(rtweet)
library(httpuv)
library(dplyr)
library(xlsx)


twitter_tokens <- create_token(app = "WebScraperKonrey",
                               consumer_key = "jOmODrMot1QBnhORJnh7MsECC", 
                               consumer_secret = "dgxrgqN7gY5jV7Zqf0EZOIsKiw9djnal8C7jmwjhhN33472Ndu")
# these are not real tokens, they should be replaced with values described in
# obtaining and using access tokens guide.


rt2 <-  get_timeline("kjarocinski", n = 100000)

rt2 <- subset(rt, created_at > 2015-01-01)
rt2$created_at <- as.Date(rt2$created_at)
rt2$tweet_url <- paste('https://twitter.com/kjarocinski/status/', rt2$status_id, sep = '')


rt3 <- rt2[, c('created_at', 'screen_name', 'text', 'tweet_url')]

write.xlsx(rt3, "twitter.xlsx")