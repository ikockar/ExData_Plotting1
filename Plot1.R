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

# plot data ( histogram)
hist(df$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

# export histogram into file plot1.png
dev.copy(png,'plot1.png',  width = 480, height = 480)
dev.off()