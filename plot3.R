library(data.table)

## Entire data set
alldata <- fread("household_power_consumption.txt", na.strings ="?")

## Data of interest: 2007-02-01 to 2007-02-01
dataA <- subset(alldata, alldata$Date == "1/2/2007")
dataB <- subset(alldata, alldata$Date == "2/2/2007")
l = list(dataA, dataB)
data <- rbindlist(l, use.names=TRUE)

plot(as.numeric(data$Sub_metering_1), type ="l", ylim = c(0,38), axes= FALSE, ylab = "Energy sub metering", xlab ="", xaxt="n" )
par(new =T)
plot(as.numeric(data$Sub_metering_2), type ="l", ylim = c(0,38), axes= FALSE, ylab = "", xlab ="", col = "red", xaxt="n")
par(new =T)
plot(as.numeric(data$Sub_metering_3), type ="l", ylim = c(0,38), axes= FALSE, ylab = "", xlab ="", col = "blue", xaxt="n" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),col = c("black", "red", "blue"), pt.cex=1.2,cex=0.5)
par(new=F)
xtickval <- c("Thu","Fri","Sat")
axis(2)
axis(1, at =c(0,1440,2880), xtickval)
box()
dev.copy(png,"plot3.png")
dev.off()

