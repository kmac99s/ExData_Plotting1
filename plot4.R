#Get Data

df <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",  header = TRUE, stringsAsFactors = FALSE)

df$datetime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

df$Date <-as.Date(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

df<- subset(df, df$Date %in% range)

#Do Plot as a PNG

png("plot4.png", width=504, height=504)

#Call the plots
par(mfrow=c(2,2))

#Plot the first

plot(df$datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power") 

#Plot the second

plot(df$Voltage ~ df$datetime, type="l", xlab="datetime", ylab="Voltage") 


#Plot the third

plot(df$Sub_metering_1 ~ df$datetime, type = "l", ylab = "Energy sub metering", xlab = "") 
lines(df$Sub_metering_2 ~ df$datetime, col="red", type="l")
lines(df$Sub_metering_3 ~ df$datetime, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","blue","red"), box.lwd=0)

#Plot the fourth

plot(df$Global_active_power ~ df$datetime, type="l", xlab = "datetime") 

dev.off()
