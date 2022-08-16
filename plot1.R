# Loading sqldf library.
library(sqldf)
#Reading text file and filtering data as per requested date.
df1 <- read.csv.sql("household_power_consumption.txt", sql="select * from file 
        where Date = '1/2/2007' or Date = '2/2/2007'", sep=";")
#Parsing the date.
df1$Date = as.Date(df1$Date)
#creation of png file
# Open a png file
png("plot1.png") 
# 2. Create a plot
hist(df1$Global_active_power,width = 480, height = 480,
     frame = FALSE,pointsize=12,quality=100,
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red",main ="Global Active Power")
par(mar = c(2, 2, 2, 2))
# Close the png file.
dev.off()
