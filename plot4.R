plot4 <- function() {
        library(sqldf)
        download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="file.zip", method = "curl")
        data <- read.csv.sql(unzip("file.zip"), sep=";", sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
        
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data$datetime <- as.POSIXct(paste(data$Date, data$Time))
        
        png(file="plot4.png", width=480, height=480)
        par(mfcol=c(2,2))
        with(data, {
                plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
                plot(Sub_metering_1 ~ datetime, type="l", xlab="", ylab="Global Active Power")
                        lines(Sub_metering_2 ~ datetime, col="red")
                        lines(Sub_metering_3 ~ datetime, col="blue")
                        legend("topright", col=c("black", "red", "blue"), box.lty=0, lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(datetime, Voltage, type="l")
                plot(datetime, Global_reactive_power, type="l")
        }) 
        dev.off()
}