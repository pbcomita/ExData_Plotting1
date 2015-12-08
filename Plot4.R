## read in file
powerdata <- read.table(file = "household_power_consumption.txt", header = TRUE, stringsAsFactors = F, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
## limit to the two dates
subpower1 <- subset(powerdata, powerdata$Date =="1/2/2007" | powerdata$Date =="2/2/2007")
## convert dates to Date Class POSIXlt
## combine time and date to the $Date variable
subdattime <- paste(subpower1$Date, subpower1$Time)
subpower1$Date <- strptime(subdattime, "%d/%m/%Y  %H:%M:%S")
##set parameters to plot all four plots
par(mfrow =c(2,2), mar = c(4,4,1,1), oma = c(0,0,0,0))
with(subpower1, {
        plot(Date, Global_active_power, type = "l", lty=1, xlab="", ylab="Global Active Power (kilowatts)")
        plot(Date, Voltage, type = "l", lty=1, xlab="datetime", ylab="Voltage")
        plot(Date, Sub_metering_1, type = "l", lty=1, xlab="", ylab="Energy sub metering")
                lines(Date, Sub_metering_2, type = "l", lty=1, col="red")
                lines(Date, Sub_metering_3, type = "l", lty=1, col="blue")
                legend("topright", lty=1, col=c("black", "red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, text.width = strwidth("Sub_metering_1        "))
        plot(Date, Global_reactive_power, type = "l", lty=1, xpd = TRUE, xlab="datetime", ylab="Global_reactive_power")
})
#dev.copy(png, file = "plot4.png", width = 480, height = 480)
#dev.off(4)
