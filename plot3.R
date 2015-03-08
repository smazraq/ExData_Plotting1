# Plot3.R

# Grab the header
dataheader <- read.table("../Data/household_power_consumption.txt",sep=";", header = TRUE,nrow = 1)

# Pull only the 2/1/2007 and 2/2/2007 data
data <- read.table("../Data/household_power_consumption.txt",sep=";", skip = 66637, header = FALSE,nrow=2880)

# Put the header on the data
colnames(data) <- colnames(dataheader)

# Concatenate the date and time in datetime format
data$datetime <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %T")

# Open device to plot to
png(filename = "./plot3.png",width = 480, height = 480)

#Plot 3
with(data,plot(datetime,Sub_metering_1,type="n",xlab = "",ylab = "Energy Sub Metering"))
with(data,lines(datetime,Sub_metering_1,col=1))
with(data,lines(datetime,Sub_metering_2,col=2))
with(data,lines(datetime,Sub_metering_3,col=4))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c(1,2,4),lwd=2)

dev.off()

