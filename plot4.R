# Read data, we assume the input file is in the current working directory, and 
#   named as household_power_consumption.txt
data <- read.table('household_power_consumption.txt', sep=";",
                   stringsAsFactors = FALSE, header=TRUE)

# filter to get only data in '01/02/2007' and '02/02/2007'
plotData <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]

# transfer the data to date and numeric class.
plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), '%d/%m/%Y %H:%M:%S')
plotData$Sub_metering_1 <- as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2 <- as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3 <- as.numeric(plotData$Sub_metering_3)
plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
plotData$Global_reactive_power <- as.numeric(plotData$Global_reactive_power)
plotData$Voltage <- as.numeric(plotData$Voltage)

# Draw the plot to a png file
png(file='plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))

# Draw plot 1
plot(plotData$DateTime, plotData$Global_active_power, type='l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')

# Draw plot 2
plot(plotData$DateTime, plotData$Voltage, type='l',
     xlab = 'datetime', ylab = 'Voltage')

# Draw plot 3
plot(plotData$DateTime, plotData$Sub_metering_1, type='l',
     xlab = '', ylab = 'Energy sub metering')
lines(plotData$DateTime, plotData$Sub_metering_2, col=c('red'))
lines(plotData$DateTime, plotData$Sub_metering_3, col=c('blue'))
legend("topright", bty="n", lty=c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Draw plot 4
plot(plotData$DateTime, plotData$Global_reactive_power, type='l',
     xlab = 'datetime', ylab = 'Global_reactive_power')

dev.off()
