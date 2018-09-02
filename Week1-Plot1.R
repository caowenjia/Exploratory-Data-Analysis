#load data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"household_power_consumption.txt",method="curl")
power_cons<-read.table("/Users/kimberly/Downloads/household_power_consumption.txt",sep=";",header=TRUE)
summary(power_cons)

#Only keep the desired data
selected<-c("2/2/2007","1/2/2007")
power_cons1<-power_cons[power_cons$Date %in% selected,]
power_cons2<-transform(power_cons1,Global_active_power=as.numeric(levels(power_cons1$Global_active_power)))

#hist(power_cons2$Global_active_power[power_cons2$Global_active_power<=6],breaks=seq(0,6,by=0.5),xlim=c(0,6),xlab="Global Active Power (killowatts)",col="red",main="Global Active Power")
Global_active_power<-as.numeric(levels(power_cons1$Global_active_power))[power_cons1$Global_active_power]
hist(Global_active_power[Global_active_power<=6],breaks=seq(0,6,by=0.5),xlim=c(0,6),xlab="Global Active Power (killowatts)",col="red",main="Global Active Power")
png(filename="Plot1.png",width = 480,height = 480)
dev.off()

