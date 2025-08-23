
# Introduction to R and RStudio Fall 2025 ---------------------------------

##Goals----------------
#Understand each panel in RStudio
#Become comfortable with different buttons/options in RStudio
#Define variables
#Assign data to a variable
#Learn about mathematical and comparison operators
#Learn how/where to look for help
#Learn how to call functions
#Learn how to install packages

##Before we start------------------

#make sure you have the latest versions of R and RStudio installed on your laptop. Let us know if you need help with this!

##Why we love R (okay, maybe I'm a little biased...)------

#You could use spreadsheets from Excel or Google sheets to do your data analysis, but here's why that isn't always the best idea:
#Sometimes what you want/need to do isn't very easy/accessible on a spreadsheet
#You can't easily share the steps of your analysis
#You want your data to be accessible and reproducible, and R and RStudio are a free, open-source way in which you can do that!

##Running R and RStudio --------

#You can run R on its' own, but RStudio is an "Integrated Development Environment" that makes it a little easier to use. It comes with a lot of advantages (like projects!) that we'll learn about throughout this workshop

## The Basic Layout of RStudio-------------

#When you first open RStudio, you should see 4 panels:
#The Editor Panel (I just call it my script): Top left corner (That's what you're reading this in right now!)
#The Console: this will be on the bottom left (you can also type functions in there)
#The Global Environment: This will be on the top right. Currently, it should say your "Environment is empty"
#The File/Plots/Packages/Help/Viewer panel: This will be on the bottom right (There's a lot here. Don't worry, we'll unpack it in a bit)

##A note about scripts vs. console: ---------------
#Anything you write in a script can be saved so you can re-open and run it again whenever you need to. These files will be .R files in your browser
#Anything you write in the console will disappear when you close your R session. Make sure you are saving anything you want to keep in a script!

## Getting Started with R --------------

#The easiest thing you can do in R is use it as a calculator. Let's take a look at some examples:
#Addition


#What happens if you type in an incomplete command?

#Notice how the script gives you a warning with a red X? Similarly, take a look at the console. You'll see a '+' instead of a '>'. This is a sign that RStudio is waiting for you to finish the command. In order to fix this, click into the console and hit the "esc" key and you'll be good to go!

#When you use R as a calculator, the order of operations will follow PEMDAS:
#Parentheses: (, )
#Exponents: ^ or **
# Multiply: *
#Divide: /
#Add: +
#Subtract: -

#A few examples


##Mathematical functions: ------------

#R has lots of built in functions that you can use. To use a function, you type in the function name followed by (). Anything that you type inside of the function is considered an argument. Some functions won't require any arguments, and others will require a bunch.

#Let's start by identifying what working directory we are in:

#This produces a path in the console to where all of my files will be saved. This will not look the same for your computer, so make sure you are paying attention to where you are saving your files. You'll also notice this function doesn't require any arguments!

#Let's try some mathematical functions
#add mean and stdev

##NOTE: I have no idea how many functions there are in R, but you'll never be able to remember them all! Thankfully, there are tons of resources where you can look for help. We'll take a look at some of them toward the end of this!

##Comparing Things:---------------

#We can also use operators to compare things in R.

#Checking if something "is equal to" something else

#This will give you a T/F output

#Checking if something "is not equal to" something else


#Checking if something "is less than" something else


#Checking if something "is less than or equal to" something else



##Variables and assignment operators: ------------------

#We can store values in variables using the assignment operator '<-".

#After you run this, take a look at your environment. You should see 'x' listed as a value. This is how you know you were successful in storing your value as an object in R.

#If you want to print your value, try just typing in 'x'


#NOTE: case matters! What happens if you type in 'X"

#You'll get an error message that 'X' is not found. Keep this in mind while you code, and try to keep your case consistent!

#Overwriting values:
#Say you don't want x to be 25 anymore. All you have to do is rewrite your code and store a new value. Try storing whatever you'd like!

#This should update the value stored in your environment

#A note about variable names:
##Your variable name can have letters, numbers, underscores, and periods. What it can't have is spaces. If you start a variable with a period, it will create a hidden variable. You also cannot start a variable with a number. Keep this in mind as you name things in R!

##Vectors: ---------------------

#R is 'vectorized'. This just means that variables and functions can have vectors as values. In this case, a vector is the most common data structure in R. They are a collection of values that are all the same type, and can be characters, logical, integers, or numeric. Let's take a look:


## Managing your Environment --------------------

#The function ls() will display anything you have stored in your environment

#What happens if we type 'ls' without parentheses?

#'ls' is the name of an object in R. When we type out the name without the parentheses, we are getting a look at the contents of the object!

#What happens if you want to delete a specific object? You can use the 'rm()' function
#Let's try deleting 'x'

#Take a look at your global environment - 'x' should be gone!

##Packages in R: ---------------

#So far, we have just been coding in base R. Essentially, we've just been using functions that come with R when you download it. You can add other functions by either writing them yourself, or by installing packages other folks have made. Let's try installing a package you'll likely use for plotting one day!


#Note: if you have trouble with this package, try typing in: install.packages("ggplot2", dependencies = TRUE)

#To use the functions stored in this package, you'll need to 'library' it in.


##Getting help in R ---------------

#Help files:

#R and all of it's packages have help files for the different functions. There are a few different ways to do this in RStudio. Let's take a look at them:


#This will open up the "help" tab in the bottom right panel. You can also click into this manually and type in the function you are looking for in the search bar. 
#This will provide you with a description of the function, any arguments you might need/use, and examples of how to use the function.

##NOTE: some functions will take you to the same help page, so make sure you are reading things carefully! Example:


#NOTE: You can also do this for assignment operators!


##Getting help with packages:
#Packages will come with 'vignettes' or tutorials that will have extended documentation. Try typing in "vignette()" without any arguments

#This will list all vignettes for your installed packages

#you can also use vignette(package="package-name") to get all vignettes for a single package, and vignette("vignette-name") for a specific vignette


#What happens if you only remember part of the function name?
#In this case, you can do something called a 'fuzzy search'. For example, you might remember that the function you are looking for has 'set' in its' name. If you type in '??set' this will run your fuzzy search

#This output can be a little overwhelming at times. If that is the case, there are other places to get help.

#Your biggest asset is going to be Google. If you're looking for a particular package, function, or want to decode an error message, just type (or copy-paste) it into the search bar. It's likely someone else has had the same problem as you!
#Websites like StackOverflow will be really helpful in this instance. This is where folks type out their questions and have them answered by other coders. This is another great thing about R - it has a pretty big community of folks that are generally willing to help!

#Let's chat real quick about AI (We are going to have a full Hacky Hour on this later)
#You can also turn to AI for help, but we caution you to take everything it gives you with a grain of salt. Oftentimes, unless your question is VERY specific, it either won't give you the correct answer, or it will give you a very complicated, roundabout way of finding the answer. You also want to ask yourself what you will remember/understand better: the answer that you found yourself by doing your own research, or the answer that was given to you by AI. You are responsible for all the code you use to analyze/publish your data, so keep that in mind as you choose where you go for help.

#Extra: If you want to play around more with R and R Studio, Swirl is an interactive module you can download that helps you get familiar with syntax/key functions in R. Here's the link: https://swirlstats.com/students.html


# Example Problems --------------------------------------------------------------

#Which of the following are examples of valid R variable names?:
# min.length
# height
# .period
# 2good2betrue
# _time
# iLoveCoding
# Hacky Hours Rocks

#What are the variables from each of the following lines of code?


#Based on the previous question, write a command to compare time to z. Is time less than z?


#Clean up your working environment by removing the y and z variables


#Install and library in the following packages: dplyr, lmer, tidyverse

#Look at the help page for the 'c()' function.


#What types of vectors are you creating when you run the following lines of code?


#Look at the help page for the 'paste()' function. What does the 'sep = ' argument do?

