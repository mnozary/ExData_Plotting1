
ColClasses <- c("character","character", "numeric",
                "numeric", "numeric", "numeric",
                "numeric", "numeric", "numeric")

data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = ColClasses, na.strings = "?")

ind <- which(data$Date=="1/2/2007")
ind <- rbind(ind, which(data$Date=="2/2/2007"))

new.data <- data[ind, ]

plot(new.data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

dev.copy(png, file = "plot2.png")
dev.off()

