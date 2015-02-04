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

# plot a histogram to the screen
hist(plotdata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab= "Frequency", main="Global Active Power", col="red")

# copy plot to a file
dev.copy(png, file = "plot1.png")

# close the file
dev.off()