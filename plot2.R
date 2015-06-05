plot2 <- function() {
        library(sqldf)
        download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="file.zip", method = "curl")
        data <- read.csv.sql(unzip("file.zip"), sep=";", sql="select * from file where Date in ('1/2/2007', '2/2/2007')")

        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        data$datetime <- as.POSIXct(paste(data$Date, data$Time))
        
        png(file = "plot2.png", width=480, height=480)
        plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()
}