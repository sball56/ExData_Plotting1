plot3 <- function() {
    # read file
    input <- read.table(file="household_power_consumption.txt", 
                        header=TRUE, sep=";", na.strings = c('?') )
    # subset the data for plotting
    plotData <- subset(input, (Date == "1/2/2007") | (Date == "2/2/2007"))
    
    # add date time column
    plotData$theDateTime <- strptime(paste(plotData$Date, plotData$Time), 
                                     format="%d/%m/%Y %H:%M:%S", tz="GMT")
    
    # device on
    png(file = "plot3.png", width = 480, height = 480, units = "px")
    
    # plot3 
    plot(tmpData$theDateTime, tmpData$Sub_metering_1, type="n", 
         xlab="", ylab="Energy sub metering")
    lines(x=tmpData$theDateTime, tmpData$Sub_metering_1, type="l", col="black")
    lines(x=tmpData$theDateTime, tmpData$Sub_metering_2, type="l", col="red")
    lines(x=tmpData$theDateTime, tmpData$Sub_metering_3, type="l", col="blue")
    
    legend( x="topright", 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col=c("black","red","blue"), lwd=1,  
             merge=FALSE )
    
    dev.off() ## Close the PNG file device
    
}