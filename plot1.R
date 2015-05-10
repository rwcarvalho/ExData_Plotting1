plot1 <- function() {
header <- read.csv('household_power_consumption.txt', nrows = 1, header = FALSE, 
                   sep =';', stringsAsFactors = FALSE)
data <- read.csv("household_power_consumption.txt", sep=";", skip=66638, 
                 nrows=2879, header=FALSE, colClasses=NA)
names(data) <- unlist(header)
hist(data$Global_active_power,col="red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
}


