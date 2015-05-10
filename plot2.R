plot2 <- function() {
        Sys.setlocale(category = "LC_TIME", locale = "English")
        header <- read.csv('household_power_consumption.txt', nrows = 1, header = FALSE, 
                           sep =';', stringsAsFactors = FALSE)
        data <- read.csv("household_power_consumption.txt", sep=";", skip=66638, 
                         nrows=2879, header=FALSE, colClasses=NA)
        names(data) <- unlist(header)
        
        data$timestamp <- paste(data$Date, data$Time)
        data$timestamp <- strptime(data$timestamp, "%d/%m/%Y %H:%M:%S")
        
        plot(data$timestamp,data$Global_active_power,type="l", xlab="",
             ylab="Global Active Power (kilowatts)")
        
        ##hist(data$Global_active_power,col="red", main = "Global Active Power", 
        ##     xlab="Global Active Power (kilowatts)")
        dev.copy(png,"plot2.png", width = 480, height = 480)
        dev.off()
}
