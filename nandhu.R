# IMPORTING LIBRARIES
library(rvest)
library(dplyr)
library(stringr)
library(robotstxt)

url <- "https://www.imdb.com/list/ls055386972/"

path = paths_allowed(url)

web <- read_html (url)
View(web)

names <- web %>% html_nodes(".lister-item-header a") %>% html_text()
View(names)

rating <- web %>% html_nodes(".ipl-rating-star.small .ipl-rating-star__rating") %>% html_text()
View(rating)

time <- web %>% html_nodes(".runtime") %>% html_text()
View(time)

drama <- web %>% html_nodes(".genre") %>% html_text()
View(drama)

movie = data.frame(names, rating, time, drama)
View(movie)

write.csv(movie, "imdb_movies.csv")

str(movie)