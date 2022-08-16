# Loading sqldf library.
library(sqldf)
#Reading text file and filtering data as per requested date.
df1 <- read.csv.sql("household_power_consumption.txt", sql="select * from file 
        where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
#Parsing the date.
df1$dateTime = as.POSIXct(paste(df1$Date,df1$Time), format = "%d/%m/%Y %H:%M:%S")
# Open a png file
png("plot3.png",width = 480, height = 480) 
# 2. Create a plot
plot(df1$dateTime,df1$Sub_metering_1,type ='l',col="black",xlab="",ylab = "Energy sub metering")
     lines(df1$dateTime,df1$Sub_metering_2,col = "red")
     lines(df1$dateTime,df1$Sub_metering_3, col = "blue")
# Adding legend to the graph.
     legend("topright", col=c("black","red","blue")
            , c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")
            , lty=c(1,1)
            , bty="n"
            , cex=1) 
# Close the png file.
dev.off()
str(df1)