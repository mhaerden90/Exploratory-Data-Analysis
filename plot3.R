#Peer graded assignment Explanatory data analysis#

#Reading in the data and subsetting dates#
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#replacing ? by NA
replace(data, data=="?", NA)

#Subsetting data to 2007-02-01 and 2007-02-02
subset <- c("1/2/2007", "2/2/2007")
data <- data[data$Date %in% subset,]

#transform data and time values
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(strptime(data$Time, format="%H:%M:%S"), "%H:%M:%S")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#Set to English
Sys.setlocale("LC_TIME", "C")

#Plot 3#
png(filename="plot3.png", width = 480, height = 480)
plot(na.omit(as.numeric(as.character((data$Sub_metering_1)))) ~ data$datetime, type="n", ylab="Energy sub metering", xlab="")
lines(na.omit(as.numeric(as.character((data$Sub_metering_1))))~ data$datetime, col="black")
lines(na.omit(as.numeric(as.character((data$Sub_metering_2)))) ~ data$datetime, col="red")
lines(na.omit(as.numeric(as.character((data$Sub_metering_3)))) ~ data$datetime, col="blue")
legend("topright", lty = c(1, 1,1), lwd= c(1, 1,1), col= c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()