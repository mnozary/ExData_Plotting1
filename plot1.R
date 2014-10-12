ColClasses <- c("character","character", "numeric",
                "numeric", "numeric", "numeric",
                "numeric", "numeric", "numeric")

data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = ColClasses, na.strings = "?")

ind <- which(data$Date=="1/2/2007")
ind <- rbind(ind, which(data$Date=="2/2/2007"))

new.data <- data[ind, ]

hist(new.data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()
