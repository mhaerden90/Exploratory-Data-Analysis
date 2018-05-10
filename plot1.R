#Peer graded assignment Explanatory data analysis - plot 1#

#Reading in the data and subsetting dates#
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#replacing ? by NA
replace(data, data=="?", NA)

#Subsetting data to 2007-02-01 and 2007-02-02
subset <- c("1/2/2007", "2/2/2007")
data <- data[data$Date %in% subset,]

#Create plot#
png(filename="plot1.png", width = 480, height = 480)
hist(na.omit(as.numeric(as.character((data$Global_active_power)))), col="red", main="Global Active Power", xlab = "Global Active Power(kilowatts)", ylab="Frequency")
dev.off()

