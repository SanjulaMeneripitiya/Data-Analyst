# Preparing Data for Classification
library(dplyr)

# What data set gonna use?
help("iris")

# How is it structured?
glimpse(iris)

# Are there any missing values?
anyNA(iris)

# What doe it look like?
plot(iris$Petal.Length,
     iris$Petal.Width,
     pch = c(21,21,23)[unclass(iris$Species)],
     bg = c("red", "green", "blue")[unclass(iris$Species)])

iris %>% group_by(Species) %>%
  summarise(max_petal_length = max(Petal.Length)) %>%
  arrange(-max(max_petal_length))

# Splitting Dataset for training and testing
set.seed(111)
iris_training <- iris %>% sample_frac(0.80)
iris_test <- iris %>% setdiff(iris_training)

# Creating decision tree using rpart
library(rpart)

iris_tree <- rpart(Species~ Petal.Length + Petal.Width,
                   data = iris_training,
                   method = "class")


plot(iris_tree, uniform = TRUE, margin = 0.5)
text(iris_tree, use.n = TRUE)


# Testing

iris_test["Prediction"] <- predict(iris_tree, iris_test, type = "class")
iris_test

# Using Ctree to perform Decision tree.
library(party)

set.seed(11)

iris_tree2 <- ctree(Species~ Petal.Length + Petal.Width,
                    data = iris_training)

plot(iris_tree2)


iris_test["Prediction"] <- predict(iris_tree2, iris_test)
iris_test

predict(iris_tree2, iris_test, type = "prob")


# Clustering Data Preparation

unlabled_data <- iris %>% 
  select(-Species)

head(unlabled_data)

pairs(unlabled_data)

# Kmeans Clustering
set.seed(111)

iris_cluster <- kmeans(unlabled_data, centers = 3)
table(iris_cluster$cluster, iris$Species)


plot(unlabled_data$Petal.Length,
     unlabled_data$Petal.Width,
     pch = c(21,21,23)[unclass(iris_cluster$cluster)],
     bg = c("red", "green", "blue")[iris_cluster$cluster])


# Hierarchical Clustering
set.seed(111)

unlabled_data2 <- iris %>%
  select(Petal.Length, Petal.Width)

iris_hierarchy <- hclust(dist(unlabled_data2),
                         method = "centroid")
plot(iris_hierarchy)


iris_clust <- cutree(iris_hierarchy,3)
table(iris_clust, iris$Species)


plot(unlabled_data$Petal.Length,
     unlabled_data$Petal.Width,
     pch = c(21,21,23)[iris_clust],
     bg = c("red", "green", "blue")[iris_clust])
