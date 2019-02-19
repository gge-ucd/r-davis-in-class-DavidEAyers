#Week 7 Live Code

# how to install package from GitHub
# most packages are in cran (official R package thing)

install.packages("devtools")

#allows you to install someone's R package from GitHub
#why doesn't this work??
devtools::install_github("thomasp85/patchwork")

#### Data Import and Export ####

library(tidyverse)

wide_data <- read_csv("data/wide_eg.csv")

#skip the first 2 rows
wide_data <- read_csv("data/wide_eg.csv", skip = 2)

wide_data

#loaded an RDA file that contained a single R object. RDA files can contain 1 or more RDA objects
load("data/mauna_loa_met_2001_minute.rda")

#write RDA data to a _____
# RDS/RDA's are typically used for modeling etc
# an alternative to a CSV file
saveRDS(wide_data, "data/wide_data.rds")
#remove wide_data
rm(wide_data)

wide_data_rds <- readRDS("data/wide_data.rds")

# saveRDS() and readRDS() for .rds files, and we use save() and load () for .rda files

# allows you to access a excel worksheet (with mult tabs)

#### working with dates and times ####
install.packages("lubridate")
library(lubridate)

sample_dates1 <- c("2016-02-01", "2016-03-17", "2017-01-01")

#looking for data that looks like YYYY MM DD
as.Date(sample_dates1)

sample.date2 <- c("02-01-2001", "04-04-1991")

#generates output in console
#format allows you to tell r how we formatted the dates
# y vs Y is different
sample.date2<- as.Date format = "%m-%d-%Y")

as.Date("2016/01/01", format= "%m-%d-%Y")

#Jul 04, 2017
  
#Date Calculations
# didn't have to say anything about format since it was already in the expected format
dt1 <- as.Date("2017-07-11")

dt2 <- as.Date("2016-04-22")

dt1

#time difference in days
print(dt1-dt2)  

#time diff in weeks
print(difftime(dt1, dt2, units = "week"))

# lists a date every 6 days
six.weeks <- seq(dt1, length = 6, by = "week")

#create a sequence of 10 dates starting at dt1 with 2 week intervals
challenge <- seq(dt1, length = 10, by = "14 days")

#lubridate package is used for date time data
# allows you to type in shorthand for the format output
# facilitates the same print functions described above
ymd("2016/01/01")

dmy("04.04.91")

mdy ("Feb 19, 2005")


  
  