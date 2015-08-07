# plot 2

quartz(width = 5, height = 5)

plot(elec_2$FullDate, elec_2$Global_active_power, 
     col = "black", type = "l", lwd = 1,
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     main = "")
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()