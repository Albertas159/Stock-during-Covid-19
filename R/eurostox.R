library(ggplot2)
library(readr)
library(tidyverse)
library(dplyr)

theme_set(theme_grey())

EUCovid = read.csv('C:/Users/theod/Desktop/DCU/Stats/EUROSTOXX.csv', fileEncoding="UTF-8-BOM")
# EUCovid = EUCovid[order(as.Date(EUCovid$Date, format="%d/%m/%Y")),]
EUCovid$Date <- strptime(as.character(EUCovid$Date), "%d/%m/%Y");

EUCovid$Date = as.Date(EUCovid$Date);

ymin <- min(EUCovid$EUROSTOXX)

#agg <- EUCovid %>% group_by(weeks) %>% summarise(agg=sum(Cases))
ggplot(EUCovid, aes(as.Date(Date), EUROSTOXX)) + scale_x_date() +   scale_y_continuous(limits=c(2300,3600)) + xlab("Date") + 
  ggtitle("EURO STOXX 50 Index")  +ylab("")+ geom_ribbon(aes(ymin = 2300, ymax = EUROSTOXX), fill = "skyblue3", alpha=0.7) +
  geom_line(colour ="dodgerblue4", size = 1)