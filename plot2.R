data=read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Plot 2
par(mfrow=c(1,1))
windows.options(width=480,height=480)
plot(x=datetime,y=finaldata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()