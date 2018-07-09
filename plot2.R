# Read data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 2007-02-01 - 2007-02-02
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Combine date and time columns
date <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Select only Global active power column, make it numeric
globalactivepower <- as.numeric(subsetdata$Global_active_power)

# Make png file plot2
png("plot2.png", width=480, height=480)
plot(date, globalactivepower, type="n", ylab="Global Active Power (kilowatts)", xlab=NA)
lines(date, globalactivepower, type="l")
dev.off()
