data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 4
windows.options(width=480,height=480)

png(filename="plot4.png",width=480,height=480) ##Using png function instead of dev.copy for legend to show properly

par(mfrow=c(2,2))

plot(x=datetime,y=finaldata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(x=datetime,y=finaldata$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x=datetime,y=as.numeric(finaldata$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="")
lines(datetime, as.numeric(finaldata$Sub_metering_2), type="l",col = "red")
lines(datetime, as.numeric(finaldata$Sub_metering_3), type="l", col = "blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),xjust=1,cex=0.8,bty="n")

plot(x=datetime,y=finaldata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()