### ISLRv2 - Statistical Learning Books Exercises ###

## Gareth James • Daniela Witten
## Trevor Hastie • Robert Tibshirani



### Chapter 3 - Linear Regression 

# Questions 

# What is simple linear regression
# Estimating coefficients 
# Assesing the Accuracy of the coefficient estimates. 
# Assesing the Accuracy of the model. 
# What is multiple linear regression
# Estimating the Regression Coefficients
# Qualitative Predictors
# Extensions of the Linear Model
# Potential Problems
# Comparison of Linear Regression with K-Nearest Neighbors


# # # Lab: Linear Regression # # #

library(MASS)
library(ISLR2)


# Linear Regression


# Understand the data

# The ISLR2 library contains the Boston data set, which records medv (median
# house value) for 506 census tracts in Boston. We will seek to predict
# medv using 12 predictors such as rm (average number of rooms perhouse),
# age (proportion of owner-occupied units built prior to 1940), and
# lstat (percent of households with low socioeconomic status).


# We will start by using the lm() function to fit a simple linear regression model, 
# with medv as the response and lstat as the predictor.

lm.fit <- lm(medv ~ lstat , data = Boston)

attach(Boston)

lm.fit <- lm(medv ~ lstat)

#If we type lm.fit, some basic information about the model is output.

lm.fit

# For more detailed information, we use summary(lm.fit). This gives us p values
# and standard errors for the coefficients, as well as the R2 statistic
# and F-statistic for the model.

summary(lm.fit)

names(lm.fit)

coef(lm.fit)

# In order to obtain a confidence interval for the coefficient estimates

confint(lm.fit)

# The predict() function can be used to produce confidence intervals and 
# prediction intervals for the prediction of medv for a given value of lstat.

predict(lm.fit , data.frame(lstat = (c(5, 10, 15))),
        interval = "confidence")



predict(lm.fit , data.frame(lstat = (c(5, 10, 15))),
        interval = "prediction")


# For instance, the 95 % confidence interval associated with a lstat value of
# 10 is (24.47, 25.63), and the 95 % prediction interval is (12.828, 37.28).

plot(lstat , medv)
abline(lm.fit)


# The abline() function can be used to draw any line, not just the least
# squares regression line. To draw a line with intercept a and slope b, we
# type abline(a, b)

abline(lm.fit , lwd = 3)
abline(lm.fit , lwd = 3, col = "red")

plot(lstat , medv , col = "red")
plot(lstat , medv , pch = 20)
plot(lstat , medv , pch = "+")
plot(1:20, 1:20, pch = 1:20)


# it is often convenient to view all four plots together.
# We can achieve this by using the par() and mfrow() functions, which tell R
# to split the display screen into separate panels so that multiple plots can
# be viewed simultaneously. 

par(mfrow = c(2, 2))
plot(lm.fit)

# Alternatively, we can compute the residuals from a linear regression fit
# using the residuals() function. The function rstudent() will return the
# studentized residuals, and we can use this function to plot the residuals
# against the fitted values.

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

# On the basis of the residual plots, there is some evidence of non-linearity.
# Leverage statistics can be computed for any number of predictors using the
# hatvalues() function.

plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

# The which.max() function identifies the index of the largest element of a vector. 
# In this case, it tells us which observation has the largest leverage which.max() statistic.


# # # Multiple Linear Regression # # #

# The syntax lm(y " x1 + x2 + x3) is used to
# fit a model with three predictors, x1, x2, and x3. The summary() function
# now outputs the regression coefficients for all the predictors.

lm.fit <- lm(medv ~ lstat + age , data = Boston)
summary(lm.fit)

# For all, we can use the following short-hand: 

lm.fit <- lm(medv ~ ., data = Boston)
summary(lm.fit)


# We can access the individual components of a summary object by name
# (type ?summary.lm to see what is available). Hence summary(lm.fit)$r.sq
# gives us the R2, and summary(lm.fit)$sigma gives us the RSE.

library(car)

vif(lm.fit)


# Except age 

lm.fit1 <- lm(medv~. - age, data = Boston)
# or
lm.fit1 <- update(lm.fit , ~ . - age)

# # # Interaction Terms # # #

