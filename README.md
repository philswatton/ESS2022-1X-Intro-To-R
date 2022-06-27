# ESS2022-1X-Intro-To-R

This is a repository for the class files I used in teaching the class 1X Introduction to R in the 2022 Essex Summer School's first session. The materials are largely the same as my 2X class from last year with some updates and error corrections.

The class covers the basics of getting started in R, including using scripts, using RStudio, using R projects to set the file path for a project, data types, R's data structures, importing data, managing datasets with dplyr, and some basic statistical tests and models.

Since this class is for a 6-hour crash-course, the emphasis is on covering enough ground that students can read helpfiles, stackexchange threads, complete other ESS courses, etc. To that end a lot of code is offered with a lot of comments covering both the basics of base R and the tidyverse.

The scripts are written in such a way as to be followed in order. The data folder contains all datasets expect the Chapel Hill Expert Survey (see below). The solutions folder contains code solutions for the exercises at the end of each file.


## Data

- match_players.csv
  - Dataset containing Age of Empires 2 match data - 1% of original observations
  - Source: https://www.kaggle.com/jerkeeler/age-of-empires-ii-de-match-data?select=matches.csv
  - Licence: https://creativecommons.org/licenses/by/4.0/
  - Dataset filtered from original using the following lines in R:

```
aoe <- read.csv("data/match_players.csv")
set.seed(42)
aoe <- aoe[as.logical(rbinom(nrow(aoe), 1, 0.01)),]
write.csv(aoe, "data/match_players.csv")
```

- 1999-2019_CHES_dataset_means(v3).dta
  - Chapel Hill Expert Survey Trend File 1999-2019
  - Source: https://www.chesdata.eu/ches-europe
  - Dataset not included in repo but accessible at above link

- avocado.csv
  - Dataset containing data on avocado prices
  - Source: https://www.kaggle.com/neuromusic/avocado-prices
  - Licence: https://opendatacommons.org/licenses/odbl/1-0/

- bestsellers with categories.csv
  - Dataset containing data on Amazon bestsellers
  - Source: https://www.kaggle.com/sootersaalu/amazon-top-50-bestselling-books-2009-2019
  - Licence: https://creativecommons.org/publicdomain/zero/1.0/

- simpsons_episodes.csv
  - Dataset containing data on Simpsons episodes
  - Source: https://www.kaggle.com/prashant111/the-simpsons-dataset
  - Licence: no licence listed


## Resources

- cheatsheets from https://www.rstudio.com/resources/cheatsheets/