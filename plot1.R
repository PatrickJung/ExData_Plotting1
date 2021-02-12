# Getting data
hpc <- read.table("data/household_power_consumption.txt", sep = ";", header=TRUE)
hpc_data <- subset(hpc, strptime(Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y") & strptime(Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y"))
hpc_data[,c(3:9)] <- sapply(hpc_data[,c(3:9)], as.numeric)
hpc_data$Date_Time <- strptime(paste(hpc_data$Date, hpc_data$Time), "%d/%m/%Y %H:%M:%S")


# Plot 1
png(filename="plot1.png")
hist(hpc_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
