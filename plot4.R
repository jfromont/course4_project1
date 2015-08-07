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