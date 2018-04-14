#Installing the web scraping package rvest
install.packages("rvest")
library(rvest)

#Specifying the url for desired website to be scrapped
url <- 'http://pgdbablog.wordpress.com/2015/12/10/pre-semester-at-iim-calcutta/'

#Reading the HTML code from the website
webpage <- read_html(url)

#Know about the selector gadget
vignette("selectorgadget")

#Using CSS selectors to scrap the post date
post_date_html <- html_nodes(webpage,'.entry-date')

#Converting the post date to text
post_date <- html_text(post_date_html)

#Verify the date captured
post_date

#Using CSS selectors to scrap the title and title summary sections
title_summary_html <- html_nodes(webpage,'em')

#Converting the title data to text
title_summary <- html_text(title_summary_html)

#Check the title of the article
title_summary[2]
#Read the title summary of the article
title_summary[1]

#Using CSS selectors to scrap the blog content
content_data_html <- html_nodes(webpage,'p')

#Converting the blog content data to text
content_data <- html_text(content_data_html)

#Let's see how much content we have captured
length(content_data) #the output is 38

#Reading the content of the article
content_data[1]
content_data[2]
content_data[3]
content_data[4]
content_data[5]
content_data[6]
content_data[7]
content_data[8]
content_data[9]
content_data[10]
content_data[11]

#Using CSS selectors to scrap the names of people who commented
comments_html <- html_nodes(webpage,'.fn')

#Converting the commenters to text
comments <- html_text(comments_html)

#Let's have a look at all the names
comments
#What are the total number of comments made?
length(comments) #8 comments
#How many different people made comments?
length(unique(comments)) #6 people

#convert all the data into a data frame
first_blog<-data.frame(Date = post_date, Title = title_summary[2],Description = title_summary[1], content=paste(content_data[1:11], collapse = ''), commenters=length(comments))

#Checking the structure of the data frame
str(first_blog) #all the features are factors and need to be converted into appropriate types

#Scraping your second webpage:
#Specifying the url for desired website to be scrapped
url <- 'http://pgdbablog.wordpress.com/2015/12/18/pgdba-chronicles-first-semester/'

#Reading the HTML code from the website
webpage <- read_html(url)

#Using CSS selectors to scrap the rankings section
post_date_html <- html_nodes(webpage,'.entry-date')

#Converting the ranking data to text
post_date <- html_text(post_date_html)

#Let's have a look at the rankings
post_date

#Using CSS selectors to scrap the title section
title_summary_html <- html_nodes(webpage,'em')

#Converting the title data to text
title_summary <- html_text(title_summary_html)

#Let's have a look at the titles
title_summary[1]
title_summary[2]
title_summary[3]
title_summary[4]
title_summary[5]
title_summary[6]

#Setting an html_session
webpage <- html_session(url)

#Getting the image using the tag
Image_link <- webpage %>% html_nodes(".wp-image-54")

#Fetch the url to the image
img.url <- Image_link[1] %>% html_attr("src")

#Save the image as a jpeg file in the working directory
download.file(img.url, "test.jpg", mode = "wb")

#Scraping your third webpage from imdb:

#Specifying the url for desired website to be scrapped
url <- 'http://www.imdb.com/title/tt1210166/'

#Reading the HTML code from the website
webpage <- read_html(url)

#Scraping the cast using titleCast tag
cast_html =  html_nodes(webpage,"#titleCast .itemprop span")
#Convert to text
cast=html_text(cast_html)
#Let’s see our cast for the moneyball movie
cast

#scraping the cast using table tag
cast_table_html =  html_nodes(webpage,"table")
#Converting the cast to a table
cast_table=html_table(cast_table_html)
#Checking the first table on the website which represents the cast
cast_table[[1]]