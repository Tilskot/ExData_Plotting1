
library(dplyr)
library(lubridate)

data_filtered <- read.table("data\\household_power_consumption.txt", sep=";", header=TRUE, na.strings="?") %>%
  mutate(Date = dmy(Date),
         Global_active_power = as.numeric(Global_active_power)) %>%
  filter( Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename='plot1.png', width=480, height=480, units='px')

hist(data_filtered$Global_active_power,
     col="red",
     breaks = 15,
     xlab = "Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()