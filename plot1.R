
# Read data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 2007-02-01 - 2007-02-02
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Select only Global active power column, make it numeric
globalactivepower <- as.numeric(subsetdata$Global_active_power)

# Make png file plot1
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()