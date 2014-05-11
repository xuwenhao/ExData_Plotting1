# Read data, we assume the input file is in the current working directory, and 
#   named as household_power_consumption.txt
data <- read.table('household_power_consumption.txt', sep=";",
                   stringsAsFactors = FALSE, header=TRUE)

# filter to get only data in '01/02/2007' and '02/02/2007'
data <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007', ]
# filter out missing data
plotData <- data[data$Global_active_power != '?', ]

# Draw the histogram to a png file
png(file='plot1.png', width = 480, height = 480)
hist(as.numeric(plotData$Global_active_power),
     xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency',
     col = c('red'),
     main = 'Global Active Power')
dev.off()