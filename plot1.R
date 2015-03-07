# Plot1.R

# Grab the header
dataheader <- read.table("./data/household_power_consumption.txt",sep=";", header = TRUE,nrow = 1)

# Pull only the 2/1/2007 and 2/2/2007 data
data <- read.table("./data/household_power_consumption.txt",sep=";", skip = 66637, header = FALSE,nrow=2880)

# Put the header on the data
colnames(data) <- colnames(dataheader)

# Concatenate the date and time in datetime format
data$datetime <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %T")

# Open device to plot to
png(filename = "./plot1.png")

#Plot 1
with(data,hist(Global_active_power,col = 2,main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.off()

#Keep these just for backup versions of the other files
# #Plot 2
# with(data,plot(datetime,Global_active_power,type="n",xlab = "",ylab = "Global Active Power (kilowatts)"))
# with(data,lines(datetime,Global_active_power,col=1))
# 
# #Plot 3
# with(data,plot(datetime,Sub_metering_1,type="n",xlab = "",ylab = "Energy Sub Metering"))
# with(data,lines(datetime,Sub_metering_1,col=1))
# with(data,lines(datetime,Sub_metering_2,col=2))
# with(data,lines(datetime,Sub_metering_3,col=3))
# 
# #plot 4
# par(mfrow = c(2, 2))
# with(data,plot(datetime,Global_active_power,type="n",xlab = "",ylab = "Global Active Power (kilowatts)"))
# with(data,lines(datetime,Global_active_power,col=1))
# 
# with(data,plot(datetime,Voltage,type="n"))
# with(data,lines(datetime,Voltage,col=1))
# 
# with(data,plot(datetime,Sub_metering_1,type="n",xlab = "",ylab = "Energy Sub Metering"))
# with(data,lines(datetime,Sub_metering_1,col=1))
# with(data,lines(datetime,Sub_metering_2,col=2))
# with(data,lines(datetime,Sub_metering_3,col=3))
# 
# with(data,plot(datetime,Global_reactive_power,type="n"))
# with(data,lines(datetime,Global_reactive_power,col=1))

