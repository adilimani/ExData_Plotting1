data=read.table("./DataAnalysis/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
newdate=as.Date(data$Date,format="%d/%m/%Y")
moddate=strptime(newdate,format="%Y-%m-%d")
data$Date <- moddate
finaldata=subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
dat <- within(finaldata, datetime <- as.POSIXlt(paste(Date,Time),tz="GMT",format = "%Y-%m-%d %H:%M:%S"))


## Plot 1
windows.options(width=480,height=480)
hist(finaldata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()