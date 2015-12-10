
load_plotdata <- function() {

df <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",  header = TRUE, stringsAsFactors = FALSE)

df$datetime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

df$Date <-as.Date(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

df<- subset(df, df$Date %in% range)

return(df)
}

load_plotdata()

png("plot3.png", width=504, height=504)

plot(df$Sub_metering_1 ~ df$datetime, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(df$Sub_metering_2 ~ df$datetime, col="red", type="l")
lines(df$Sub_metering_3 ~ df$datetime, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

dev.off()
