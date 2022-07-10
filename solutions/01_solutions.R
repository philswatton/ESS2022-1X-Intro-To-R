# Exercise Solutions for File 01 ----

# 1) Create a vector of even numbers ranging from 2 to 100 and store it in
# an object
myVec1 <- seq(2, 100, 2)


# 2) Create another vector ranging from 1 to 50 and store it in an object
myVec2 <- 1:50


# 3) Run the below lines of code. Put the 'binary' vector along with the 
# two vectors you just made in a data frame
set.seed(42)
binary <- rbinom(50, 1, 0.5)
myData <- data.frame(binary, myVec1, myVec2)


# 4) Filter the data frame you just made for rows where the binary variable is
# equal to 1. Store the output in a new object
myData2 <- myData[myData$binary == 1,]


# 5) Pull the first vector you made in question 1 out of the object from question 4. 
# Try doing this with both the $ operator and doubled-up square brackets [[]]
myData2$myVec1
myData2[["myVec1"]]