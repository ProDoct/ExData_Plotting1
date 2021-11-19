#reading data from csv txt file with read.csv , sep=";", store data as eps
ep<-read.csv("household_power_consumption.txt",sep=";",na.string="?")
#subset data by getting data only from two days
eps<-subset(ep,Date=="1/2/2007"|Date=="2/2/2007")
#call graphic device :png
png("plot1.png", width=480, height=480)
#draw a plot 
hist(eps$Global_active_power,col="red",xlab="Global active power",main="Global active power")
#close png and save the picture
dev.off()