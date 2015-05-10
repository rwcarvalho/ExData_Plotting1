plot3 <- function() {
        Sys.setlocale(category = "LC_TIME", locale = "English")
        header <- read.csv('household_power_consumption.txt', nrows = 1, header = FALSE, 
                           sep =';', stringsAsFactors = FALSE)
        data <- read.csv("household_power_consumption.txt", sep=";", skip=66638, 
                         nrows=2879, header=FALSE, colClasses=NA)
        names(data) <- unlist(header)
        
        data$timestamp <- paste(data$Date, data$Time)
        data$timestamp <- strptime(data$timestamp, "%d/%m/%Y %H:%M:%S")
        
        plot(data$timestamp,data$Sub_metering_1,type="l", xlab="",
             ylab="Energy sub meeting")
        
        lines(data$timestamp,data$Sub_metering_2,type="l", col="red")

        lines(data$timestamp,data$Sub_metering_3,type="l", col="blue")
        
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,
              col=c("black", "red", "blue"))
        
        ##hist(data$Global_active_power,col="red", main = "Global Active Power", 
        ##     xlab="Global Active Power (kilowatts)")
        dev.copy(png,"plot3.png", width = 480, height = 480)
        dev.off()
}
