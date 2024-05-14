### ISLRv2 - Statistical Learning Books Exercises ###

## Gareth James • Daniela Witten
## Trevor Hastie • Robert Tibshirani



### Chapter 2 - Statistical Learning 

# Questions 

# Why estimate f?
# How do we estimate f? 
# Tradoff between Accuracy and Interpretablity
# Supervised Versus Unsupervised 
# Measuring the Quality of Fit
# The Bias-Variance Trade-Off


### LAB: Introduction to R  ###


# Basic Commands 


x <- c(1,2,3)
x

# we can use = rather than <- 

y = c(3,5,7)
y

# ?funcname will open a new window and give information about the function

?table


# The ls() function allows us to look at a list of all of the objects,
# such as data and functions, that we have saved so far.

ls()

# The rm() function can be used to delete any that we don’t want.

rm(x,y)

## Environment is empty right now. 

ls()  #it will give char(0)

# It’s also possible to remove all objects at once:

rm(list = ls())


# The matrix() function can be used to create a matrix of numbers.

x <- matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)
x

y <- matrix(data = c(1,2,3,4,5,6,7,8), nrow = 2, ncol = 4 )
y

z <- matrix(data = c(1,2,3,4,5,6,7,8), 4, 2, byrow = TRUE)
z


# The sqrt() function returns the square root of each element of a vector or matrix.

sqrt(z)

# The command x^2 raises each element of x to the power 2; any powers are possible,
# including fractional or negative powers.

z^2

# The rnorm() function generates a vector of random normal variables,
# with first argument n the sample size.

# And 

# Here we create two correlated sets of numbers,
# x and y, and use the cor() function to compute the correlation between them.

x <- rnorm(50)
y <- x + rnorm(50, mean = 50, sd = 0.1)

cor(x,y)

# By default, rnorm() creates standard normal random variables with a mean
# of 0 and a standard deviation of 1. However, the mean and standard deviation
# can be altered using the mean and sd arguments

# Sometimes we want our code to reproduce the exact same set of random
# numbers; we can use the set.seed() function to do this. The set.seed() 
# function takes an (arbitrary) integer argument.

set.seed(1303)
rnorm(50)

##  -1.1439763145  1.3421293656  2.1853904757


set.seed(1223)
rnorm(50)

## 0.329105065 -0.443831601 -0.873139342

set.seed(1)
rnorm(50)

## -0.62645381  0.18364332 -0.83562861


# The mean() and var() functions can be used to compute the mean and 
# variance of a vector of numbers.

# Applying sqrt() to the output of var() will give the standard deviation.
# Or we can simply use the sd() function.

set.seed(3)
y <- rnorm(100)
mean(y) #0.0110
var(y) #0.7328
sqrt(var(y)) #0.8560
sd(y) #0.8560


# # # Graphics # # #

# The plot() function is the primary way to plot data in R. 
# For instance, plot() plot(x, y) produces a scatterplot of the numbers in x versus the numbers in y.

x <- rnorm(100)
y <- rnorm(100)

plot(x,y)

plot(x, y, xlab ="this is the x-axis",
     ylab = "this is the y-axis",
     main = "Plot of X vs Y")

# The command that we use to do this will depend on the file type that we would like to create. 
# For instance, to create a pdf, we use the pdf() function, and to create a jpeg, we use the jpeg() 
# function.

pdf("Figure.pdf")
plot(x, y, col  = "green")
dev.off()


# we can also use jpeg() function. 
# The function dev.off() indicates to R that we are done creating the plot.



# The function seq() can be used to create a sequence of numbers.
# For instance, seq(a, b) makes a vector of integers between a and b.


x <- seq(1,10)
y <- seq (0,1, length = 10)

x <- seq(-pi, pi, length = 50)



# We will now create some more sophisticated plots. 
# The contour() function produces a contour plot in order to represent three-dimensional data; 
# contour() it is like a topographical map. It takes three arguments:

y <- x

f <- outer(x, y, function(x,y) cos(y) / (1+x^2))
contour(x, y, f)
contour(x, y, f, nlevels = 45, add = T)

fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)

# The image() function works the same way as contour(), 
# except that it produces a color-coded plot whose colors depend on the z value.
# This is known as a heatmap. 

# Alternatively, persp() can be used to produce a three-dimensional plot. 
# The arguments theta and phi control the angles at which the plot is viewed.


image(x, y, fa)
persp(x, y, fa)
persp(x, y, fa, theta = 30)
persp(x, y, fa, theta = 30, phi = 20)
persp(x, y, fa, theta = 30, phi = 70)
persp(x, y, fa, theta = 30, phi = 40)


# # # Indexing Data # # #


# We often wish to examine part of a set of data. 
# Suppose that our data is stored in the matrix A.


A <- matrix(1:16, 4, 4)
A
A[2,3]


A[c(1,3), c(2,4)]
A[1:3, 2:4]

A[1,]

# The dim() function outputs the number of rows followed by the number of columns of a given matrix.

dim(A)



# # # Loading Data # # #

#The read.table() function is one of the primary ways to do this.
# We can use the function write.table() to export data.
install.packages("ISLR2")
library(ISLR2)

Auto
View(Auto)
head(Auto)

# Note : It is often a good idea to view a data set using a
# text editor or other software such as Excel before loading it into R.

# The stringsAsFactors = T argument tells R that any variable containing
# character strings should be interpreted as a qualitative variable, and that
# each distinct character string represents a distinct level for that qualitative variable.

dim(Auto) 
# 392 observations or rows, nine variables or columns. 

# There are various ways to deal with the missing data. 
# In this case, only five of the rows contain missing observations, and
# so we choose to use the na.omit() function to simply remove these rows.
 
Auto <- na.omit(Auto)
dim(Auto)

# Once the data are loaded correctly, we can use names() to check the variable names.

names(Auto)

# # # Additional Graphical and Numerical Summaries # # #
 
# We can use the plot() function to produce scatterplots of the quantitative variables. 
# However, simply typing the variable names will produce an error message, 
# because R does not know to look in the Auto data set for those variables.

plot(cylinders, mpg)

plot(Auto$cylinders, Auto$mpg)


attach(Auto)

plot(cylinders, mpg)


# The cylinders variable is stored as a numeric vector, so R has treated it
# as quantitative. However, since there are only a small number of possible
# values for cylinders, one may prefer to treat it as a qualitative variable.
# The as.factor() function converts quantitative variables into qualitative variables.

cylinders <- as.factor(cylinders)

# If the variable plotted on the x-axis is qualitative, 
# then boxplots will automatically be produced by the plot() function. 
# As usual, a number of options can be specified in order to customize the plots.

plot(cylinders , mpg)
plot(cylinders , mpg , col = "red")
plot(cylinders , mpg , col = "red", varwidth = T)

plot(cylinders , mpg , col = "red", varwidth = T,
     horizontal = T)
plot(cylinders , mpg , col = "red", varwidth = T,
       xlab = "cylinders", ylab = "MPG")


# The hist() function can be used to plot a histogram. 
# Note that col = 2 has the same effect as col = "red".

hist(mpg)
hist(mpg , col = 2)
hist(mpg , col = 2, breaks = 15)

# The pairs() function creates a scatterplot matrix, i.e. a scatterplot for every
# pair of variables. We can also produce scatterplots for just a subset of the variables.

pairs(Auto)
pairs(
  ~ mpg + displacement + horsepower + weight + acceleration ,
  data = Auto
)


# In conjunction with the plot() function, identify() provides a useful 
# interactive method for identifying the value of a particular variable for points on a plot.

plot(horsepower , mpg)
identify(horsepower , mpg , name)

summary(Auto)

summary(Auto$mpg)










