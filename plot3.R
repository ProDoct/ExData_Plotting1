#reading data from csv txt file with read.csv , sep=";", store data as eps
ep<-read.csv("household_power_consumption.txt",sep=";",na.string="?")
#make a new variable that combine date and time variable and store it in ep as Date type
ep$Dt <- strptime(paste(ep$Date, ep$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
#subset data by getting data only from two days
eps <- ep[as.Date(ep$Dt) >= as.Date("2007-02-01") & as.Date(ep$Dt) <= as.Date("2007-02-02"), ]
#call graphic device :png
png("plot3.png", width=480, height=480)
#draw a plot 
plot(eps$Dt, eps$Sub_metering_1, type="l", xlab="", ylab="Energy sun metering")
lines(eps$Dt, eps$Sub_metering_2,col="red")
lines(eps$Dt, eps$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#close png and save the picture
dev.off()