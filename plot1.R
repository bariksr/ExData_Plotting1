#Loading Data for plot1
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data2 <- filter(data,Date == "2007-02-01"|Date == "2007-02-02")
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

#Making plot 1    

png("plot1.png",width=480,height=480)

hist(data2$Global_active_power,col="red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
 