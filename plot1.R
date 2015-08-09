

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
hist(edl$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()
