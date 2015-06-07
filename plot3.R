# Exploratory Data Analysis MOOC by JHU @ coursera
# Peer-assesed Project No. 1
# Plot-generating code 3 of 4
# BM (ufyjolk) -- June 6th 2015

#Setting locale
Sys.setlocale("LC_ALL", "C")

#Reading the file
powerCons <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("NA", "?"))
DateTime <- paste(powerCons$Date, powerCons$Time)
DateTime <- strptime(DateTime, format="%d/%m/%Y %H:%M:%S", tz = "")
powerCons <- cbind(DateTime, powerCons)

#Selecting appropriate rows and moving them to a new data frame.
d <- "2007-02-01 00:00:00"
e <- "2007-02-02 23:59:59"
d <- as.POSIXct(d)
e <- as.POSIXct(e)
subPower <- powerCons[powerCons$DateTime %in% (d:e),]

#Plotting
png(filename="plot3.png", width = 480, height = 480, units = "px")
plot(subPower$DateTime, subPower$Sub_metering_1, type = "l", lty="solid", col="black", ylab="Energy sub metering", xlab="")
with(subPower, lines(DateTime, Sub_metering_2, lty="solid", col = "red"))
with(subPower, lines(DateTime, Sub_metering_3, lty="solid", col = "blue"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()