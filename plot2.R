# load data
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# generate datetime variable
df$datetime <- paste(df$Date, df$Time)
df$datetime <- strptime(df$datetime, "%d/%m/%Y %H:%M:%S")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
# subsetting data from the dates 2007-02-01 and 2007-02-02
subdf <- df[(df$Date>=as.Date("2007-02-01")) & (df$Date<=as.Date("2007-02-02")), ]

# plot plot2.png
png(filename = "plot2.png")
plot(subdf$datetime, subdf$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
