## for fread
library(data.table)

## loads all the records from the file
allrecs <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

plot3recs <-subset(allrecs,allrecs$Date=="1/2/2007" | allrecs$Date=="2/2/2007")

## set the plotting param to numeric
plot3recs$Global_active_power <- as.numeric(plot3recs$Global_active_power)

plot3recs$DateTime = paste(plot3recs$Date, plot3recs$Time)
plot3recs$DateTime <- strptime(plot3recs$DateTime, "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480, units="px")

# Plot Energy sub metering
plot(plot3recs$DateTime, as.numeric(as.character(plot3recs$Sub_metering_1)), 
     type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(plot3recs$DateTime, 
      as.numeric(as.character(plot3recs$Sub_metering_2)), col="red")
lines(plot3recs$DateTime, 
      as.numeric(as.character(plot3recs$Sub_metering_3)), col="blue")
legend("topright", lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

dev.off()
