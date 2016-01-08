data=read.table("./DataAnalysis/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
newdate=as.Date(data$Date,format="%d/%m/%Y")
moddate=strptime(newdate,format="%Y-%m-%d")
data$Date <- moddate
finaldata=subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
dat <- within(finaldata, datetime <- as.POSIXlt(paste(Date,Time),tz="GMT",format = "%Y-%m-%d %H:%M:%S"))

## Plot 4
windows.options(width=480,height=480)
par(mfrow=c(2,2))

plot(x=dat$datetime,y=dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(x=dat$datetime,y=dat$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x=dat$datetime,y=dat$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="")
with(subset(dat, Sub_metering_2 > 0.0), lines(datetime, Sub_metering_2, type="l",col = "orange"))
with(subset(dat, Sub_metering_3 > 0.0), lines(datetime, Sub_metering_3, type="l", col = "blue"))
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(x=dat$datetime,y=dat$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()