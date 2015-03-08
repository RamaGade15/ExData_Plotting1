setwd("./ExploratoryDataAnalysis")
library(data.table)
file_name <- "household_power_consumption.txt"

# select the data for Feb 2007, 01 and 02

DT <- data.table(read.csv(file_name, sep=';',na.strings='?'))[((Date == "1/2/2007")|(Date == "2/2/2007")),]

# select columns Date, Time and Global Active Power; Convert Date & Time to POSIXlt format

DT2 <- DT[,list(strptime(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S"), Global_active_power, Global_reactive_power, Voltage, Sub_metering_1, Sub_metering_2, Sub_metering_3)]
par(mfrow = c(2, 2), cex=0.75)
#
# plot#1
#
plot(DT2$V1,DT2$Global_active_power,type = "l", xlab="",ylab="Global Active Power")
#
# plot#2
#
plot(DT2$V1,DT2$Voltage,type = "l", xlab="datetime",ylab="Voltage")
#
# Plot#3 - Energy submetering
#
# Plot submetering & add lines
plot(DT2$V1,DT2$Sub_metering_1,type = "l", xlab="",ylab="Energy sub metering",cex=0.6)
lines(DT2$V1,DT2$Sub_metering_2, col="red")
lines(DT2$V1,DT2$Sub_metering_3, col="blue")
leg.txt <- paste("Sub_metering_", 1:3, sep="")
leg_col <- c("black", "red", "blue")
# legend position needs adjustment for plot#3
my.legend <-legend("topright",leg.txt, col=leg_col, bty='n', lty = 1, cex= 0.6, y.intersp = 0.05,plot = FALSE)
my.legend$rect$left <- ( my.legend$rect$left - 0.2* my.legend$rect$w)
my.legend$rect$top <- ( my.legend$rect$top + 0.4*my.legend$rect$h)
legend(my.legend$rect$left, my.legend$rect$top,legend=leg.txt, col=leg_col, bty='n', lty = 1, cex= 0.6, y.intersp = 0.05)
#
# Plot#4 - Global Reactive Power
#
plot(DT2$V1,DT2$Global_reactive_power,type = "l", xlab="datetime",ylab="Global_Reactive_Power")
# Copy the plot to png file 480 x 480 pixels
gdev <- dev.copy(png, file="plot4.png", width = 480, height = 480)
# close the graphics device
dev.off(gdev)
