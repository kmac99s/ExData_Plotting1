
load_plotdata <- function() {

df <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",  header = TRUE, stringsAsFactors = FALSE)

df$datetime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

df$Date <-as.Date(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

df <- subset(df, df$Date %in% range)

return(df)

}

load_plotdata()

png("plot2.png", width=504, height=504)

plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

dev.off()
