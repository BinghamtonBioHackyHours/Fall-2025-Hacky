                          
##### Exploring Data Frames #####
                            
#   Objectives

# - Add and remove rows or columns.
# - Append two data frames.
# - Display basic properties of data frames including size and class of the columns, names, and first few rows.

# Question

# - How can I manipulate a data frame?

# Lets download our data directly from our github, we will get back to this later for now just run these lines

download.file("https://raw.githubusercontent.com/BinghamtonBioHackyHours/Fall-2025-Hacky/refs/heads/main/Crash%20Course%20to%20R/data/feline-data.csv", destfile = "data/feline-data.csv")


download.file("https://raw.githubusercontent.com/BinghamtonBioHackyHours/Fall-2025-Hacky/refs/heads/main/Crash%20Course%20to%20R/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")



# First lets load in a data frame we can play with

cats <- read.csv("data/feline-data.csv")


##### Adding Rows ----------------

# Lets start by adding a new column, first we need to make a new vector


age <- c(2, 3, 5)
cats

# We can then add this as a column via:

cbind(cats, age)
cats

# Lets see what happens if we try to add a vector with an unequal number of elements and rows

age <- c(2, 3, 5, 12)
cbind(cats, age)

age <- c(2, 3)
cbind(cats, age)

# Why didn't this work? Of course, R wants to see one element in our new column for every row in the table:
  
nrow(cats)
length(age)

# So for it to work we need to make sure this is TRUE:
nrow(cats) == length(age)

# Lets fix it

age <- c(2, 3, 5)
nrow(cats) == length(age)
cats <- cbind(cats, age)
cats

# Now lets try to add a new row, same logic applies

newVector <- c("tortoiseshell", 3.3, TRUE, 9, 10)
cats <- rbind(cats, newVector)

newVector <- c("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newVector)

# We could add a list instead of a vector, this will work but it won't include elements over the number of columns 

newList <- list("tortoiseshell", 3.3, TRUE, 9, 10)
cats <- rbind(cats, newList)
cats

##### Removing rows ----------------

# We can print the data frame without the 4th row

cats[-4, ] # comma with nothing after it indicates we want to include all the columns


# Lets remove multiple rows by using a vector

cats[c(-2,-3), ]

cats <- read.csv("data/feline-data.csv") # reloading data
cbind(cats, age) # adding age again

##### Removing columns

# Lets print the data frame without the 4th column

cats[,-4] # comma with nothing before it indicates we want too keep all the rows

# We can remove columns by their name using the %in%. This goes through each element in the left argument "cats" and checks if it is '%in%' the second argument

drop <- names(cats) %in% c("age")

cats[,!drop] # here we are keeping the inverse of drop - !drop = TRUE TRUE TRUE FALSE

# There are more ways to do this, it all comes down to preference

##### Appending to a data frame ----------------

# It is good practice to consider that: columns are vectors | rows are lists

# Lets glue two data frames using rbind()

cats <- rbind(cats, cats)
cats

###############       Challenge 1        ################

# Using the help page for data.frame(), create a data frame that holds the following information

# First Name | Last Name | Lucky Number



# Then use rbind() to add the information of the person next to you
# Finally, use cbind() to add a column with each person answer to "Is it time for a coffee break?" ### Have this be a Boolean value

## Solution

df <- data.frame(first = c("Robbie"),
                 last = c("Dipi"),
                 lucky_number = c(5))
df <- rbind(df, list("Emily", "Yarboroughsgh", 42) )
df <- cbind(df, coffeetime = c(TRUE,TRUE))

##### Understanding our data ----------------

# Lets play around with a more realistic example

# Downloading directly from the web. The destfile argument specifies the target folder or directory from your working directory 'getwd()'

download.file("https://raw.githubusercontent.com/BinghamtonBioHackyHours/Fall-2025-Hacky/refs/heads/main/Crash%20Course%20to%20R/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")

# Load in the gapminder

gapminder <- read.csv("data/gapminder_data.csv")

# We can also load in data directly from the web without downloading it first

gapminder <- read.csv("https://raw.githubusercontent.com/BinghamtonBioHackyHours/Fall-2025-Hacky/refs/heads/main/Crash%20Course%20to%20R/data/gapminder_data.csv")

# Lets understand the data we are working with

str(gapminder)

# We can also use 'summary()'

summary(gapminder) # this gives us more detailed information about our data

# To investigate individual columns we can use 'class()'

class(gapminder$year)

# There are other functions that give us information on the types of objects we are working with: 'typeof()', 'mode()', 'storage.mode()'. For our purposes 'class()' does the job

# The dimensions of our data frame are important to know. Lets try to get its length:

length(gapminder) 


# Now lets use 'ncol()' and 'nrow()'

ncol(gapminder)
nrow(gapminder)

# Or both at once with 'dim()'

dim(gapminder)

# We may need to know the names of all our columns, lets get that using 'colnames()'

colnames(gapminder)


# Now it is important to ask ourselves if the data structure in R matches what we as humans expect to see. So lets look at the first few rows and see if they make sense

head(gapminder)

###############       Challenge 2        ################

# Its also very good practice to check the last few lines and some lines in the middle.

# Check the last 15 lines

# Checking a few lines in the middle specifically isn't hard given what we learned earlier, but how do look at a few lines at random?

# Randomly select and print 10 lines from the entire table


# Solution

tail(gapminder)
tail(gapminder, n = 15) # to be specific 

gapminder[sample(nrow(gapminder), 10), ]


###############       Challenge 3        ################


# Read the output of `str(gapminder)` again;

# This time, use what you've learned about lists and vectors, as well as the output of functions like `colnames` and `dim` to explain what everything that `str` prints out for gapminder means.

# If there are any parts you can't interpret, discuss with your neighbors!




# Solution 

# The object `gapminder` is a data frame with columns

# `country` and `continent` are character strings.
# `year` is an integer vector.
# `pop`, `lifeExp`, and `gdpPercap` are numeric vectors.



