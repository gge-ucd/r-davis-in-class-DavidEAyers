library(tidyverse)
library(lubridate)

#read in data set
#data frame should have 35,038 obs of 5 variables
am_riv <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/2015_NFA_solinst_08_05.csv", skip = 13)

#STEP 1: 
#Make a datetime column by using paste to combine the date and time columns; remember to convert it to a datetime!
str(am_riv)
am_riv$date_time<-paste(am_riv$Date," ",am_riv$Time,sep="")
am_riv$date_time<-ymd_hms(am_riv$date_time,tz="America/Los_Angeles") 
str(am_riv)

#STEP 2: Calculate the weekly mean, max, and min water temperatures and plot as a point plot (all on the same graph)
am_riv_weekly_temp<-am_riv%>%
  group_by(week=week(date_time))%>%
  summarise(weekly_min=min(Temperature),weekly_max=max(Temperature),weekly_avg=mean(Temperature))
str(am_riv_weekly_temp)
ggplot(data=am_riv_weekly_temp,aes(x=week))+
  geom_point(aes(y=weekly_min,color="red"))+
  geom_point(aes(y=weekly_max,color="blue"))+
  geom_point(aes(y=weekly_avg,color="green")) 

#STEP 3: Calculate the hourly mean Level for April through June and make a line plot (y axis should be the hourly mean level, x axis should be datetime)
#filter out April through June
am_riv_hourly_level<-am_riv%>%
  filter(month(date_time)>3)%>%
  filter(month(date_time)<7)%>%

#group by date and hour
  group_by(Date,hour=hour(date_time))%>%
  summarise(hourly_mean_level=mean(Level))
am_riv_hourly_level$date_hour<-paste(am_riv_hourly_level$Date," ",am_riv_hourly_level$hour,sep="")
am_riv_hourly_level$date_hour<-ymd_h(am_riv_hourly_level$date_hour)
ggplot(data=am_riv_hourly_level, aes(x=date_hour,y=hourly_mean_level))+
  geom_line()

#Part 2
#STEP 1:
#Use the mloa_2001 data set (if you don’t have it, download the .rda file from the resources tab on the website). Remember to remove the NAs (-99 and -999) and to create a datetime column (we did this in class).
load("data/mauna_loa_met_2001_minute.rda")

#Create a datetime column
mloa_2001$datetime<-paste0(mloa_2001$year,"-",mloa_2001$month,"-",mloa_2001$day," ",mloa_2001$hour24,":",mloa_2001$min)
mloa_2001$datetime<-ymd_hm(mloa_2001$datetime)

#Remove NA's (-99 and -999)
mloa_2001<-mloa_2001%>%
  filter(rel_humid!=-99.9)%>%
  filter(temp_C_2m!=-99.9)%>%
  filter(windSpeed_m_s!=-99.9)%>%
  filter(rel_humid!=-999.9)%>%
  filter(temp_C_2m!=-999.9)%>%
  filter(windSpeed_m_s!=-999.9)

plot_temp<-function(m=0){
  mloa_2001_month<-mloa_2001%>%
    filter(month==m)
  plot<-ggplot(data=mloa_2001_month,aes(x=datetime,y=temp_C_2m))+
    geom_point()
  return(plot)
}  
plot_temp(2)