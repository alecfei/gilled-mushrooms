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
head(mushroom_ml)

# Summary of the dataset
summary(mushroom_ml)

# Check the types of the variables
#sapply(mushroom_ml, class)
str(mushroom_ml)

# Check numbers of rows and columns
dim(mushroom_ml)
for (col in colnames(mushroom_ml)){
  mushroom_ml[[col]] <- as.factor(mushroom_ml[[col]])
}
#mushroom_ml$classes <- as.factor(mushroom_ml$classes)

str(mushroom_ml)
# Machine learning using Random Forest
#install.packages("randomForest")
#install.packages("caTools")
#install.packages("cowplot")
library(randomForest)
library(caTools)
library(ggplot2)
library(cowplot)

## Set seed
set.seed(42)

## Create model
model <- randomForest(classes ~ ., data = mushroom_ml,
                      proximity = TRUE)
model


## Split the dataset into train and test sets
split <- sample.split(mushroom_ml, SplitRatio = 0.75)
split
train <- subset(mushroom_ml, split == "TRUE")
test <- subset(mushroom_ml, split == "FALSE")

# Fitting Random Forest to the train dataset
rf <- randomForest(x = train[-1],
                   y = train$classes,
                   ntree = 500)
rf

# Predicting the Test set results
y_pred = predict(rf, newdata = test[-1])

# Confusion Matrix
confusion_mtx = table(test[, 1], y_pred)
confusion_mtx

# Plotting model
plot(rf)

# Importance plot
importance(rf)

# Variable importance plot
varImpPlot(rf)


# Label Encoding categorical variables

##mushroom_ml$cap.shape <- as.numeric(factor(mushroom_ml$cap.shape))
##mushroom_ml
#install.packages("CatEncoders")
library(dplyr)
library(CatEncoders)

# Select the independent variables and encode
X <- select(mushroom_ml, 2:22)
X

## Create a loop to initiate encoding
for (col in colnames(X)){
  encoder <- LabelEncoder.fit(X[[col]])
  X[[col]] <- transform(encoder, X[[col]])
}
View(X)

# Select the dependent variable
#y <- mushroom_ml$classes
y <- select(mushroom_ml, classes)
View(y)


