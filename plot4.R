# Getting data
hpc <- read.table("data/household_power_consumption.txt", sep = ";", header=TRUE)
hpc_data <- subset(hpc, strptime(Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y") & strptime(Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y"))
hpc_data[,c(3:9)] <- sapply(hpc_data[,c(3:9)], as.numeric)
hpc_data$Date_Time <- strptime(paste(hpc_data$Date, hpc_data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 4
png(filename="plot4.png")
par(mfrow = c(2,2))

with(hpc_data, plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

with(hpc_data, plot(Date_Time, Voltage, type="l"))

with(hpc_data, plot(Date_Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc_data, lines(Date_Time, Sub_metering_2, col="red"))
with(hpc_data, lines(Date_Time, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75)

with(hpc_data, plot(Date_Time, Global_reactive_power, type="l", xlab="datetime"))
dev.off()