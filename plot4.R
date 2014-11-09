#setwd("K:/010 ZELFSTUDIE/Coursera/004 Exploratory Data Analysis/Project1")
setwd("D:/GitHub_SourceTree/ExploratoryDataAnalysis_Project1")
# read the data
filename <- "./data/household_power_consumption.txt"
data2big <- read.table(filename,
                       header = TRUE,
                       skip= 50000, nrow=70000 ,
                       sep = ";",
                       colClasses = c("character", "character", rep("numeric",7)),
                       na = "?")
# the classes of the fields needs to be define !
# to get the headers back on...
headername <- read.csv(filename , header=TRUE , sep=';' , , nrow=1)
names(data2big) <- names(headername)
# to understand the size of the dataset 
#  read the data until  row 70000
object.size(data2big)     
# 83644688 bytes   complete data (all rows)
# 3228824 bytes  with smaller dataset 

# subset the dataset to the  february first and second.
feb <- data2big[ (data2big$Date=="1/2/2007"|data2big$Date=="2/2/2007"),]
# concatenate Date and Time column
timestamp_ <- paste(feb$Date, feb$Time)
feb$timestamp <-strptime(timestamp_, "%d/%m/%Y %H:%M:%S")
# dataset consist of 2880 rows
#summary(feb)
#View(feb)
###  dataset is ready to create Graphs


#Plot 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with (feb ,
  {
#leftabove
  plot( timestamp,  Global_active_power , type="l" , ylab='Global Active Power(kilowatts)'  , xlab='')   
#rightabove
  plot (timestamp, Voltage  , type="l" , ylab='Voltage' , xlab='datatime')
#leftunder
  plot( timestamp,Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="" , col='Green')
  lines(timestamp,Sub_metering_2, col='Red')
  lines(timestamp,Sub_metering_3, col='Blue')
  legend("topright", col=c("green", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 #right under
 plot ( timestamp, Global_reactive_power , type='l' , xlab='datetime')
   }
)
dev.copy(png, file="plot4.png", height=600, width=800)
dev.off()
