houses<-read.table(".../household_power_consumption.txt",sep = ";",header = TRUE)
houses$Date<-strptime(as.character(houses$Date), "%d/%m/%Y")
houses$Date<-as.Date(houses$Date)
Date1<-as.Date("2007-02-01")  
Date2<-as.Date("2007-02-02")
housesJan<-subset(houses,Date==Date1:Date2)

housesJan$Date<-as.factor(housesJan$Date)

housesJan$Date<-ymd_hms(paste(housesJan$Date, housesJan$Time))

plot(housesJan$Date,housesJan$Sub_metering_1,type = "l",ylim=range(c(housesJan$Sub_metering_1,housesJan$Sub_metering_2)))
par(new=TRUE)
plot(housesJan$Date,housesJan$Sub_metering_2,type = "l",col="red", axes = FALSE, xlab = "", ylab = ""
     ,ylim=range(c(housesJan$Sub_metering_1,housesJan$Sub_metering_2)))
par(new=TRUE)  
plot(housesJan$Date,housesJan$Sub_metering_3,type = "l",col="blue" ,axes = FALSE, xlab = "", ylab = ""
     ,ylim=range(c(housesJan$Sub_metering_1,housesJan$Sub_metering_3)))
par(new=TRUE)   
legend("topright", pch ="-" , col = c("black","red", "blue"), legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))
