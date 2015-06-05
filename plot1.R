plot1 <- function() {
        library(sqldf)
        download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="file.zip", method = "curl")
        data <- read.csv.sql(unzip("file.zip"), sep=";", sql="select * from file where Date in ('1/2/2007', '2/2/2007')")
        
        png(file="plot1.png", width=480, height=480)
        hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
        dev.off()
}