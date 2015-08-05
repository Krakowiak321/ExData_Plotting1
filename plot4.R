# Read in the data
data <- read.table("household_power_consumption.txt", 
                   sep = ";", na.strings = "?", header = TRUE,
                   col.names = c("Date","Time","Global_active_power",
                                 "Global_reactive_power","Voltage",
                                 "Global_intensity","Sub_metering_1",
                                 "Sub_metering_2","Sub_metering_3"), 
                   skip = 66636, nrows = 2880)

# Create plots
par(mfrow = c(2,2))

# First plot
plot(data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power", xaxt="n")
axis(1, at = c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# Second plot
plot(data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# Third plot
plot(data$Sub_metering_1, type = "n", xaxt = "n", xlab = "", 
     ylab = "Energy sub metering")
points(data$Sub_metering_1, type = "l")
points(data$Sub_metering_2, type = "l", col = "red")
points(data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, y.intersp = 0.5, cex = 0.5, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
axis(1, at = c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# Fourth plot
plot(data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", xaxt = "n")
axis(1, at = c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# Copy to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()