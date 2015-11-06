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
     df$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy Sub metering")

# add legend 
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       cex=0.5)

# plot line with SUb_metering_1 data
lines(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
      df$Sub_metering_2,
      col="red")

# plot line with Sub_metering_2 data
lines(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
      df$Sub_metering_3,
      col="blue")

# export graph into file plot3.png
dev.copy(png,'plot3.png',  width = 480, height = 480)
dev.off()