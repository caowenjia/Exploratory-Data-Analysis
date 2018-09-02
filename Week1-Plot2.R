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
with(power_cons1, plot(Global_active_power1~Date1,type="l",ylab = "Global Active Power (killowatts)",xlab=" "))


#power_cons2<-transform(power_cons1,Date1=as.Date(Date1,format = "%d/%m/%Y %H:%M:%S"))
#power_cons2<-transform(power_cons1,Date=as.Date(Date,format = "%d/%m/%Y"),Time=as.Date(Time,format="%H:%M:%S"))
#as.POSIXct(paste(power_cons2$date, power_cons2$time), format="%d/%m/%Y %H:%M:%S")

