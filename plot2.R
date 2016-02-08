# run common code to load the data
source("assignment1.R")

#create the plot
png(filename = "plot2.png", width=480, height = 480)
plot(hpower_filter$DateTime, hpower_filter$Global_active_power, type="o", pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
