#Week 6 Live Code

#installtidyverse:
install.packages("tidyverse")
library(tidyverse)

# read in csv file
surveys <- read_csv("data/portal_data_joined.csv")

# remove all NA's out of weight, hindfoot_length, and sex column
surveys_complete <- surveys %>% 
  filter(!is.na(weight), !is.na(hindfoot_length), !is.na(sex))

species_counts <- surveys_complete %>% 
  group_by(species_id) %>% 
  tally() %>% 
  filter (n>=50)

surveys_complete <- surveys_complete %>% 
  filter(species_id %in% species_count$species_id)

#example of list we could use instead of the row in a dataframe
species_keep <- c("DM", "DO")

#Writing your dataframe to .csv

write_csv(surveys_complete, path = "data output/surveys_complete.csv")

#### ggplot time! ===============================
# header format above transforms code into sections
# Tue Feb 12 14:31:29 2019 ---------------------------
# type ts then tab then select ts to insert timestamp as shown above

# tidyverse is like sending things through a pipe with lots of little steps applied

# ggplot is more like constructing a painting

#ggplot(data = DATA, mapping = aes(MAPPINGS))+
#geom_function
#mapping is how you map data onto the "canvas" ie x/y
#mapping helps transform data into a graphical element
#geoms put things on your canvas...

ggplot(data = surveys_complete)

#define a mapping
#use + to transition from making canvas to applying more stuff
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

#saving a plot object (saving the raw canvas as surveys_plot)
surveys_plot <- ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))
  
surveys_plot +
  geom_point ()

#Challenge:
#hexbin shows the density of plot output (heatmap)
install.packages("hexbin")
library(hexbin)

surveys_plot +
  geom_hex()

#now we'll build plots from the ground up
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length))

# alpha is visual transparancy or lacktherof
# this is a global modification to all data points (modifies whole geom appearance)
surveys_complete %>% 
  ggplot(aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "tomato")

# using data in a geom
surveys_complete %>% 
  ggplot (aes(x= weight, y = hindfoot_length)) +
  geom_point (alpha = 0.1, aes(color = species_id))

# using color as a global aesthetic
surveys_complete %>% 
  ggplot (aes(x= weight, y = hindfoot_length, color = species_id)) + 
  geom_point(alpha = 0.1)

#applying a little jitter (seperates datapoints a little to make data visualization easier)
surveys_complete %>% 
  ggplot (aes(x= weight, y = hindfoot_length, color = species_id)) + 
  geom_jitter(alpha = 0.1)

# move on to box plots
surveys_complete %>% 
  ggplot(aes(x = species_id, y = weight)) +
  geom_boxplot()

# adding points to boxplot
#color and fill are different sometimes - in this case the fill is affected by alpha, but not the outline
surveys_complete %>% 
  ggplot(aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.3, color = "tomato") +
  geom_boxplot (alpha = 0)

#plotting time series
#count combines group_by and tally into one function
yearly_counts <- surveys_complete %>% 
  count(year, species_id)

yearly_counts %>% 
  ggplot(aes(x=year, y=n, group=species_id,
  color = species_id) +
  geom_line()
#what's wrong with this code (above)

#facetting - creates a series of plots instead of all data plotted over each other
yearly_counts %>% 
  ggplot(aes(x = year, y = n, color=species_id)) +
  geom_line()+
  facet_wrap(~species_id)

# including sex
yearly_sex_counts <-surveys_complete %>% 
  count(year, species_id, sex)

ysx_plot <- yearly_sex_counts %>% 
  ggplot(aes(x=year, y=n, color = sex)) +
  geom_line() +
  facet_wrap(~species_id) +
  theme_bw() +
  theme(panel.grid = element_blank ())

# can pull out parts and name them as standalones
my_theme <- theme_bw() +
  theme(panel.grid = element_blank ()) 
  

# can name plots and apply more stuff
ysx_plot + theme_minimal ()
ysx_plot + theme_tufte

#themes will change overall appearance of the plot

# a little more facetting
yearly_sex_weight <- surveys_complete %>% 
  group_by(year, sex, species_id) %>% 
  summarize(avg_weight = mean(weight))

#facet_grid uses rows ~ columns for facetting. the "." indicates nothing in this dimension
yearly_sex_weight %>% 
  ggplot(aes(x = year, y = avg_weight, color =
  species_id)) +
  geom_line () +
  facet_grid(sex ~.)

#hjust - nudges text horizontally
#vjust - nudges text vertically

ggsave("figures")