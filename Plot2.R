# set path to directory with datasets
setwd("./exdata_data_household_power_consumption")

# parsing file with data
file_data <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?")
# view first few rows
head(file_data)

# subseting data by Date 1/2/2007 and 2/2/2007 with filter() from package 'dplyr'
library(dplyr)
df <- filter(file_data, Date=="1/2/2007" | Date=="2/2/2007")
###dim(df)

# plot data 
plot(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
     df$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# export graph into file plot2.png
dev.copy(png,'plot2.png',  width = 480, height = 480)
dev.off()