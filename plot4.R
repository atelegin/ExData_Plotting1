plot4 <- function() {
        library(sqldf)
        data <- read.csv.sql("household_power_consumption.txt", sep=";", sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
        
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
        
        png(file="plot4.png", width=480, height=480)
        par(mfcol=c(2,2))
        plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(data$Sub_metering_1 ~ data$DateTime, type="l", xlab="", ylab="Global Active Power")
                lines(data$Sub_metering_2 ~ data$DateTime, col="red")
                lines(data$Sub_metering_3 ~ data$DateTime, col="blue")
        plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        dev.off()
        
}