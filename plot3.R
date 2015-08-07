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
