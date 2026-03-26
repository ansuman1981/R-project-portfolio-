library(readr)
install.packages("tm")
install.packages("qdap")
install.packages("worldcloud")

airline <- read.csv("airline_sentiment (2).csv")
dim(airline)
names(airline)

## what xg is (confidence cut-off for positive tweets).
xg <- 0.7
