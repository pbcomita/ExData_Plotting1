## read in file
powerdata <- read.table(file = "household_power_consumption.txt", header = TRUE, stringsAsFactors = F, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
## limit to the two dates
subpower1 <- subset(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date =="2/2/2007")
## convert dates to Date Class POSIXlt
## combine time and date to the $Date variable
subdattime <- paste(subpower1$Date, subpower1$Time)
subpower1$Date <- strptime(subdattime, "%d/%m/%Y  %H:%M:%S")
## plot lineplot of Global Active Power for Plot 2
plot(subpower1$Date, subpower1$Global_active_power, type = "l", lty=1, xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off(4)
