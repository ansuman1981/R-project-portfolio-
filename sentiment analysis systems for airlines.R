library(readr)
install.packages("tm")
install.packages("qdap")
install.packages("worldcloud")

install.packages("tidytext") # help you to breakdown text into tokens and work with them in tidy table
install.packages("dplyr") # helps to manupiulate data frames 

library(tidytext)
library(dplyr)
#2i
airline <- read.csv("airline_sentiment (2).csv")
dim(airline)
names(airline)
#2ii
## what xg is (confidence cut-off for positive tweets).
xg <- 0.7 # only trust positive tweets with confidence above 0.7

positive_row <- subset(airline,
                       airline_sentiment == "positive" &
                       airline_sentiment.confidence > xg)
nrow(positive_row)
#  now we decide how many good words 

ng<- 100   #From all words in these positive tweets

#%>%: the pipe; it means “take the result on the left and pass it into the next function.”
#select(text): from pos_rows, keep only the text column (we only need the tweet text now).
# unnest_tokens(word, text): take that text column and split it into individual words:
positive_words <- positive_row %>%
  select(text) %>%
  unnest_tokens(word, text)

## Which words appear most often in my positive tweets, and how many times.
good_words_count <- positive_words %>%
  count(word, sort=TRUE)
head(good_words_count,10)

#2iii
# get how many bad words less than the xb
xb <- 0.7

nagative_row <- subset(airline,
                       airline_sentiment == "negative" &
                       airline_sentiment.confidence < xb)