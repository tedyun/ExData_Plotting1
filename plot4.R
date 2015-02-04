# load data
plotdata <- read.table("household_power_consumption.txt",
                       colClasses=c("character", "character", "numeric",
                                    "numeric", "numeric", "numeric",
                                    "numeric", "numeric", "numeric"), 
                       header=TRUE, 
                       sep = ";", 
                       na.strings="?")

# convert date
plotdata$Date <- as.Date(plotdata$Date, format="%d/%m/%Y")

# subset data
plotdata <- plotdata[(plotdata$Date == "2007-02-01") | (plotdata$Date == "2007-02-02"),]

# convert time
plotdata$Time <- strptime(paste(plotdata$Date, plotdata$Time), "%Y-%m-%d %H:%M:%OS")

# open a png file
png("plot4.png", width=480, height=480)

# set 2x2 grid
par(mfrow = c(2, 2))

## plot first graph
plot(plotdata$Time, plotdata$Global_active_power, ylab = "Global Active Power", xlab= "", type="l")

## plot second graph
plot(plotdata$Time, plotdata$Voltage, ylab = "Voltage", xlab= "datetime", type="l")

## plot third graph
# plot empty chart
plot(plotdata$Time, plotdata$Sub_metering_1, ylab = "Energy sub metering", xlab= "", type="n")

# add lines
lines(plotdata$Time, plotdata$Sub_metering_1, col="black")
lines(plotdata$Time, plotdata$Sub_metering_2, col="red")
lines(plotdata$Time, plotdata$Sub_metering_3, col="blue")

# add legend
legend("topright", bty="n", lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot fourth graph
plot(plotdata$Time, plotdata$Global_reactive_power, ylab = "Global_reactive_power", xlab= "datetime", type="l")

# close file
dev.off()