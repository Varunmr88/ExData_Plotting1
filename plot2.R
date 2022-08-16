# Loading sqldf library.
library(sqldf)
#Reading text file and filtering data as per requested date.
df1 <- read.csv.sql("household_power_consumption.txt", sql="select * from file 
        where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
#Parsing the date.
df1$dateTime = as.POSIXct(paste(df1$Date,df1$Time), format = "%d/%m/%Y %H:%M:%S")
# Open a png file
png("plot2.png",width = 480, height = 480) 
# 2. Create a plot
plot(x= df1$dateTime
     ,y=df1$Global_active_power
     ,type ='l',
     xlab = " ", ylab = "Global Active Power (kilowatts)")
# Close the png file.
dev.off()