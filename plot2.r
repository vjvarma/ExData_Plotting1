houses<-read.table(".../household_power_consumption.txt",sep = ";",header = TRUE)
houses$Date<-strptime(as.character(houses$Date), "%d/%m/%Y")
houses$Date<-as.Date(houses$Date)
Date1<-as.Date("2007-02-01")  
Date2<-as.Date("2007-02-02")
housesJan<-subset(houses,Date==Date1:Date2)

housesJan$Date<-as.factor(housesJan$Date)

housesJan$Date<-ymd_hms(paste(housesJan$Date, housesJan$Time))

plot(housesJan$Date,housesJan$Global_active_power,type = "l")
