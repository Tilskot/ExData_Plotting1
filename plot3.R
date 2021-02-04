
library(dplyr)
library(lubridate)

data <- read.table("data\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors = FALSE) 

data_filtered <- data %>%
  mutate(DateTime = dmy_hms(paste(Date,Time)),
         Date = dmy(Date),
         Global_active_power = as.numeric(Global_active_power)) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename='plot3.png', width=480, height=480, units='px')

plot(x = data_filtered$DateTime,
     y = data_filtered$Sub_metering_1,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)")
lines(x = data_filtered$DateTime,
      y = data_filtered$Sub_metering_2, 
      col = "red")
lines(x = data_filtered$DateTime,
      y = data_filtered$Sub_metering_3,
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

dev.off()
