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
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

# Copy to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
