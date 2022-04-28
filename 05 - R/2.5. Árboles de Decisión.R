# Árboles de decisión
library("rpart")
library("rpart.plot")
data("iris")
iris
tree <- rpart(Species ~ ., data = iris, method = "class")
rpart.plot(tree)

tree

