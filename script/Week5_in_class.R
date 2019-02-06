#Week 5 Live Code

#installtidyverse:
install.packages("tidyverse")
library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")
surveys
str(surveys)

#select is used for columns in a data frame
#tibble is just a fancy data frame (prints nicer etc)
select(surveys, plot_id, species_id, weight)

#filter is a command used for selecting rows
# == means _______
filter(surveys, year == 1995)

surveys2 <- filter(surveys, weight <5)

surveys_sml <- select(surveys2, species_id, sex, weight)

#Pipes %>% "then" (control shift m)
# pipes take everything from left of pipe and passes it to the right of pipe
# combine lots of steps and keeps things organized

surveys %>% 
  filter(weight <5) %>% 
    select(species_id, sex, weight)

  #Challenge! Subset surveys to include individuals collected before 1995 and retain only the columns year, sex, and weight
  surveys %>% 
    filter(year < 1995) %>% 
      select(year, sex, weight)
  
  #mutate means perform an operations on a given column
 surveys <- surveys %>%
    mutate(weight_kg = weight/1000) %>% 
    mutate(weight_kg2 = weight_kg * 2)
    
 #is.na - asks if it is an na
 #!is.na - not is na (filters out na's)
 surveys %>%
   filter(!is.na(weight)) %>% 
  mutate(weight_kg = weight/1000) %>% 
    head()
    summary()
#because you put a pipe before head or summary this means you can use open brackets to specify what you want to head or summarize 
    
#Challenge 2:

#Create a new data frame from the surveys data that meets the following criteria: 
#contains only the  species_id column 
#and a new column called hindfoot_half containing values that are half the  hindfoot_length values. 
#In this hindfoot_half column, there are no NAs and all values are less than 30.
    
#Hint: think about how the commands should be ordered to produce this data frame!
  #my answer 
      surveys %>% 
      filter(species_id, hindfoot_length) %>% 
        mutate (hindfoot_length = hindfoot_length/2) %>% 
      filter(!is.na(hindfoot_length/2 <30))
  
  #correct answer
  #had to assign hindfoot half first..
      surveys_hindfoot_half <- surveys %>%
        filter(!is.na(hindfoot_length)) %>%
        mutate(hindfoot_half = hindfoot_length / 2) %>%
        filter(hindfoot_half < 30) %>%
        select(species_id, hindfoot_half)
      
# "complete cases" to filter out all the NA's
      
#group_by is good for split-apply combine
      
      
#na.rm = TRUE (means remove na's)
#summarize - function often used after group_by
surveys %>% 
  group_by(sex) %>% 
  summarize(mean_weight = mean(weight, na.rm = TRUE))

#mutate adds new columns to an existing data frame, summarize spits out a totally new data frame

#you can group by multiple columns
surveys %>% 
  group_by(sex) %>% 
  mutate(mean_weight = mean(weight, na.rm = TRUE)) %>% view

#view allows you to view a tibble as a table (temporariliy) is not saved (see above)

surveys %>% 
  filter(is.na(sex))
#this is a way to look at all the NA's in the data frame

# tells us where the NA's are in species
surveys %>%  
  group_by(species) %>% 
  filter(is.na(sex)) %>% 
  tally()

# you can use group_by with mult columns
surveys %>%
filter(!is.na(weight)) %>% 
  group_by(sex, species_id) %>% 
  summarize(mean_weight = mean(weight), min_weight = min (weight)) %>% 
  view

#tally function - used to determine enumerate (not perform operations like mean etc as is done in summary)

surveys %>% 
  group_by(sex, species_id) %>% 
  tally () %>% view

#tally () same as group_by (something) %>% summarize (new_column = n())

#summarize adds a column to existing table right??

#Gathering and spreading

#transforms long format to wide and visa versa
#spread takes the data you want to spread, the key column, and value column

surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarise(mean_weight = mean(weight))

surveys_spread <- surveys_gw %>% 
  tidyr::spread(key = genus, value = mean_weight)

surveys_gw %>% 
  tidyr::spread(genus, mean_weight, fill = 0) %>% view



  

      

  
  