#Loading Data for plot3
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data2 <- filter(data,Date == "2007-02-01"|Date == "2007-02-02")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data3 <- data2 %>%
    mutate(DateTime = paste(data2$Date,data2$Time,sep = " "))
data3$DateTime <- strptime(data3$DateTime,format = "%Y-%m-%d %H:%M:%S")

data3$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data3$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data3$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

#Making plot3

png("plot3.png",width=480,height=480)

plot(data3$DateTime,data3$Sub_metering_1,type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data3$DateTime,data3$Sub_metering_2,type = "l",col = "red")
lines(data3$DateTime,data3$Sub_metering_3,type = "l",col = "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()