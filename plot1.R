## for fread
library(data.table)

## loads all the records from the file
allrecs <- read.table("household_power_consumption.txt", sep=";", header = TRUE)

plot1recs <-subset(allrecs,allrecs$Date=="1/2/2007" | allrecs$Date=="2/2/2007")

## set the plotting param to numeric
plot1recs$Global_active_power <- as.numeric(plot1recs$Global_active_power)

png("plot1.png", width=480, height=480, units="px")

hist(plot1recs$Global_active_power, col = "red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
