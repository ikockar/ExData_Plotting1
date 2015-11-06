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

# split window (4 area)
par(mfcol=c(2,2))

# plot graph into 1st area (1st col, 1st row)
plot(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
     df$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

##########################################################################

# plot graph into 2nd area (1st col, 2nd row)
plot(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
     df$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy Sub metering")

# plot line with SUb_metering_1 data
lines(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
      df$Sub_metering_2,
      col="red")

# plot line with Sub_metering_2 data
lines(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
      df$Sub_metering_3,
      col="blue")

# add legend 
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lwd=c(1,1,1),cex=0.5,bty="n",y.intersp=0.5)

##########################################################################

# plot graph into 2nd area (2nd col, 1nd row)
plot(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
     df$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# plot graph into 2nd area (2nd col, 2nd row)
plot(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"),
     df$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

##########################################################################

# export graph into file plot4.png
dev.copy(png,'plot4.png',  width = 480, height = 480)
dev.off()