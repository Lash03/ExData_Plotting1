##Plot 2

##Reading Dataset
power<- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subpower<- subset(power, power$Date=="1/2/2007" | power$Date == "2/2/2007")

##Tranforming the Date and Time variables into objects of type Date and POSITX
subpower$Date<- as.Date(subpower$Date, format="%D/%M/%Y")
subpower$Time<- strptime(subpower$Time, format="%H/%M/%S")
subpower[1:1440, "Time"] <- format(subpower[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subpower[1440:2880, "Time"] <- format(subpower[1440:2880, "Time"], "2007-02-02 %H:%M:%S")

#Plotting
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)), type = "1", xlab = "", ylab = "Global Active Power (kilowatts)" )
title(main = "Global Active Pover vs Time")
dev.copy(png, file= "plot2.png")
dev.off()