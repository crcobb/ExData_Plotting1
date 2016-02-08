# run common code to load the data
source("assignment1.R")

#create the plot
png(filename = "plot4.png", width=480, height = 480)

# doing the combines to properly scale the plot window x and y axis.  If sub_metering_2 or 3 contain the largest or smallest value then scalling would not be proper.
par(mfrow = c(2,2))
# Plot #1
plot(hpower_filter$DateTime, hpower_filter$Global_active_power, xlab="", ylab="Global Active Power", pch=NA, type="o")

#plot #2
plot(hpower_filter$DateTime, hpower_filter$Voltage, xlab="datetime", ylab="Voltage", pch=NA, type="o")

#plot #3
plot(combine(hpower_filter$DateTime,hpower_filter$DateTime,hpower_filter$DateTime), 
	 combine(hpower_filter$Sub_metering_1,
	 hpower_filter$Sub_metering_2,
	 hpower_filter$Sub_metering_3 ), 
	 xlab = "",
	 ylab = "Enegry sub metering",
	 type="n")

points( hpower_filter$DateTime, hpower_filter$Sub_metering_1, col="black", pch=NA, type="o")
points( hpower_filter$DateTime, hpower_filter$Sub_metering_2, col="red", pch=NA, type="o")
points( hpower_filter$DateTime, hpower_filter$Sub_metering_3, col="blue", pch=NA, type="o")

legend("topright", legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col = c("black","red","blue"), lty=1, bty="n")

#plot #4
plot(hpower_filter$DateTime,hpower_filter$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="o", pch=NA)

dev.off()
