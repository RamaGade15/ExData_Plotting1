setwd("./ExploratoryDataAnalysis")
library(data.table)
file_name <- "household_power_consumption.txt"
# convert cols 1 & 2 from character to Date and Time
# select the data for Feb 2007, 01 and 02
# select columns Date and Global Active Power
DT <- data.table(read.csv(file_name, sep=';',na.strings='?'))[((Date == "1/2/2007")|(Date == "2/2/2007")),list(Date, Global_active_power)]
# Plot histogram 
with(DT,hist(Global_active_power),main = "Global Active Power", xlab="Global Active Power (kilowatts)",col="red"))
# Copy the plot to png file 480 x 480 pixels
gdev <- dev.copy(png, file="plot1.png", width = 480, height = 480)
# close the graphics device
dev.off(gdev)