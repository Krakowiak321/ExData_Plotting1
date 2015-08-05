# Read in the data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", na.strings = "?", header = TRUE,
                   col.names = c("Date","Time","Global_active_power",
                                 "Global_reactive_power","Voltage",
                                 "Global_intensity","Sub_metering_1",
                                 "Sub_metering_2","Sub_metering_3"), 
                   skip = 66636, nrows = 2880)

# Create plot
par(mfrow = c(1,1))
plot(data$Sub_metering_1, type = "n", xaxt = "n", xlab = "", 
     ylab = "Energy sub metering")
points(data$Sub_metering_1, type = "l")
points(data$Sub_metering_2, type = "l", col = "red")
points(data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, y.intersp = 0.5, cex = 0.5,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
axis(1, at = c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# Copy to png
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()