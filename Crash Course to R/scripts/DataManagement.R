# Intro to data management ------
# In file explorer, make a new folder to house your project
# Make a new R project for every project of your own
# Add folders for data, figures, scripts
# Make a new blank script in "Scripts" folder
# Close RStudio, check that your new script appears in the Scripts folder in file explorer
# Locate your project in file explorer
getwd()
list.files("data/")


# Comments can be added using pound key, and sections are made by adding dashes to the end of comments
# Projects = self-contained worlds, so you don’t break code moving between computers.
# Keep raw data separate, if cleaned, save it as *_cleaned.csv


# Exploring built-in datasets ----
data()
data("iris")

# Exporting CSV file, then importing it ----
write.csv(iris, "data/iris.csv", row.names = FALSE)
typo <- read.csv("data/iris_typo.csv")

iris2 <- read.csv("data/iris.csv")


# Exploring data -----
names(iris2)
# What do you notice about column names? What types of characters can we use to name them? 
# Legal characters in variable names: _ . 
# Illegal characters: space, starting with a number, dashes

head(iris2)
# What does this function tell us about the data? What types of data are stored in the cells?
# Numbers, characters

dim(iris2)
# What are the dimensions of the data? Where else can you see this information?
# 150 rows, 5 variables
# Also visible in the environment tab

str(iris2)
# Structure function produces all this descriptive information at once

summary(iris2)
# Provides statistical summary of numerical categories