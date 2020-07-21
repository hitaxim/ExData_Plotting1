dataFile <- "household_power_consumption.txt"
data<-  read.table(dataFile, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
#subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
subsetdata <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

subsetdata$Date <- as.Date(subsetdata$Date, format = "%d/%m/%Y")
subsetdata$Time <- strptime(subsetdata$Time, format= "%H:%M:%S")
subsetdata[1:1440,"Time"] <- format(subsetdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetdata[1441:2880,"Time"] <- format(subsetdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot3.png", height = 480, width = 480)
plot(subsetdata$Time,subsetdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsetdata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

