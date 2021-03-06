#Get Data

df <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?",  header = TRUE, stringsAsFactors = FALSE)

df$datetime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

df$Date <-as.Date(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")

df <- subset(df, df$Date %in% range)

#Do Plot as a PNG

png("plot1.png", width=504, height=504)

hist(df$Global_active_power, xlim = c(0,6), main = "Global Active Power",  xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red") 

dev.off()
