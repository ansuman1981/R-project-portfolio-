library(readr)
install.packages("tm")
install.packages("qdap")
install.packages("worldcloud")

install.packages("tidytext") # help you to breakdown text into tokens and work with them in tidy table
install.packages("dplyr")

library(tidytext)
library(dplyr)

airline <- read.csv("airline_sentiment (2).csv")
dim(airline)
names(airline)

## what xg is (confidence cut-off for positive tweets).
xg <- 0.7 # only trust positive tweets with confidence above 0.7

positive_row <- subset(airline,
                       airline_sentiment == "positive" &
                       airline_sentiment.confidence > xg)
nrow(positive_row)
#  now we decide how many good words 
ng<- 100 #From all words in these positive tweets

