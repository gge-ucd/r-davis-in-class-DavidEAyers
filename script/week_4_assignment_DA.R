# Step 1: 
#Create a new script in your r-davis-in-class-yourname project named week_4_assignment_ABC.R but with your initials in place of ABC. Save it to your scripts folder.

# Step 2: 
#Read portal_data_joined.csv into R using the read.csv command and create a dataframe named surveys (just like we did in class).

surveys <- read.csv(file = "data/portal_data_joined.csv")
surveys

#Step 3: 
#Subset to just the first column and columns five through 8. Include only the first 400 rows. Save this as a dataframe called  surveys_subset.

# subset rows 1 - 400, columns 1, 5, and 8:

surveys_subset <- surveys[1:400,c(1,5:8)]
surveys_subset

#Step 4:
# CHALLENGE: Select all rows that have a hindfoot_length greater than 32, save these in a new data.frame named  surveys_long_feet, then plot its hindfoot_length values as a histogram using the hist function.

surveys_long_feet <- surveys_subset[surveys_subset$hindfoot_length > 32, ]
surveys_long_feet

#Step 5:
# Change the column hindfoot_lengths into a character vector.

hindfoot_lengths <- as.character(factor(surveys_long_feet$hindfoot_length))
hindfoot_lengths

#Step 6:
# Plot the hindfoot_lengths in a histogram (if this doesn’t work, just leave it, and think about it during Part II of the assignment, wink wink).
hist(hindfoot_lengths)

#Step 7:
# Commit & Push the R script to GitHub - check your repository on GitHub and make sure your script is there


