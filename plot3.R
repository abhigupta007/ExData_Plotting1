
#IMPORTING & TRANSFORMING DATA
newdata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",colClasses=classes,na.strings="?")
newdata2<-newdata[newdata$Date=="1/2/2007",]
newdata3<-newdata[newdata$Date=="2/2/2007",]
finaldata<-rbind(newdata2,newdata3)

finaldata2<-finaldata
finaldata2$dt<-as.POSIXlt(paste(as.POSIXlt(finaldata2$Date,format="%d/%m/%Y"),finaldata2$Time),format="%Y-%m-%d %H:%M:%S")

# GENERATION OF PLOT 3

png(filename="plot3.png",height=480,width=480,units="px")
plot(finaldata2$dt,finaldata2$Sub_metering_1,"l",xlab="",ylab="Energy sub metering")
lines(finaldata2$dt,finaldata2$Sub_metering_2,col="red")
lines(finaldata2$dt,finaldata2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
axis(side=2,lwd=2)
dev.off()