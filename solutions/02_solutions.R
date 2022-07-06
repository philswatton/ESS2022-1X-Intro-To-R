# Exercise Solutions for File 02 ----

# 1) read in the simpsons_episodes.csv file from the 'data' folder and store it in
# an object. Take a moment to explore it (hint - names and str will be useful
# here)
simpsons <- read.csv("data/simpsons_episodes.csv")
names(simpsons)
str(simpsons)


# 2) make a vector denoting whether the IMBD rating for an episode is above 8.
# try to do this using both base R and the tidyverse.
ifelse(simpsons$imdb_rating > 8, 1, 0)
case_when(simpsons$imdb_rating > 8 ~ 1,
          simpsons$imfb_rating <= 8 ~ 0)


# 3) Filter for the first ten season and select, IMDB ratings, episode id, season
# number, title, and view number. Try to do it with both base R and the tidyverse.
# Store the output in a new object.
simpsons10 <- simpsons[simpsons$season <= 10, c("imdb_rating", "id", "season", "title", "views")]
simpsons10 <- simpsons |>
  filter(season <= 10) |>
  select(imdb_rating, id, season, title, views)


# 4) In this object, create a new variable showing the rating per views. Try doing
# this with both base R and the tidyverse.
simpsons10$ratingPerViews <- simpsons10$imdb_rating / simpsons10$views
simpsons10 <- simpsons10 |>
  mutate(ratingPerViews = imdb_rating / views)


# 5) Check out the write.csv function. Save the data frame you've ended up with
# after question 4 in the 'data' folder UNDER A DIFFERENT NAME! For example,
# simpsons10.csv.
?write.csv
write.csv(simpsons10, "data/simpsons10.csv")

