#Load de data
household <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",stringsAsFactors=F)
#Index with the correct dates
i<-(household[,1]=="1/2/2007") | (household[,1]=="2/2/2007")
#Subset with the correct dates
houseSub<-household[i,]
#Create the plot
png(filename = "plot1.png",width = 480, height = 480)
hist(houseSub[,3],col="red",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),cex.axis=0.75,main="Global Active Power")
dev.off()