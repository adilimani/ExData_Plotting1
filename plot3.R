data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


## Plot 3
par(mfrow=c(1,1))
windows.options(width=480,height=480)

png(filename="plot3.png",width=480,height=480) ##Using png function instead of dev.copy for legend to show properly

par(mfrow=c(1,1))
plot(x=datetime,y=as.numeric(finaldata$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(datetime, as.numeric(finaldata$Sub_metering_2), type="l",col = "red")
lines(datetime, as.numeric(finaldata$Sub_metering_3), type="l", col = "blue")

legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xjust=0,cex=0.8)

dev.off()