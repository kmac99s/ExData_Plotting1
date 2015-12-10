library(dplyr)
library(lubridate)
my_data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",  header = TRUE)

my_data$DateTime <- paste(my_data$Date, my_data$Time)


sub_data <- filter(my_data, DateTime >= as.Date("2006-02-01 00:00:00"), DateTime < as.Date("2006-02-03 00:00:00"))
