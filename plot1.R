load_plotdata <- function() {

df <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",  header = TRUE, stringsAsFactors = FALSE)

df$datetime <- as.Date(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

df <- subset(my_data, datetime %in% range)

}

load_plotdata()

png("plot1.png", width=504, height=504)

hist(df$Global_active_power, xlim = c(0,6), main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red") 

dev.off()
