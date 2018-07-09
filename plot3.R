# Read data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 2007-02-01 - 2007-02-02
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Combine date and time columns
date <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Select only Global active power column, make it numeric
submeter1 <- as.numeric(subsetdata$Sub_metering_1)
submeter2 <- as.numeric(subsetdata$Sub_metering_2)
submeter3 <- as.numeric(subsetdata$Sub_metering_3)

# Make png file plot3
png("plot3.png", width=480, height=480)
plot(date, submeter1, type="n", ylab="Energy sub metering", xlab=NA)
lines(date, submeter1, type="l", col="black")
lines(date, submeter2, type="l", col="red")
lines(date, submeter3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
