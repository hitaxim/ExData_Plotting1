dataFile <- "household_power_consumption.txt"
data<-  read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
#subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subsetdata <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

globalActivePower <- as.numeric(subsetdata$Global_active_power)
subsetdata$Date <- as.Date(subsetdata$Date, format = "%d/%m/%Y")
subsetdata$Time <- strptime(subsetdata$Time, format= "%H:%M:%S")
subsetdata[1:1440,"Time"] <- format(subsetdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetdata[1441:2880,"Time"] <- format(subsetdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#datetime_1 <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d %m %Y %H:%M:%S")
#subsetdata <- cbind(subsetdata, datetime_1)

png("plot2.png", height = 480, width = 480)
plot(subsetdata$Time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

