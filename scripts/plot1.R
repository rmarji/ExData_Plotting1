
powerdata <- read.table("data/household_power_consumption.txt",header=TRUE,nrows=2075259,sep=';',check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"',na.strings="?")
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

data <- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plots/plot1.png", height=480, width=480)
dev.off()
