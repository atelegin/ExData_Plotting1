plot3 <- function() {
        library(sqldf)
        data <- read.csv.sql("household_power_consumption.txt", sep=";", sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
        
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
        
        png(file="plot3.png", width=480, height=480)
        plot(data$Sub_metering_1 ~ data$DateTime, type="l", ylab="Energy sub metering", xlab="")
        lines(data$Sub_metering_2 ~ data$DateTime, col="Red")
        lines(data$Sub_metering_3 ~ data$DateTime, col="Blue")
        
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}