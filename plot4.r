houses<-read.table(".../household_power_consumption.txt",sep = ";",header = TRUE)
houses$Date<-strptime(as.character(houses$Date), "%d/%m/%Y")
houses$Date<-as.Date(houses$Date)
Date1<-as.Date("2007-02-01")  
Date2<-as.Date("2007-02-02")
housesJan<-subset(houses,Date==Date1:Date2)

housesJan$Date<-as.factor(housesJan$Date)

housesJan$Date<-ymd_hms(paste(housesJan$Date, housesJan$Time))



par(mfrow=c(2,2))
plot(housesJan$Date,housesJan$Global_active_power,type = "l")

plot(housesJan$Date,housesJan$Voltage,type = "l" ,xlab = "Datetime")

plot(housesJan$Date,housesJan$Sub_metering_1,type = "l",ylim=range(c(housesJan$Sub_metering_1,housesJan$Sub_metering_2)))
par(new=TRUE)
plot(housesJan$Date,housesJan$Sub_metering_2,type = "l",col="red", axes = FALSE, xlab = "", ylab = ""
     ,ylim=range(c(housesJan$Sub_metering_1,housesJan$Sub_metering_2)))
par(new=TRUE)  
plot(housesJan$Date,housesJan$Sub_metering_3,type = "l",col="blue" ,axes = FALSE, xlab = "", ylab = ""
     ,ylim=range(c(housesJan$Sub_metering_1,housesJan$Sub_metering_3)))

plot(housesJan$Date,housesJan$Global_reactive_power,type = "l",xlab = "Datetime")

