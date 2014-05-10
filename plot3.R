household <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F)
i<-(household[,1]=="1/2/2007") | (household[,1]=="2/2/2007")
houseSub<-household[i,]
houseTime<-strptime(paste(houseSub[,1],houseSub[,2]),"%d/%m/%Y %H:%M:%S")
houseSub<-cbind(houseTime,houseSub[,3:9])
plot(houseSub[,1],houseSub[,6],type="l",ylab="Energy sub metering",xlab="",cex.axis=0.75)
lines(houseSub[,1],houseSub[,7], col="red")
lines(houseSub[,1],houseSub[,8], col="blue")
legend("topright", lty=1,lwd=2,cex=0.9, col=c("black", "red", "blue"), legend=colnames(houseSub[,6:8]))