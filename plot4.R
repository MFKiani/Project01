library(data.table)

## Entire data set
alldata <- fread("household_power_consumption.txt", na.strings ="?")

## Data of interest: 2007-02-01 to 2007-02-01
dataA <- subset(alldata, alldata$Date == "1/2/2007")
dataB <- subset(alldata, alldata$Date == "2/2/2007")
l = list(dataA, dataB)
data <- rbindlist(l, use.names=TRUE)


par(mfrow=c(2,2))
## Plot no. 01
plot(as.numeric(data$Global_active_power), type ="l", ylab = "Global Active Power (kilowatts)", xlab ="", xaxt="n"  )
xtickval <- c("Thu","Fri","Sat")
axis(1, at =c(0,1440,2880), xtickval)
box()


## Plot no. 02
plot(as.numeric(data$Voltage), type ="l", ylab = "Voltage", xlab ="datetime", xaxt="n"  )
xtickval <- c("Thu","Fri","Sat")
axis(1, at =c(0,1440,2880), xtickval)
box()


## Plot no. 03

plot(as.numeric(data$Sub_metering_1), type ="l", ylim = c(0,38), axes= FALSE, ylab = "Energy sub metering", xlab ="", xaxt="n" )
par(new =T)
plot(as.numeric(data$Sub_metering_2), type ="l", ylim = c(0,38), axes= FALSE, ylab = "", xlab ="", col = "red", xaxt="n")
par(new =T)
plot(as.numeric(data$Sub_metering_3), type ="l", ylim = c(0,38), axes= FALSE, ylab = "", xlab ="", col = "blue", xaxt="n" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 0.1, lty = c(1,1,1),bty="n",col = c("black", "red", "blue"),cex=.7)
par(new=F)
xtickval <- c("Thu","Fri","Sat")
axis(2)
axis(1, at =c(0,1440,2880), xtickval)
box()

## Plot no. 04
plot(as.numeric(data$Global_reactive_power), type ="l", ylab = "Global_reactive_power", xlab ="datetime", xaxt="n"  )
xtickval <- c("Thu","Fri","Sat")
axis(1, at =c(0,1440,2880), xtickval)
box()



dev.copy(png,"plot4.png")
dev.off()

