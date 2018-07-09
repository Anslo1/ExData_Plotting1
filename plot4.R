# Read data
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset only 2007-02-01 - 2007-02-02
subsetdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Combine date and time columns
date <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Prepare data for graph topleft
globalactivepower <- as.numeric(subsetdata$Global_active_power)

# Prepare data for graph bottomleft
submeter1 <- as.numeric(subsetdata$Sub_metering_1)
submeter2 <- as.numeric(subsetdata$Sub_metering_2)
submeter3 <- as.numeric(subsetdata$Sub_metering_3)

# Prepare data for graph topright
voltage <- as.numeric(subsetdata$Voltage)

# Prepare data for graph bottomright
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)

# Make png file plot4
png("plot4.png", width=480, height=480)

# Make 2x2 graph panels
par(mfcol=c(2,2))

# Make graph topleft
plot(date, globalactivepower, type="n", ylab="Global Active Power", xlab=NA)
lines(date, globalactivepower, type="l")

# Make graph bottomleft
plot(date, submeter1, type="n", ylab="Energy sub metering", xlab=NA)
lines(date, submeter1, type="l", col="black")
lines(date, submeter2, type="l", col="red")
lines(date, submeter3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

# Make graph topright
plot(date, voltage, type="n", ylab="Voltage", xlab="datetime")
lines(date, voltage, type="l")

# Make graph bottomright
plot(date, globalreactivepower, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(date, globalreactivepower, type="l")
dev.off()