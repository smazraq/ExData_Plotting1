# Plot2.R

# Grab the header
dataheader <- read.table("../Data/household_power_consumption.txt",sep=";", header = TRUE,nrow = 1)

# Pull only the 2/1/2007 and 2/2/2007 data
data <- read.table("../Data/household_power_consumption.txt",sep=";", skip = 66637, header = FALSE,nrow=2880)

# Put the header on the data
colnames(data) <- colnames(dataheader)

# Concatenate the date and time in datetime format
data$datetime <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %T")

# Open device to plot to
png(filename = "./plot2.png",width = 480, height = 480)

#Plot 2
with(data,plot(datetime,Global_active_power,type="n",xlab = "",ylab = "Global Active Power (kilowatts)"))
with(data,lines(datetime,Global_active_power,col=1))

dev.off()
