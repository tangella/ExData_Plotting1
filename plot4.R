## for fread
library(data.table)

## loads all the records from the file
allrecs <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

plot4recs <-subset(allrecs,allrecs$Date=="1/2/2007" | allrecs$Date=="2/2/2007")

## set the plotting param to numeric
plot4recs$Global_active_power <- as.numeric(plot4recs$Global_active_power)

plot4recs$DateTime = paste(plot4recs$Date, plot4recs$Time)
plot4recs$DateTime <- strptime(plot4recs$DateTime, "%d/%m/%Y %H:%M:%S")

attach(plot4recs)

png("plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

plot(DateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power")

plot(DateTime, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")

plot(DateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(DateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(DateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(DateTime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

