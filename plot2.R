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

# Plot 2
# change from plot to line =  use type="l" !!
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))
plot( feb$timestamp,  feb$Global_active_power , type="l" , ylab='Global Active Power(kilowatts)')   
dev.copy(png, file = "plot2.png" , height=480, width=480)
dev.off() 
