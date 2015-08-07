# plot 1

quartz(width = 5, height = 5)

hist(elec_2$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()