
ColClasses <- c("character","character", "numeric",
                "numeric", "numeric", "numeric",
                "numeric", "numeric", "numeric")

data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = ColClasses, na.strings = "?")

ind <- which(data$Date=="1/2/2007")
ind <- rbind(ind, which(data$Date=="2/2/2007"))

new.data <- data[ind, ]

plot(new.data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt="n")
lines(new.data$Sub_metering_2, col="red")
lines(new.data$Sub_metering_3, col="blue")

axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

legend("topright", pch = "-", pt.cex=0.5, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),cex=0.8)

dev.copy(png, file = "plot3.png")
dev.off()
