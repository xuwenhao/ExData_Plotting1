# Read data, we assume the input file is in the current working directory, and 
#   named as household_power_consumption.txt
data <- read.table('household_power_consumption.txt', sep=";",
                   stringsAsFactors = FALSE, header=TRUE)

# filter to get only data in '01/02/2007' and '02/02/2007'
plotData <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]

plotData$DateTime <- strptime(paste(plotData$Date, plotData$Time), '%d/%m/%Y %H:%M:%S')
plotData$Sub_metering_1 <- as.numeric(plotData$Sub_metering_1)
plotData$Sub_metering_2 <- as.numeric(plotData$Sub_metering_2)
plotData$Sub_metering_3 <- as.numeric(plotData$Sub_metering_3)

# Draw the histogram to a png file
png(file='plot3.png', width = 480, height = 480)
plot(plotData$DateTime, plotData$Sub_metering_1, type='l',
     xlab = '', ylab = 'Energy sub metering')
lines(plotData$DateTime, plotData$Sub_metering_2, col=c('red'))
lines(plotData$DateTime, plotData$Sub_metering_3, col=c('blue'))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
