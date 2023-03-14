# Set target file location
setwd("C:/Users/aaa/git/mushroom")

# Create dataframe for machine learning 
mushroom_ml <- read.csv("gilled mushrooms.csv", sep = ",")

# View dataset
View(mushroom_ml)

# Remove distinct column veil.type

##library(dplyr)
##mushroom_ml %>% select(-veil.type)

mushroom_ml$veil.type <- NULL
View(mushroom_ml)

# Label Encoding categorical variables
mushroom_ml$cap.shape <- as.numeric(factor(mushroom_ml$cap.shape))
mushroom_ml
