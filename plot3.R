setwd("./ExploratoryDataAnalysis")
library(data.table)
file_name <- "household_power_consumption.txt"

# select the data for Feb 2007, 01 and 02
DT <- data.table(read.csv(file_name, sep=';',na.strings='?'))[((Date == "1/2/2007")|(Date == "2/2/2007")),list(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)]

# select columns Date, Time and Global Active Power; Convert Date & Time to POSIXlt format
DT2 <- DT[,list(strptime(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S"), Sub_metering_1, Sub_metering_2, Sub_metering_3)]
par(mfrow = c(1, 1), cex=0.75)
# Plot Date/Time vs Sub metering
plot(DT2$V1,DT2$Sub_metering_1,type = "l", xlab="",ylab="Energy sub metering",cex=0.6)
#Add lines for sub metering #2 &3 
lines(DT2$V1,DT2$Sub_metering_2, col="red")
lines(DT2$V1,DT2$Sub_metering_3, col="blue")
#define legend text
leg.txt <- paste("Sub_metering_", 1:3, sep="")
#define legend colors
leg_col <- c("black", "red", "blue")
my.legend <-legend("topright",leg.txt,lty = 1, col=leg_col, cex= 0.8, y.intersp = 0.4,plot = FALSE)
my.legend$rect$left <- ( my.legend$rect$left - 0.2*my.legend$rect$w)
legend(my.legend$rect$left, my.legend$rect$top, legend=leg.txt , bty='n', lty = 1, col=leg_col, cex= 0.8, y.intersp = 0.4)
#
# Copy the plot to png file 480 x 480 pixels
gdev <- dev.copy(png, file="plot3.png", width = 480, height = 480)
# close the graphics device
dev.off(gdev)