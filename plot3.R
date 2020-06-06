library(data.table)
data <- data.table::fread(input = "./data/household_power_consumption.txt"
                          , na.strings="?")
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

plot(x = data[, dateTime], y = data[, Sub_metering_1]
     , type="n",xlab="", ylab="Energy sub metering")

lines(x = data[, dateTime], y = data[, Sub_metering_1], type="l")
lines(x = data[, dateTime], y = data[, Sub_metering_2], type="l",col = "red")
lines(x = data[, dateTime], y = data[, Sub_metering_3], type="l",col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1),bty="o",cex=.5)


dev.off()