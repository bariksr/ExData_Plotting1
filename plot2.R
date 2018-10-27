#Loading Data for plot2
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data2 <- filter(data,Date == "2007-02-01"|Date == "2007-02-02")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data3 <- data2 %>%
    mutate(DateTime = paste(data2$Date,data2$Time,sep = " "))
data3$DateTime <- strptime(data3$DateTime,format = "%Y-%m-%d %H:%M:%S")

#Making plot2

png("plot2.png",width=480,height=480)

plot(data3$DateTime,data3$Global_active_power,type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()