#read and Prepare Data
rawdata<- read.table("~/Desktop/R-programming/Course4/household_power_consumption.txt", 
                        header= TRUE, sep= ";", na.strings = "?", dec=".")
data1<- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")
asdate<-as.Date(data1$Date, "%d/%m/%Y")
data1$DateTime<- as.POSIXct(paste(data1$Date, data1$Time))
df<- select(data1, DateTime, Global_active_power:Sub_metering_3)
rm(rawdata, data1)

#Graph 1
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency")
dev.copy(png, file = "Plot1")
dev.off()

