plot4 <- function() {
        Sys.setlocale(category = "LC_TIME", locale = "English")
        
        header <- read.csv('household_power_consumption.txt', nrows = 1, header = FALSE, 
                           sep =';', stringsAsFactors = FALSE)
        data <- read.csv("household_power_consumption.txt", sep=";", skip=66638, 
                         nrows=2879, header=FALSE, colClasses=NA)
        names(data) <- unlist(header)
        
        data$timestamp <- paste(data$Date, data$Time)
        data$timestamp <- strptime(data$timestamp, "%d/%m/%Y %H:%M:%S")
        
        par(mfrow = c(2, 2))
       ## par(ps = 12, cex = 1, cex.main = 1)
        plot(data$timestamp,data$Global_active_power,type="l", xlab="",
             ylab="Global Active Power (kilowatts)")
        
        plot(data$timestamp,data$Voltage,type="l", xlab="datetime",
             ylab="Voltage")
        
        
        plot(data$timestamp,data$Sub_metering_1,type="l", xlab="",
             ylab="Energy sub meeting")
        
        lines(data$timestamp,data$Sub_metering_2,type="l", col="red")

        lines(data$timestamp,data$Sub_metering_3,type="l", col="blue")
        
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n", lwd=2,
              col=c("black", "red", "blue"), y.intersp=.5, xjust = 1,  cex=.5)

        plot(data$timestamp,data$Global_reactive_power,type="l", xlab="datetime",
             ylab="Global_reactive_power")
        
        ##hist(data$Global_active_power,col="red", main = "Global Active Power", 
        ##     xlab="Global Active Power (kilowatts)")
        dev.copy(png,"plot4.png", width = 480, height = 480)
        dev.off()
}
