

#load data
ed = read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

# trasnform two column in one and convert it to date
ed <- within(ed, Datetime <- paste(Date,Time))
ed <- within(ed, Datetime <- strptime(Datetime, "%d/%m/%Y %H:%M:%S"))

#keeping only a particular date range
edl <- ed[ed$Datetime>= "2007-02-01 00:00:00" & ed$Datetime<= "2007-02-02 23:59:59", ]

#looking a bit into the data
summary(edl$Sub_metering_1)
summary(edl$Sub_metering_2)
summary(edl$Sub_metering_3)


# building the first histogram
par( mfrow=c(1,1))
plot(edl$Datetime, edl$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(edl$Datetime, edl$Sub_metering_2, type="l", col="red")
lines(edl$Datetime, edl$Sub_metering_3, type="l", col="blue")
legend("topright", pch = NA,  lty = c(1, 1, 1), lwd=2, col = c("black", "red","blue" ), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()

