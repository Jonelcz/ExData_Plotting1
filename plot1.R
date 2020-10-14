## Download and unzip dataset
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip",exdir = getwd())

## Load dataset and create new column with datetime field
my_household <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
my_household_subset <- subset(my_household, as.Date(Date,"%d/%m/%Y")=="2007-02-01" | as.Date(Date,"%d/%m/%Y")=="2007-02-02")
my_household_subset$Datetime <- strptime(paste(my_household_subset$Date,my_household_subset$Time),"%d/%m/%Y %H:%M:%S")

##Plot 1  
hist(my_household_subset$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png")
dev.off()