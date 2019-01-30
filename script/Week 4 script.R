
Intro to dataframes

download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data/portal_data_joined.csv")

surveys <- read.csv(file = "data/portal_data_joined.csv")

head(surveys)

#lets look at structure
str(surveys)

dim(surveys)
nrow(surveys)
ncol(surveys)

tail(surveys)

names(surveys)

rownames(surveys)

# another really useful one
summary(surveys)

# subsetting dataframes
animal_vec <- c("mouse", "rat", "cat")
animal_vec [2]

surveys[1,1]
head(surveys)
surveys[2,1]

surveys[1,6]
#first # (1) is row, second # (6)is column)

surveys[33000,1]

# pull up the whole first column (as a VECTOR)
#leaving the row dimension blank gives us every row in the specified column
surveys[,1]

#using a single number with no comma will give us a dataframe with one column
surveys[1]
head (surveys)[1]

# pull out the first three values in the sixth column
surveys[1:3,6]

# pull out a whole single observation
surveys[5,]

# negative sign to exclude indices
surveys[1:5,-1]
# includes all columns but the first one
# excludes the whole vector (10:34786)
str(surveys[-c(10:34786),])

surveys[c(10,15,20),]
surveys[c(10,15,20,10),]

# more ways to subset
surveys["plot_id"] # single column as data.frame

surveys[,"plot_id"] # single column as a vector

surveys[["plot_id"]] # single column as vector, useful with lists (we'll come back to this later)

surveys$year #single column as a vector

# challenge: create a data frame surveys 200..
str(surveys)
surveys200 <- (surveys)[200,]
surveys200

surveys[nrow(surveys),]

surveys_last <- 

surveys_middle <- surveys[nrow(surveys)/2,]
survey_middle

surveys[-c(7:nrow(surveys)),]

# Finally, factors
surveys$sex

# creating our own factor
sex <- factor(c("male", "female", "female", "male"))
sex
class(sex)
typeof(sex)

# levels gives back a character vector of the levels
levels(sex)
levels(surveys$genus)

nlevels(sex)

concentration <- factor(c("high", "medium", "high", "low"))
concentration

concentration <- factor(concentration, levels = c("low", "medium", "high"))
concentration

# lets try adding to a factor
concentration <- c(concentration, "very high")
concentration

# coerces to characters if you add a value that doesn't match a current level

# lets just make them characters
as.character(sex)

# factors with numeric levels
year_factor <- factor(c(1990, 1923, 1965, 2018))
as.numeric(year_factor)

# this will actually give us a numeric vector
as.numeric(as.character(year_factor))

# why the heck all the factors
?read.csv
surveys_no_factors <- read.csv(file="data/protal_data_joined.csv", stringsAsFactors = FALSE)

# reccomended way
as.numeric(levels)(year_factor))[year_factor]

# renaming factors
sex <- surveys$sex
levels(sex)
levels(sex) [1] <- "undetermined"
levels(sex)

# working with dates
library(lubridate)
my_date <- ymd("2015-01-01")
my_date
str(my_date)c

my_date <- ymd (paste("2015, "05", "17", sep = "-"))
 my_date
 
paste(surveys$year, surveys$month, surveys$day, sep = "-")
surveys$day, sep = "-"))

