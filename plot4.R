## Download and unzip dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip",exdir = getwd())

## Load dataset and create new column with datetime field
my_household <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
my_household_subset <- subset(my_household, as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02")
my_household_subset$Datetime <- strptime(paste(my_household_subset$Date,my_household_subset$Time),"%d/%m/%Y %H:%M:%S")

##plot4
par(mfrow=c(2,2))
## [1,1]
with(my_household_subset, plot(Datetime, Global_active_power,type = "l", xlab = "", ylab = "Global Active Power"))
## [1,2]
with(my_household_subset, plot(Datetime, Voltage,type = "l", xlab = "datetime", ylab = "Voltage"))
## [2,1]
with(my_household_subset, plot(Datetime, Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering"))
with(my_household_subset, lines(Datetime, Sub_metering_2,col = "red"))
with(my_household_subset, lines(Datetime, Sub_metering_3,col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col =  c("black","red","blue"), lwd = 1, bty="n")
## [2,2]
with(my_household_subset, plot(Datetime, Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.copy(png,file = "plot4.png")
dev.off()