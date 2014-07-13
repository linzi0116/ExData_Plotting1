# load data
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# generate datetime variable
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# subsetting data from the dates 2007-02-01 and 2007-02-02
subdf <- df[(df$Date>=as.Date("2007-02-01")) & (df$Date<=as.Date("2007-02-02")), ]

# plot plot4.png
png(filename = "plot4.png")
par(mfrow=c(2,2))
with(subdf, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(subdf, plot(datetime, Voltage, type="l"))
with(subdf, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
lines(x=subdf$datetime, y=subdf$Sub_metering_2, col="red")
lines(x=subdf$datetime, y=subdf$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=19, bty="n")
with(subdf, plot(datetime, Global_reactive_power, type="l"))
dev.off()

