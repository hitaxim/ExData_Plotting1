dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, stringsAsFactors = FALSE, sep=";", dec=".")
subSet1 <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subSet1$Global_active_power)
png("plot1.png", width=480, height =480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
