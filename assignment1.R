library(dplyr)
library(lubridate)

if( !exists("hpower_df")) {
	# Only read the file is the variable hasn't been created
	
	hpower_df <- read.delim("./.data/household_power_consumption.txt", sep=";", as.is=TRUE)
}

if( !exists("hpower_filter")) {
	hpower <- tbl_df(hpower_df)
	
	print("Reformatting")

	hpower <- hpower %>%
		mutate( DateTime = dmy_hms(paste(Date,Time))) %>%
		mutate( DateTime = dmy_hms(paste(Date,Time))) %>%
		mutate(Global_active_power = as.numeric(Global_active_power)) %>%
		mutate(Global_reactive_power = as.numeric(Global_reactive_power)) %>%
		mutate(Voltage = as.numeric(Voltage)) %>%
		mutate(Global_intensity = as.numeric(Global_intensity)) %>%
		mutate(Sub_metering_1 = as.numeric(Sub_metering_1)) %>%
		mutate(Sub_metering_2 = as.numeric(Sub_metering_2))

	hpower <- hpower %>%
		mutate( Date = dmy(Date)) %>%
		mutate( Time = hms(Time))
		
		
	hpower_filter <- hpower %>%
		filter(DateTime>= ymd('2007/02/01'), DateTime < ymd('2007/02/03'))
}
