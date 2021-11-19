#reading data from csv txt file with read.csv , sep=";", store data as eps
ep<-read.csv("household_power_consumption.txt",sep=";",na.string="?")
#make a new variable that combine date and time variable and store it in ep as Date type
ep$Dt <- strptime(paste(ep$Date, ep$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
#subset data by getting data only from two days
eps <- ep[as.Date(ep$Dt) >= as.Date("2007-02-01") & as.Date(ep$Dt) <= as.Date("2007-02-02"), ]
#call graphic device :png
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))#,mar=c(3,3,2,2))
#draw the 1st plot 
plot(eps$Dt, eps$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#draw the second plot
plot(eps$Dt, eps$Voltage, type="l", xlab="datetime", ylab="Voltage")
#draw the 3rd plot

plot(eps$Dt, eps$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(eps$Dt, eps$Sub_metering_2,col="red")
lines(eps$Dt, eps$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#draw the 4th plot
plot(eps$Dt, eps$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#close png and save the picture
dev.off()