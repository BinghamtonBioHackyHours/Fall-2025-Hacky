###### Introduction to loops in R (and a little bit of conditional statements) | Control Flow #####

## Much of this is taken from https://www.datacamp.com/tutorial/tutorial-on-loops-in-r

## Before we start I want to load in an image that will help us understand loops


##      CODE FOR DOWNLOADING IMAGE        ##

download.file("https://github.com/BinghamtonBioHackyHours/Fall-2025-Hacky/raw/refs/heads/main/Loops_in_R/loops.png", destfile = "data/loops.png", mode = "wb")


#install.packages('png')
library(png)
loops <- readPNG("data/loops.png", native = TRUE)
plot(0:1,0:1, type ='n', ann=FALSE, axes=FALSE)
rasterImage(loops,0,0,1,1)

#############################################

##### Objectives #####

# What are loops in programming

# For loops | While loops | Repeat loops

# Interruption and Exit loops

# Alternatives to loops in R


##### For loops #####

# Looking at this flowchart, notice that there are rectangles and diamonds. Rectangles represent a an action that "does not require a decision" while rectangles represent "questions" that have one of two outcomes: TRUE or FALSE

# So this first chart includes the init (initialization) box, the diamond decision box and the 'i1' box that is executed a known number of times, defined in the init box

# In this case, instructions from the init box are evaluated in the diamond. Does the variable 'v's current value belong in the sequence 'seq'

# If False, the loop ends and i1 never executes. If True, instruction or instructions i1 are executed after which the condition is evaluated again

# Lets take an example that finds the square of the first 10 elements in a vector:

v1 <- 1:30 # creating vector with numbers from 1 to 30

vsq <- c()

for (i in 1:10){
  # the i-th element of 'v1' squared into i-th position of vsq
  vsq[i] <- v1[i] * v1[i]
  print(vsq[i])
}



##### Nested for loop #####


# Now lets look at a loop within a loop (nested loops)

# Lets use nested for loops to print the adjective of each fruit

adjectives <- c('exotic', 'tasty', 'grotesque')

fruits <- c('apple', 'banana', 'cherry')
for (adj in adjectives){
  for (frt in fruits){
    print(paste(adj,frt))
  }
}

##### Challenge 1 #####

# Lets try to manipulate a bi-dimensional array by creating the multiplication table


# Select an integer

n <- 50

# Create a 'n' x 'n' matrix with zeros

my.mat <- matrix(0, n,n)

# For each row and column assign values based on position
# The values should be the product of the indexes
for (row in 1:dim(my.mat)[1]){
  for (col in 1:dim(my.mat)[2]){
    my.mat[row,col] <- row * col
  }
}


# There are two nested loops each with their own curly brackets, each with their own block governed by its own index.


# Using conditional statements, print the fist 10x10 chunk or the fist n x n chunk if n is less than 10

if (n > 10) {
  my.mat[1:10, 1:10]
} else {
  my.mat[1:n, 1:n]
}

##### While Loops #####

# For loops are great when the number of iterations is known, but what if there are certain conditions that are unknown before hand

# In the image, the middle shows a while loop flowchart. There is an initialization box followed by a condition. Generally the condition includes a comparison between a control variable and a value

# If the codition is FALSE, the loop never runs. If TRUE the i1 box runs followed by i2 which generally changes the control variable, otherwise we might be looking at an infinite loop. 

# Lets create a while loop that requires a specific value entered by the user in order to complete

user.int <- function(){
  n <- readline(prompt = 'Please, enter THE answer: ')
}

response <- as.integer(user.int())

while (response!=42) {   
  print("Sorry, the answer to THE question MUST be 42");
  response <- as.integer(user.int());
}

# This loops will keep repeating until the correct answer 42 is given


##### Repeat Loops #####

# On the far right is the repeat loop flowchart. This is similar to the while loop however you always have at least one iteration of i1 and i2 run before the conditional is asked. In this case also, the loop will continue while that condition is FALSE as opposed to the for loop, which ends when the condition is TRUE

# As an example lets rewrite the above while loop to be a repeat loop

user.int <- function(){
  n <- readline(prompt = 'Please, enter THE answer: ')
}

repeat {
  response <- as.integer(user.int());
  if(response == 42) {
    print("Correct!");
    break
  } else print("Sorry, the answer to THE question MUST be 42")
}

##### Interruption and Exit loops in R #####

# How do you exit a loop without it coming to a 'natural' end, so reaching the desired number of iterations in a for loop or meeting the condition in while and repeat loops


# Here is a simple example for break


x <- 1:5

for(val in x) {
  if(val ==3){
    break
  }
  print(val)
}

# What if we just want to skip the number 3 in the vector x (next)


for(val in x){
  if(val == 3){
    next
  }
  print(val)
}

##### Alternatives in R #####


# Vectorization - the process of converting repeated operations on simple numbers intro single operations on vectors or matrices

# Many of the loops we did above can be made implicit by using vectorization, which is built into R. Ultimately these also use loops but are hidden to the used and are generally faster than anything we write explicitly in R

# As an example, we have two vectors, v1 and v2, which we want to add element by element to create v3

# For loop

v1 <- c(3,4,5)
v2 <- c(3,4,6)
v3 <- c(0,0,0)
n = length(v1)

for (i in 1:n){
  v3[i] <- v1[i] + v2[i]
}
v3

# Or we can use the built in vectorization:

v3 <- v1 + v2
v3

# Example 2 | Computational Efficiency

# Below is an example of inefficiently changing values of a dataframe 

set.seed(42) # Same seed so results remain the same
m = 10
n = 10

# Create matrix of normal random numbers
mymat <- replicate(m, rnorm(n))

# Transform into data frame
mydframe <- data.frame(mymat)

for (i in 1:m) {
  for (j in 1:n) {
    mydframe[i, j] <- mydframe[i, j] + 10 * sin(0.75 * pi)
    print(mydframe)
  }
}

# Most of the execution time consists of executing and managing the loop. Lets look at a vectorized solution:

set.seed(42)
m = 10
n = 10
mymat <- replicate(m, rnorm(n))
mydframe1 <- data.frame(mymat)
mydframe1 <- mydframe1 + 10 * sin(0.75 * pi)
mydframe1

# Use system.time() to see the difference

# It may be a small difference with this small sample size but try changing the n and m to 100 or 1000


# Functions like rowSums(), colSums(), rowMeans(), and colMeans() are very neat and use vectorization to get information much more efficiently than writting separate for loops

# The apply() family of functions are really just hidden for loops

# apply() - apply a given function to rows (index=1) or columns (index=2)

# lapply() - apply a given function to every element of a list and return a list as a result

# sapply() - apply a given function to every element of a list but return a vector as a result

# Heres an example using apply()

my.mat <- matrix(rep(seq(5), 4), ncol = 5)

apply(my.mat, 1, sum) # apply sum() on rows of my.mat

apply(my.mat, 2, sum) # apply sum() on columns of my.mat

apply(mymat, 1, function(x, y)
  sum(x) + y, y = 4.5) # apply custom function that adds the number y = 4.5 to the sum
