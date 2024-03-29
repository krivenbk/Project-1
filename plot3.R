Data <- read.csv("household_power_consumption.txt", sep=';', na.strings="?")
sub <- subset(Data, as.Date(Data$Date, "%d/%m/%Y")>="2007-02-01")
sub2 <- subset(sub, as.Date(sub$Date, "%d/%m/%Y")<= "2007-02-02")
paste_date_time <- paste(as.Date(sub2$Date, "%d/%m/%Y"), sub2$Time)
convert_date_time <- strptime(paste_date_time, "%Y-%m-%d %H:%M:%S")
png(file="plot3.png")
plot(convert_date_time,sub2$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(convert_date_time,sub2$Sub_metering_2, col="red")
lines(convert_date_time,sub2$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()