#reading data from csv txt file with read.csv , sep=";", store data as eps
ep<-read.csv("household_power_consumption.txt",sep=";",na.string="?")
#make a new variable that combine date and time variable and store it in ep as Date type
ep$Dt <- strptime(paste(ep$Date, ep$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")
#subset data by getting data only from two days
eps <- ep[as.Date(ep$Dt) >= as.Date("2007-02-01") & as.Date(ep$Dt) <= as.Date("2007-02-02"), ]
#call graphic device :png
png("plot2.png", width=480, height=480)
#draw a plot 
plot(eps$Dt, eps$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#close png and save the picture
dev.off()