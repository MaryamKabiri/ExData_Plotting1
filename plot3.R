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

#plot 3
png("plot3.png", width=480, height=480)
with(data, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering)", xlab = "", col='black')
  lines(Sub_metering_2 ~ Datetime, type="l", col = 'Red')
  lines(Sub_metering_3 ~ Datetime, type="l", col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()