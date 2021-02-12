# Getting data
hpc <- read.table("data/household_power_consumption.txt", sep = ";", header=TRUE)
hpc_data <- subset(hpc, strptime(Date, "%d/%m/%Y") >= strptime("01/02/2007", "%d/%m/%Y") & strptime(Date, "%d/%m/%Y") <= strptime("02/02/2007", "%d/%m/%Y"))
hpc_data[,c(3:9)] <- sapply(hpc_data[,c(3:9)], as.numeric)
hpc_data$Date_Time <- strptime(paste(hpc_data$Date, hpc_data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 2
png(filename="plot2.png")
with(hpc_data, plot(Date_Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
