# simulate from a Normal(0, 5)


# what does this look like? What is the mean? What is the variance?



# Let's say x causes some other variable (let's call it y) that we are interested in and we
# want to model this process. (draw a dag on the whiteboard). If we assume that 
# that y comes is normally distributed around some function of x with errors that come from a # normal distribution with mean 0 and standard deviation sigma, we can write our model as:
#
# y ~ N(f(x), sigma)
# x ~ N(0, 5)
#
# If f(x) := a + b*x we have the standard linear model:
#
# y ~ N(f(x), sigma)
# f(x) = a + b*x
# x ~ N(0, 5)
#
# let a = .5, b = .5, and sigma = 5. Simulate 100 observations from our model.




# plot the relationship between x and y



# run a linear model 



# we see our a is the intercept, b is the slope on x, and our sigma is the residual standard error.


# Challenge ---------------------------------------------------------------

# Simulate 100 observations from the following model:
#
# y ~ N(f(x), sigma)
# f(x) ~ a + b*x
# x ~ Exponential(rate = 1/20)
#
# lets make a = 3, b = 2 and sigma = 1




# what does our data y look like?



# y is clearly not normal, can we use a regular linear model for it?



# Multiple Variables ------------------------------------------------------

# now let's add multiple variables, let's say that y is a function of x and z, and that 
# x and z are independent of each other. Let's say x comes from a normal(0,1) and z comes from an Binomial(1,.5) (i.e. a Bernoulli(.5))
#
# y ~ N(f(x,z), sigma)
# f(x,z) = a + b1*x + b2*z
# x ~ N(0,1)
# z ~ Bern(.5)
#
# a = 1, b1 = 1.5, b2 = -.5 and sigma = 1.
#
# Simulate it










# Multiple Variables--But with dependence!! -------------------------------

# we again have x and z predicting y, but with a complication! z is also a function of x. (draw on board). So our model looks something like this:
#
# y ~ N(f(x,z), sigma)
# f(x,z) = a + b1*x + b2*z
# z ~ N(g(x), sigma2)
# g(x) = a2 + b3*x
# x ~ N(0, 1)
#
# set all the parameters to 1 and simulate it!







# We know what the true data generating process, but how do we correctly estimate the parameters for this model? Enthralling discussion ensues.



# Logistic Regression -----------------------------------------------------

# in biology we often have variables that take on binary outcomes. Did my plant survive (yes/no). Did I observe this species (oui/non), etc. We will tend to model these events using a generalized linear model called logistic regression. We want to keep using our nice linear machinery to model our outcomes, but somehow also use the 0-1 probability space that feels natural with binary outcomes. So we must turn to the inverse logit function.

# say we have a predictor x that ranges from -10 to 10. Imagine we have a linear model relating x to our binary outcome y, we first predict some intermediate thing, called the log odds, then go from log odds to probability.

# so if our linear model is .5 + .5*x, our log odds outcomes would be
curve(.5 + .5*x, -10,10, lwd = 3)

# nice and linear, but it goes outside of 0, and 1 where our probabilities lie, so we use the inverse logit function (plogis in r) to map our log odds onto a 0-1 space.
curve(plogis(.5 + .5*x),-10, 10, lwd = 3)


# Challenge: Too logit to quit (shamefully stolen joke) -------------------

# simulate from the following model
#
# y ~ Bernoulli(f(x))
# f(x) = inv_logit(a + b*x)
# x ~ N(0,1)
#
# a = 1 b = 2







# how to interpret the output from logistic regression?