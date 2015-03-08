setwd("./ExploratoryDataAnalysis")
library(data.table)
file_name <- "household_power_consumption.txt"

# select the data for Feb 2007, 01 and 02

DT <- data.table(read.csv(file_name, sep=';',na.strings='?'))[((Date == "1/2/2007")|(Date == "2/2/2007")),list(Date, Time, Global_active_power)]

# select columns Date, Time and Global Active Power; Convert Date & Time to POSIXlt format

DT2 <- DT[,list(strptime(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S"),Global_active_power)]

# Plot Tiem vs Global Active Power
plot(DT2$V1,DT2$Global_active_power,type = "l", xlab="",ylab="Global Active Power (kilowatts)")

# Copy the plot to png file 480 x 480 pixels
gdev <- dev.copy(png, file="plot2.png", width = 480, height = 480)
# close the graphics device
dev.off(gdev)
