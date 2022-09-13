library(ggplot2)
library(readr)
library(tidyverse)
library(dplyr)

theme_set(theme_grey())

EUCovid = read.csv('C:/Users/theod/Desktop/DCU/Stats/USA_Covid_Data.csv', fileEncoding="UTF-8-BOM")
# EUCovid = EUCovid[order(as.Date(EUCovid$Date, format="%d/%m/%Y")),]
EUCovid$Date <- strptime(as.character(EUCovid$Date), "%d/%m/%Y");

EUCovid$Date = as.Date(EUCovid$Date);
EUCovid$Cases = EUCovid$Cases/329.5

Date <-EUCovid$Date
EUCovid$weeks <- cut(EUCovid[,"Date"], breaks="week")
agg <- EUCovid %>% group_by(weeks) %>% summarise(agg=sum(Cases))
ggplot(agg, aes(as.Date(weeks), agg)) + geom_bar(stat='identity', fill ="red3" ) + scale_x_date() +
  ylab("Weekly new cases") + xlab("Week") + ggtitle("New Weekly Covid-19 Cases in USA")