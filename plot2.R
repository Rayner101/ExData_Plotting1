household <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F)
i<-(household[,1]=="1/2/2007") | (household[,1]=="2/2/2007")
houseSub<-household[i,]
houseTime<-strptime(paste(houseSub[,1],houseSub[,2]),"%d/%m/%Y %H:%M:%S")
houseSub<-cbind(houseTime,houseSub[,3:9])
plot(houseSub[,1],houseSub[,2],type="l",ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.75)