library(data.table)

## Entire data set
alldata <- fread("household_power_consumption.txt", na.strings ="?")

## Data of interest: 2007-02-01 to 2007-02-01
dataA <- subset(alldata, alldata$Date == "1/2/2007")
dataB <- subset(alldata, alldata$Date == "2/2/2007")
l = list(dataA, dataB)
data <- rbindlist(l, use.names=TRUE)

hist(as.numeric(data$Global_active_power), col = 34, xlab ="Global Active Power (kilowatts)" , main = "Global Active Power")
dev.copy(png, "plot1.png")
dev.off()

