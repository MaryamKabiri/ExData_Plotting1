setwd("C:/Users/Maryam/Desktop/Datascientists/Exploratory Data Analysis/Week 1")

#getting data
data_full<-read.csv("household_power_consumption.txt", header=TRUE, sep=';', 
                    na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE,
                    comment.char="", quote='\"')

data_full$Date<-as.Date(data_full$Date, format="%d/%m/%Y")

#subseting the data
data<-subset(data_full, subset=(Date>= "2007-02-01" & Date<="2007-02-02"))

#converting date
datetime<-paste(as.Date(data$Date), data$Time)
data$Datetime<-as.POSIXct(datetime)

#plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))  
plot(data$Global_active_power ~ data$Datetime, xlab="", ylab="Global Active Power", type="l")
plot(data$Voltage ~ data$Datetime, xlab="datetime", ylab="Voltage", type="l")
plot(data$Sub_metering_1 ~ data$Datetime, type = "l", ylab = "Energy sub metering)", xlab = "", col='black')
lines(data$Sub_metering_2 ~ data$Datetime, type="l", col = 'Red')
lines(data$Sub_metering_3 ~ data$Datetime, type="l", col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
plot(data$Global_reactive_power ~ data$Datetime, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()
