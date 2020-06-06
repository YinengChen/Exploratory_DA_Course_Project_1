library(data.table)
library(tidyverse)
# load data

data = fread(file = "./data/household_power_consumption.txt",
             na.strings = "?")

# class(data[,Time]) # cherater

data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
# Filter
data = data[(Date >="2007-02-01")&(Date <= "2007-02-02")]

# Prevents histogram from printing in scientific notation
data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

png(filename = "plot1.png",)

hist(data[,Global_active_power],col = "red",main = "Global Active Power",
     xlab = "Global Active Power(kilowatt)")
dev.off()
