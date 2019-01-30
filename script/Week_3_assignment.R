## script for assignment 3 (1.22.19)

read.csv("data/tidy.csv")

x <- 4

# vectors

weight_g <- c(50, 60, 31, 89)
weight_g

# now characters
animals <- c("mouse", "rat", "dog", "cat")
animals

# vector exploration tools
length (weight_g)

length (animals)

class (weight_g)
class (animals)

# str is my go-to first tool for looking at an object
str(x)
str (weight_g)

# be careful about adding values and running this code multiple times...
weight_g <- c(weight_g, 105)
weight_g

weight_g <- c(25, weight_g)
weight_g
# atomoic vector is something that cannot be further reduced
# 6 types of atomic vectors:
# numeric, (double), character, logical, integer, complex, raw
# First 4 listed are the most commonly used

typeof (weight_g)

weight_integer <- c(20L, 21L, 85L)
class(weight_integer)
typeof(weight_integer)

num_char <- c(1, 2, 3, "a")
class(num_char)
num_logical <- c(1, 2, 3, TRUE)
class(num_logical)
char_logical <- c("a", "b", "c", TRUE)
class(tricky)
tricky <- c(1, 2, 3, "4")

combined_logical <- c(num_logical, char_logical)
combined_logical
# one character in a mix means the whole thing is characterized as a character

# subsetting vectors
animals

animals [3]

animals [c(2,3)]
animals [c(3,1,3)]

#conditional subsetting
weight_g
weight_g[c(T, F, T, T, F, T, T)]

weight_g > 50

weight_g[weight_g > 50]

# search for multiple conditions in a vector

weight_g[weight_g < 30 | weight_g > 50]

weight_g[weight_g >= 30 & weight_g ==89]

# searching for characters
amimals[animals == "cat" | animals == "rat"]

animals[animals %in% c("rat", "antelope", "jackalope", "hippogriff")
        
"four" > "five"
"six > "five"
"eight" > "five"

"z" > "y"

# R is just looking at alphabetic order!

# missing values

heights <- c(2, 4, 4, NA, 6)
str(heights)

mean(weight_g)

mean(heights)
max(heights)

mean(x = heights, na.rm - TRUE)

max(heights)

# tells us whether its NA or not
is.na(heights)

na.omits(heights)

complete.cases(heights)
