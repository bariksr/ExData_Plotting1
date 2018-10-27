#Loading Data for plot4
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data2 <- filter(data,Date == "2007-02-01"|Date == "2007-02-02")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data3 <- data2 %>%
    mutate(DateTime = paste(data2$Date,data2$Time,sep = " "))
data3$DateTime <- strptime(data3$DateTime,format = "%Y-%m-%d %H:%M:%S")

data3$Sub_metering_1 <- as.numeric(as.character(data3$Sub_metering_1))
data3$Sub_metering_2 <- as.numeric(as.character(data3$Sub_metering_2))
data3$Sub_metering_3 <- as.numeric(as.character(data3$Sub_metering_3))

data3$Voltage <- as.numeric(as.character(data3$Voltage))
data3$Global_reactive_power <- as.numeric(as.character(data3$Global_reactive_power))

#Making plot4

png("plot4.png",width=480,height=480)
par(mfrow = c(2,2))

# png 1
plot(data3$DateTime,data3$Global_active_power,type = "l",
     xlab = "", ylab = "Global Active Power")
#png 2
plot(data3$DateTime,data3$Voltage,type="l",
     xlab = "datetime",ylab = "Voltage")
#png 3
plot(data3$DateTime,data3$Sub_metering_1,type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data3$DateTime,data3$Sub_metering_2,type = "l",col = "red")
lines(data3$DateTime,data3$Sub_metering_3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
#png 4
plot(data3$DateTime,data3$Global_reactive_power,type="l",
     xlab = "datetime",ylab = "Global_reactive_power")

dev.off()
