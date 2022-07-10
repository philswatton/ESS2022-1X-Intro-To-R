# Essex Summer School in Social Science Data Analysis
# 1X Introduction to R
# Phil Swatton
# Sunday 7th July 2022, 11am-5pm BST
# File 05: extras


## Packages
library(tidyverse)
library(readstata13)
library(texreg)


## Data
ches <- read.dta13("data/1999-2019_CHES_dataset_means(v3).dta")


# 1 Writing Functions ----

# To write functions in R, we use the special function() function
# For example, if we want to calculate an arbitary root:

root <- function(x, r) {
  out <- x^(1/r)
  return(out)
}

# Here, we assign the output of function() to the name we want to
# give our new function.

# Inside the brackets of function(), we declare what the input
# variables will be called.

# Finally, we use the return() function to return the output
# from the function.

# Once we've assigned our function, we can use it:
root(27, 3)

# This is how R packages are made!





# 2 Loops ----

# Loops are a programming concept in every language. They're essentially
# an answer to the question "how do I avoid copy and paste?"

## 2.1 Base R loops ----

# The basic loop in R uses for():

for (i in 1:10) {
  print(i)
  Sys.sleep(0.5) #makes the loop wait half a second
}

# We create a variable called i in the bracket, which draws on
# the values in the vector after 'in'

# The loop then does its operation on each 'i' sequentially



## 2.2 Apply -----

# The apply family of functions is a quite powerful version of loops:
?apply

# Apply works on a dataframe or matrix. For example:
apply(ches |> select_if(is.numeric),
      MARGIN=2,
      FUN=mean,
      na.rm=T)

# It takes a dataframe as the first input.

# The margin specifies whether to apply the operation by row (1)
# or column (2).

# The fun argument takes a function as input. In this case, I supplied
# the mean function.
# The ... passes arguments to the function - in this case na.rm=T.

# lapply is the equivalent for lists:
?lapply



## 2.3 map ----

# The map family of functions is the tidyverse answer to 
# apply.

# For example, using map to create 3 dataframes and put them in a list:
countries <- c(3,6,11)
filter_country <- function(c) {
  out <- ches |> filter(country == c) |> select(party, year, lrgen, lrecon, eu_position, galtan)
  return(out)
}
map(countries, filter_country)



## 2.4 Use example ----

# Let's take that list of dataframes from earlier
df_list <- map(countries, filter_country)

# Let's now pass it through map again to make a list of regression results
m <- lrgen ~ lrecon + eu_position + galtan
result_list <- map(df_list, function (x) { #notice I'm writing my function INSIDE map this time!
  result <- lm(m, x)
  return(result)
})

# Pass the list to screenreg:
screenreg(result_list,
          custom.model.names = c("Germany", "France", "UK"))



