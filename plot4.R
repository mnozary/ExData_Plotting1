
ColClasses <- c("character","character", "numeric",
                "numeric", "numeric", "numeric",
                "numeric", "numeric", "numeric")

data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = ColClasses, na.strings = "?")

ind <- which(data$Date=="1/2/2007")
ind <- rbind(ind, which(data$Date=="2/2/2007"))

new.data <- data[ind, ]

par(mfrow = c(2, 2))

#Plot for row 1 column 1
plot(new.data$Global_active_power, type="l", ylab="Global Active Power", xlab="", xaxt="n")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

#Plot for row 1 column 2
plot(new.data$Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

#Plot for row 2 column 1
plot(new.data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(new.data$Sub_metering_2, col="red")
lines(new.data$Sub_metering_3, col="blue")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright", pch = "-", pt.cex=0.4, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.4)

#Plot for row 2 column 2
plot(new.data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))


dev.copy(png, file = "plot4.png")
dev.off()
