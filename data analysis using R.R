# Change file location
setwd("C:/Users/aaa/git/mushroom")

# Read dataset and assign to a varible
mushroom <- read.csv("mushrooms.csv", sep = ",")

# View the dataset
View(mushroom)

# Create a new varible that only contains mushrooms that is edible
mushroom_edible = mushroom[mushroom$class == "e",]

# Check edible mushrooms
View(mushroom_edible)

#Change the values into more meaningful ones
library(dplyr)
mushroom <- mutate(mushroom,
                   class = factor(class,
                                  levels = c("e", "p"),
                                  labels = c("edible", "poisonous")
                                  )
                   )

mushroom <- mushroom %>%
  mutate(cap.shape = recode(cap.shape, "b" = "bell", "c" = "conical", "x" = "convex", 
                            "f" = "flat", "k" = "knobbed", "s" = "sunken"), 
         cap.surface = recode(cap.surface, "f" = "fibrous", "g" = "grooves", 
                              "y" = "scaly", "s" = "smooth"),
         cap.color = recode(cap.color, "n" = "brown", "b" = "buff", "c" = "cinnamon", 
                            "g" = "gray", "r" = "green", "p" = "pink", "u" = "purple",
                            "e" = "red", "w" = "white", "y" = "yellow"),
         bruises = recode(bruises, "t" = "true", "f" = "false"),
         odor = recode(odor, "a" = "almond", "l" = "anise", "c" = "creosote", 
                       "y" = "fishy", "f" = "foul", "m" = "musty", 
                       "n" = "none", "p" = "pungent", "s" = "spicy"),
         gill.attachment = recode(gill.attachment, "a" = "attached", "d" = "descending",
                                  "f" = "free", "n" = "notched"),
         gill.spacing = recode(gill.spacing, "c" = "close", "w" = "crowded", 
                               "d" = "distant"),
         gill.size = recode(gill.size, "b" = "broad", "n" = "narrow"),
         gill.color = recode(gill.color, "k" = "black", "n" = "brown", "b" = "buff", 
                             "h" = "chocolate", "g" = "gray", "r" = "green", 
                             "o" = "orange", "p" = "pink", "u" = "purple", "e" = "red", 
                             "w" = "white", "y" = "yellow"),
         stalk.shape = recode(stalk.shape, "e" = "enlarging", "t" = "tapering"),
         stalk.root = recode(stalk.root, "b" = "bulbous", "c" = "club", "u" = "cup", 
                             "e" = "equal", "z" = "rhizomorphs", 
                             "r" = "rooted", "?" = "missing"),
         stalk.surface.above.ring = recode(stalk.surface.above.ring, "f" = "fibrous",
                                           "y" = "scaly", "k" = "silky", "s" ="smooth"),
         stalk.surface.below.ring = recode(stalk.surface.below.ring, "f" = "fibrous",
                                           "y" = "scaly", "k" = "silky", "s" ="smooth"),
         stalk.color.above.ring = recode(stalk.color.above.ring, "n" = "brown", 
                                         "b" = "buff", "c" = "cinnamon", "g" = "gray", 
                                         "o" = "orange", "p" = "pink", "e" = "red",
                                         "w" = "white", "y" = "yellow"),
         stalk.color.below.ring = recode(stalk.color.below.ring, "n" = "brown", 
                                         "b" = "buff", "c" = "cinnamon", "g" = "gray", 
                                         "o" = "orange", "p" = "pink", "e" = "red",
                                         "w" = "white", "y" = "yellow"),
         veil.type = recode(veil.type, "p" = "partial", "u" = "universal"),
         veil.color = recode(veil.color, "n" = "brown", "o" = "orange", 
                             "w" = "white", "y" = "yellow"),
         ring.number = recode(ring.number, "n" = "none", "o" = "one", "t" = "two"),
         ring.type = recode(ring.type, "c" = "cobwebby", "e" = "evanescent",
                            "f" = "flaring", "l" = "large", "n" = "none",
                            "p" = "pendant", "s" = "sheathing", "z" = "zone"),
         spore.print.color = recode(spore.print.color, "k" = "black", "n" = "brown", 
                                    "b" = "buff", "h" = "chocolate", "r" = "green",
                                    "o" = "orange", "u" = "purple", "w" = "white", 
                                    "y" = "yellow"),
         population = recode(population, "a" = "abundant", "c" = "clustered", 
                             "n" = "numerous", "s" = "scattered", 
                             "v" = "several", "y" = "solitary"),
         habitat = recode(habitat, "g" = "grasses", "l" = "leaves", "m" = "meadows", 
                          "p" = "paths", "u" = "urban", "w" = "waste", "d" = "woods")
         )

# Check dataset
View(mushroom)

