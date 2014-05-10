household <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F)
i<-(household[,1]=="1/2/2007") | (household[,1]=="2/2/2007")
houseSub<-household[i,]
hist(houseSub[,3],col="red",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),cex.axis=0.75,main="Global Active Power")