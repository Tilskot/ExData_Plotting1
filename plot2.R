
library(dplyr)
library(lubridate)

data <- read.table("data\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors = FALSE) 

data_filtered <- data %>%
  mutate(DateTime = dmy_hms(paste(Date,Time)),
         Date = dmy(Date),
         Global_active_power = as.numeric(Global_active_power)) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename='plot2.png', width=480, height=480, units='px')

plot(x = data_filtered$DateTime,
     y = data_filtered$Global_active_power,
     type = "l",
     xlab = " ",
     ylab = "Global Active Power (kilowatts)")

dev.off()