plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


##Save the plot
dev.print(png, file = "plot2.png", width = 1024, height = 768)