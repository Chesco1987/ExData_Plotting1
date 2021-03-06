#read and Prepare Data
rawdata<- read.table("~/Desktop/R-programming/Course4/household_power_consumption.txt", 
                     header= TRUE, sep= ";", na.strings = "?", dec=".")
data1<- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")
asdate<-as.Date(data1$Date, "%d/%m/%Y")
data1$DateTime<- as.POSIXct(paste(data1$Date, data1$Time))
df<- select(data1, DateTime, Global_active_power:Sub_metering_3)
rm(rawdata, data1)

#Graph 4
par(mfrow = c(2,2))
plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
plot(df$DateTime, df$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df$DateTime, df$Sub_metering_1, col ="black", type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd= "1")
plot(df$DateTime, df$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file= "Plot4")
dev.off()
