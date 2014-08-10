# ASSIGNMENT 1, due Aug 10, 2014
#
# download the data file exdata_data_household_power_consumption.zip
# unzip this file.
#  get the data related to Feb 1 and Feb 2, 2007 into a temporary file.
#grep "^[1,2]/2/2007" household_power_consumption.txt>x.2
# get header into a temporary file
#head -1 household_power_consumption.txt>x.1
# get header and two days' data into a file from the two temporary files.
#type x.1 > febhpc.txt
#type x.2 >> febhpc.txt

# We are all set to create the required plots. Use png command to open output file, draw the image, and close the device.

# Plot 1
# clean up the work environment and get the input file ready.
rm("epc_data"); rm("small_datafile")
# set the working directory
setwd("C:/largedata")
# read the input datafile
small_datafile<-"C:/largedata/febhpc.txt"
epc_data<-read.table(small_datafile, sep=";", header=T, na.strings="?")
# convert the Date and Time variables to Date/Time classes
epc_data$datetime<-strptime(paste(epc_data$Date,epc_data$Time),"%d/%m/%Y %H:%M:%S")
# the work data is ready for use. attach it to simplify references to it.
attach(epc_data)

# call png to open an output file of png format.
png(filename="./plot1.png", width=480, height=480)
# draw the image.
hist(Global_active_power
     , breaks=12, xlim=c(0,6), ylim=c(0,1200), xaxp=c(0,6,3)
     , col="red", xlab="Global Active Power (kilowatts)"
     , main="Global Active Power")
# do close the device.
dev.off()

# End of script for Plot1 of Project 1 of Exploratory Data Analysis
