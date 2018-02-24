

download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
household_data <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE, quote = "\"")
household_data$Date <- as.Date(household_data$Date, format = "%d/%m/%Y")

date_range <- c("1/2/2007","2/2/2007")
date_range <- as.Date(date_range, format = "%d/%m/%Y")
filtered_data <- household_data[household_data$Date %in% date_range,]
png("Plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red", ylim = c(0,1200))

dev.off()