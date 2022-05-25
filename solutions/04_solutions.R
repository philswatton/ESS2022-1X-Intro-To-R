# Exercise Solutions for File 04 ----

# 1) Run a t-test on the mean user rating in the books data frame.
t.test(books$User.Rating)


# 2) Run another t-test, this time testing the difference in mean price between
# fiction and non-fiction books. Feel free to use either Base R or the tidyverse.

# Base R:
t.test(books$Price[books$Genre == "Non Fiction"],
       books$Price[books$Genre == "Fiction"])

# Tidyverse:
t.test(books %>% filter(Genre == "Non Fiction") %>% select(Price),
       books %>% filter(Genre == "Fiction") %>% select(Price))


# 3) Read in the simpsons_episodes.csv file from the data folder and store
# it in an object. Build and run an OLS model regressing IMDB rating on season.
# Store the result in an object.
simpsons <- read.csv("data/simpsons_episodes.csv")
simpsonsModel1 <- imdb_rating ~ season
simpsonsResult1 <- lm(simpsonsModel1, simpsons)


# 4) Run another model regressing IMDB rating on both season and views. Store
# this in another object.
simpsonsModel2 <- imdb_rating ~ season + views
simpsonsResult2 <- lm(simpsonsModel2, simpsons)


# 5) Print out the results from questions 3 and 4 next to each other using
# screenreg(). If you're feeling brave, check out the help file and try to
# customise the output.
simpsonsModels <- list(simpsonsResult1, simpsonsResult2)
screenreg(simpsonsModels)
screenreg(simpsonsModels,
          custom.coef.names = c("Intercept", "Season", "Views"))

