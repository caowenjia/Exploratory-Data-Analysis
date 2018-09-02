#load data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"household_power_consumption.txt",method="curl")
power_cons<-read.table("/Users/kimberly/Downloads/household_power_consumption.txt",sep=";",header=TRUE)
summary(power_cons)

#Only keep the desired data
selected<-c("2/2/2007","1/2/2007")
power_cons1<-power_cons[power_cons$Date %in% selected,]

#Integrate and format date and time, change facor to numeric 
#power_cons1$Date1<-paste(power_cons1$Date, power_cons1$Time, sep=" ")
power_cons1$Date1<-as.POSIXct(paste(power_cons1$Date, power_cons1$Time), format="%d/%m/%Y %H:%M:%S")
power_cons1$Global_active_power1<-as.numeric(levels(power_cons1$Global_active_power))[power_cons1$Global_active_power]
power_cons1$Sub_metering_1<-as.numeric(levels(power_cons1$Sub_metering_1))[power_cons1$Sub_metering_1]
power_cons1$Sub_metering_2<-as.numeric(levels(power_cons1$Sub_metering_2))[power_cons1$Sub_metering_2]

#Plot desired plot
with(power_cons1,plot(Date1,Sub_metering_1,col='black',type='l',xlab = "",ylab="Energy Sub metering"))
lines(power_cons1$Date1,power_cons1$Sub_metering_2,col='red')
lines(power_cons1$Date1,power_cons1$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

