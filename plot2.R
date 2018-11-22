#Read File Household Power Consumption
household_power_consumption <- "./household_power_consumption.txt"
data <- read.table(household_power_consumption, header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subSetData$Time <- strptime(paste(subSetData$Date, subSetData$Time), format="%d/%m/%Y %H:%M:%S")
subSetData$Date <- as.Date(subSetData$Date, format="%d/%m/%Y")

# Plot 2
globalActivePower <- as.numeric(as.character(subSetData$Global_active_power))
png("plot2.png", width=480, height=480)
plot(subSetData$Time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()