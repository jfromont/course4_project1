setwd("/Users/jfromont/Dropbox/R/CourserA/Quizzes/04.Exploration analytique de donnees/Week1")
getwd()
list.files()

library("dplyr")
library("ggplot2")
library("datasets")


# data extraction, formatting and subsetting

elec_1 <- read.table("household_power_consumption.txt", 
                    header=TRUE, sep=";", na.strings="?")
str(elec_1)   # sapply(elec_1,class)

elec_1$FullDate <- paste(elec_1$Date, elec_1$Time)
elec_1$FullDate <- as.POSIXct(strptime(elec_1$FullDate, "%d/%m/%Y %H:%M:%S"))
str(elec_1) 

elec_2 <- elec_1 %>%
            filter(FullDate >= '2007-02-01' & FullDate < '2007-02-03' )

str(elec_2)


# plot 1

quartz(width = 5, height = 5)

hist(elec_2$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()


# plot 2

quartz(width = 5, height = 5)

plot(elec_2$FullDate, elec_2$Global_active_power, 
     col = "black", type = "l", lwd = 1,
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     main = "")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()


# plot 3

quartz(width = 5, height = 5)

plot(elec_2$FullDate, elec_2$Sub_metering_1, 
     col = "black",
     type = "l", lwd = 1,
     xlab = "", 
     ylab = "Energy sub metering")
lines(elec_2$FullDate, elec_2$Sub_metering_2,
      col = "red",
      type = "l", lwd = 1)
lines(elec_2$FullDate, elec_2$Sub_metering_3,
      col = "blue",
      type = "l", lwd = 1)
legend("topright",
       cex = 0.8,
       lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()


# plot 4

quartz(width = 6, height = 6)

par(mfrow = c(2,2), mar = c(4,4,2,2))
par("mar")
par("oma")

plot(elec_2$FullDate, elec_2$Global_active_power, 
     col = "black", type = "l", lwd = 1,
     xlab = "", 
     ylab = "Global Active Power", 
     main = "")

plot(elec_2$FullDate, elec_2$Voltage, 
     col = "black", type = "l", lwd = 1,
     xlab = "datetime", 
     ylab = "Voltage", 
     main = "")

plot(elec_2$FullDate, elec_2$Sub_metering_1, 
     col = "black",
     type = "l", lwd = 1,
     xlab = "", 
     ylab = "Energy sub metering")
lines(elec_2$FullDate, elec_2$Sub_metering_2,
      col = "red",
      type = "l", lwd = 1)
lines(elec_2$FullDate, elec_2$Sub_metering_3,
      col = "blue",
      type = "l", lwd = 1)
legend("topright",
       cex = 0.8,
       lwd = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(elec_2$FullDate, elec_2$Global_reactive_power, 
     col = "black", type = "l", lwd = 1,
     xlab = "datetime", 
     ylab = "Global_reactive_power", 
     main = "")

dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()
