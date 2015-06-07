powerdata <- read.table("data/household_power_consumption.txt",header=TRUE,na.strings="?",nrows=2075259,sep=';',check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")

data <- subset(powerdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plots/plot2.png", height=480, width=480)
dev.off()