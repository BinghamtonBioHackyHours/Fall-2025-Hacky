# Goals
# understand data types
# understand vectors and data frames
# start to explore these structures

# this script was based on the carpentries "data structures" module: https://swcarpentry.github.io/r-novice-gapminder/04-data-structures-part1.html

# Data Structures ---------------------------------------------------------

# make 3 vectors with coat colors, weights, and whether or not the cat likes catnip





# now put these vectors into a data frame





# now write this data frame to a csv file






# read in the feline data csv






# explore the data frame, look at the weight variable






# now coat






## we can do operations on the columns, let's say we find that the scale is 2 pounds light
## let's fix it





## paste together "My cat is " with the coat color






# what if the cats belong to Emily, Jules and Rob, what are the colors of their cats?







# what if we try to add the weight and the coat together?






# why this error






# we get information on a new cat







# let's make a new data frame, cats2 that has the new cat





# what is the class of weight now?





# can we add to the weight now?






# what is the structure of cats2?




# what happens when we combine the original vectors, what is the resulting class?







# there is a hierarchy logical > integer > numeric/double > complex > character








# what is the class when we combine log_vec and int_vec, what about int_vec and num_vec, what about anything combined with chr_vec?







# it is sometimes possible to force a vector into another type








# can we coerce cats2$weight to be numeric? kinda





# so it is numeric now, but what happened to that weird entry? R didn't know how to make it numeric, so it converted it into an NA, NAs are something that need to be payed attention to!!

## Time for a challenge!!!



# ok so we have been making vectors all along without really talking much about it,
# let's be more explicit.

# we can use the combine function to make vectors





# we can even use c() to combine vectors together with other vectors/values





# we can make a series of numbers using ":"





# we can use the seq() function to generate sequences





# we can get information about our objects






# we can access elements of an object using bracket notation, let's get the first element of my_seq





# we can also use this notation to replace elements





## Challenge 2: create a vector of numbers from 1 to 26 and multiply it by 2



# let's talk about data frames
# let's start with looking at cats again






# let's look at just the first column, there are a couple ways that we can do this. In a data frame, each column is a variable

# using the "show me the money" symbol




# or using bracket notation




# what is the class of the first column?





# now let's look at the first row. In a data frame, each row is an observation.




# There are several subtly different ways to call variables, observations and elements from data.frames:
#   
# cats[1]
# cats[[1]]
# cats$coat
# cats["coat"]
# cats[1, 1]
# cats[, 1]
# cats[1, ]
# Try out these examples and explain what is returned by each one.