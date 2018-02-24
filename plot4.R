download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
household_data <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE, quote = "\"")
household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

date_range <- c("1/2/2007","2/2/2007")
date_range <- as.Date(date_range, format = "%d/%m/%Y")
filtered_data <- household_data[household_data$Date %in% date_range,]

png("Plot4.png", width = 480, height = 480)

par(mfrow= c(2,2))
#plot1
date_range <- c("1/2/2007","2/2/2007")
date_range <- as.Date(date_range, format = "%d/%m/%Y")
xy <- data.frame(datetime = as.POSIXct(paste(filtered_data$Date, filtered_data$Time, sep = " ")), global_active_power = filtered_data$Global_active_power)
plot(xy, type = 'l', xlab="", ylab = "Global Active Power")

#plot2
date_range <- c("1/2/2007","2/2/2007")
date_range <- as.Date(date_range, format = "%d/%m/%Y")
xy <- data.frame(datetime = as.POSIXct(paste(filtered_data$Date, filtered_data$Time, sep = " ")), voltage = filtered_data$Voltage)
plot(xy, type = 'l', xlab="datetime", ylab = "Voltage")

#plot3
xy <- data.frame(datetime = as.POSIXct(paste(filtered_data$Date, filtered_data$Time, sep = " ")),
                 Sub_metering_1=filtered_data$Sub_metering_1, Sub_metering_2=filtered_data$Sub_metering_2, Sub_metering_3=filtered_data$Sub_metering_3)
plot(data.frame(datetime = xy$datetime, sub1 = xy$Sub_metering_1), type = 'l', xlab="", ylab = "Energy sub metering")
lines(data.frame(datetime = xy$datetime, sub1 = xy$Sub_metering_2), type='l', col='red')
lines(data.frame(datetime = xy$datetime, sub1 = xy$Sub_metering_3), type='l', col='blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lty = c(1,1,1), cex = 0.5)

#plot4
date_range <- c("1/2/2007","2/2/2007")
date_range <- as.Date(date_range, format = "%d/%m/%Y")
xy <- data.frame(datetime = as.POSIXct(paste(filtered_data$Date, filtered_data$Time, sep = " ")), global_reactive_power = filtered_data$Global_reactive_power)
plot(xy, type = 'l')

dev.off()