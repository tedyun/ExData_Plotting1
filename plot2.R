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
png("plot2.png", width=480, height=480)

# plot a line chart
plot(plotdata$Time, plotdata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab= "", type="l")

# close file
dev.off()