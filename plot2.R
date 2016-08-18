## for fread
library(data.table)

## loads all the records from the file
allrecs <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

plot2recs <-subset(allrecs,allrecs$Date=="1/2/2007" | allrecs$Date=="2/2/2007")

## set the plotting param to numeric
plot2recs$Global_active_power <- as.numeric(plot2recs$Global_active_power)

plot2recs$DateTime = paste(plot2recs$Date, plot2recs$Time)
plot2recs$DateTime <- strptime(plot2recs$DateTime, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480, units="px")

plot(plot2recs$DateTime, plot2recs$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
