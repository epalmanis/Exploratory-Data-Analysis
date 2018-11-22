#Read File Household Power Consumption
household_power_consumption <- "./household_power_consumption.txt"
data <- read.table(household_power_consumption, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$Time <- strptime(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

# Plot 2
globalActivePower <- as.numeric(as.character(subSetData$Global_active_power))
subMetering1 <- as.numeric(as.character(subSetData$Sub_metering_1))
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(subSetData$Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(subSetData$Time, subMetering2, type="l", col="red")
lines(subSetData$Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()