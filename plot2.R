library(data.table)

## Entire data set
alldata <- fread("household_power_consumption.txt", na.strings ="?")

## Data of interest: 2007-02-01 to 2007-02-01
dataA <- subset(alldata, alldata$Date == "1/2/2007")
dataB <- subset(alldata, alldata$Date == "2/2/2007")
l = list(dataA, dataB)
data <- rbindlist(l, use.names=TRUE)

plot(as.numeric(data$Global_active_power), type ="l", ylab = "Global Active Power (kilowatts)", xlab ="", xaxt="n"  )
xtickval <- c("Thu","Fri","Sat")
axis(1, at =c(0,1440,2880), xtickval)
box()
dev.copy(png, "plot2.png")
dev.off()

