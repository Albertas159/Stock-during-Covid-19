library(ggplot2)
library(readr)
library(tidyverse)
library(dplyr)

theme_set(theme_grey())

EUCovid = read.csv('C:/Users/theod/Desktop/DCU/Stats/DowJones.csv', fileEncoding="UTF-8-BOM")
# EUCovid = EUCovid[order(as.Date(EUCovid$Date, format="%d/%m/%Y")),]
EUCovid$Date <- strptime(as.character(EUCovid$Date), "%d/%m/%Y");

EUCovid$Date = as.Date(EUCovid$Date);

ymin <- min(EUCovid$Date)

agg <- EUCovid %>% group_by(weeks) %>% summarise(agg=sum(Cases))
ggplot(EUCovid, aes(as.Date(Date), DJIA)) + scale_x_date()+
  scale_y_continuous(limits=c(18000,31000)) + xlab("Date") + 
  ggtitle("Dow Jones Industrial Average Index")  +ylab("")+ geom_ribbon(aes(ymin = ymin, ymax = DJIA), fill = "lightcoral", alpha=0.7) +
  geom_line(colour ="red3", size = 1)
