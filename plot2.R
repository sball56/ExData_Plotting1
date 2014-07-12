plot2 <- function() {
    # read file
    input <- read.table(file="household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings = c('?') )
    # subset the data for plotting
    plotData <- subset(input, (Date == "1/2/2007") | (Date == "2/2/2007"))
    
    # add date time column
    plotData$theDateTime <- strptime(paste(plotData$Date, plotData$Time), 
                                     format="%d/%m/%Y %H:%M:%S", tz="GMT")
    
    # device on
    png(file = "plot2.png", width = 480, height = 480, units = "px")
    
    # plot2
    plot(plotData$theDateTime, plotData$Global_active_power, type="l",
         xlab="", ylab="Global Active Power (kilowatts)")
    
    
    dev.off() ## Close the PNG file device
    
}