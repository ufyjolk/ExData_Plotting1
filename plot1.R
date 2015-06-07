# Exploratory Data Analysis MOOC by JHU @ coursera
# Peer-assesed Project No. 1
# Plot-generating code 1 of 4
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
png(filename="plot1.png", width = 480, height = 480, units = "px")
with(subPower, hist(Global_active_power, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()