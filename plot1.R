
#UNDERSTANDING THE DATA
# data<-read.table("household_power_consumption.txt",nrows=100)
# head(data)
# data<-read.table("household_power_consumption.txt",nrows=100, header=TRUE, sep=";")
# classes<-sapply(data,class)
# newdata<-read.table("household_power_consumption.txt",nrows=100, header=TRUE, sep=";",colClasses=classes)


#IMPORTING & TRANSFORMING DATA
newdata<-read.table("household_power_consumption.txt",header=TRUE, sep=";",colClasses=classes,na.strings="?")
newdata2<-newdata[newdata$Date=="1/2/2007",]
newdata3<-newdata[newdata$Date=="2/2/2007",]
finaldata<-rbind(newdata2,newdata3)

finaldata2<-finaldata
finaldata2$dt<-as.POSIXlt(paste(as.POSIXlt(finaldata2$Date,format="%d/%m/%Y"),finaldata2$Time),format="%Y-%m-%d %H:%M:%S")



# GENERATION OF PLOT 1
png(filename="plot1.png",height=480,width=480,units="px")
hist(finaldata2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency", main = "Global Active Power")
dev.off()