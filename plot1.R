##step 1. downloaded the household_power_consumption.txt into the "/Users/ssoham/coursera/electricpower/data" directory
##Step 2. Create the file feb2007.txt for data from the dates 2007-02-01 and 2007-02-02 (Done from Unix terminal)

head -n 1 ./data/household_power_consumption.txt > ./data/feb2007.txt
cat ./data/household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> ./data/feb2007.txt

##Reading into a data table
datafile <- "./data/feb2007.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")


##Date and time value conversion

data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

##Plot
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0,1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

##Save the plot
dev.print(png, file = "plot1.png", width = 1024, height = 768)