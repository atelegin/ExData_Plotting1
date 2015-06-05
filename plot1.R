plot1 <- function() {
        library(sqldf)
        data <- read.csv.sql("household_power_consumption.txt", sep=";", sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
        
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
        
        png(file="plot1.png", width=480, height=480)
        hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
        dev.off()
}