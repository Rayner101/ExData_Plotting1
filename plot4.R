#Load the data
household <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F)
#Index with the correct dates
i<-(household[,1]=="1/2/2007") | (household[,1]=="2/2/2007")
#Subset with the correct dates
houseSub<-household[i,]
#Create column with the strptime() format
houseTime<-strptime(paste(houseSub[,1],houseSub[,2]),"%d/%m/%Y %H:%M:%S")
#Bind the new strptime colum with the other columns from the dataframe
houseSub<-cbind(houseTime,houseSub[,3:9])
#Create the plot
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2),mar=c(4,4,4,3))
#Plot1
plot(houseSub[,1],houseSub[,2],type="l",ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.75)
#Plot2
plot(houseSub[,1],houseSub[,4],type="l",ylab="Voltage",xlab="datetime",cex.axis=0.75)
#Plot3
plot(houseSub[,1],houseSub[,6],type="l",ylab="Energy sub metering",xlab="",cex.axis=0.75)
lines(houseSub[,1],houseSub[,7], col="red")
lines(houseSub[,1],houseSub[,8], col="blue")
legend("topright", lty=1, bty="n",col=c("black", "red", "blue"), legend=colnames(houseSub[,6:8]))
#Plot4
plot(houseSub[,1],houseSub[,3],type="l",ylab="Global_Active_Power",xlab="datetime",cex.axis=0.75)
dev.off()
