## read in file
powerdata <- read.table(file = "household_power_consumption.txt", header = TRUE, stringsAsFactors = F, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
## limit to the two dates
subpower1 <- subset(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date =="2/2/2007")
## convert dates to Date Class POSIXlt
## combine time and date to the $Date variable
subdattime <- paste(subpower1$Date, subpower1$Time)
subpower1$Date <- strptime(subdattime, "%d/%m/%Y  %H:%M:%S")
## plot histogram of Global Active Power for Plot 1
hist(subpower1$Global_active_power, breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
##dev.copy(png, file = "plot1.png")
##dev.off