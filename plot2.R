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
plot(data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)", xaxt="n")
axis(1, at = c(1, 1441, 2881), labels=c("Thu", "Fri", "Sat"))

# Copy to png
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()