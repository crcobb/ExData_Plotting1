# run common code to load the data
source("assignment1.R")

#Create the plot

png(filename = "plot1.png", width=480, height = 480)
hist(hpower_filter$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()