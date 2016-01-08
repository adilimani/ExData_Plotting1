data=read.table("./DataAnalysis/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
newdate=as.Date(data$Date,format="%d/%m/%Y")
moddate=strptime(newdate,format="%Y-%m-%d")
data$Date <- moddate
finaldata=subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
dat <- within(finaldata, datetime <- as.POSIXlt(paste(Date,Time),tz="GMT",format = "%Y-%m-%d %H:%M:%S"))

## Plot 2
windows.options(width=480,height=480)
plot(x=dat$datetime,y=dat$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()