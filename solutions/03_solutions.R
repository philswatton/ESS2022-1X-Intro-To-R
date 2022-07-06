# Exercise Solutions for File 03 ----

# 1) Get a summary of the 'redistribution' variable from the CHES dataset. Put
# the same variable through Psych's describe() function
summary(ches$redistribution)
describe(ches$redistribution)


# 2) Describe the redistribution variable by party for the German (country = 3)
# data in CHES. Feel free to use any mix of base R or tidyverse you want.

# Base R solution:
describeBy(ches[ches$country == 3,]$redistribution, group=ches[ches$country == 3,]$party)

# Tidyverse:
ches %>%
  filter(country == 3) |>
  select(redistribution, party) %>%
  describeBy(., .$party)

# Simpler mix of both:
chesDE <- ches %>% filter(country == 3)
describeBy(chesDE$redistribution, chesDE$party)


# 3) Read in the simpsons_episodes.csv file from the 'data' folder. Make
# a boxplot of the IMDB ratings variable in base R.
simpsons <- read.csv("data/simpsons_episodes.csv")
boxplot(simpsons$imdb_rating)


# 4) Make a scatter plot of IMDB ratings and season. Store the plot in an object.
myPlot <- ggplot(simpsons, aes(x=season, y=imdb_rating)) +
  geom_point()


# 5) Add a theme and a regression line to the object you just made - so if your
# object is called myPlot, myPlot + theme() will for instance work. I.e. you
# can keep adding to ggplots after you've stored them in an object! (note that
# this won't overwrite the object unless you assign it)

myPlot +
  geom_smooth(method = "lm") +
  theme_minimal()

