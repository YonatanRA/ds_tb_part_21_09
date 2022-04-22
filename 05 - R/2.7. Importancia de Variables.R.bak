# Importancia de variables

data(mtcars)
mtcars

# Utilizando random forest
install.packages("randomForest")
library(randomForest)
model <- randomForest(mpg ~ ., data=mtcars, ntree=1000)

importance(model)
varImpPlot(model)

# Utilizando el método Boruta
install.packages("Boruta")
library(Boruta)

# Creamos una columna con datos aleatorios para comprobar que algoritmo detecte que no es importante
mtcars$new <- runif(nrow(mtcars),0,1)

boruta_output <- Boruta(mpg ~ ., data=mtcars, doTrace=2, maxRuns = 50)  # Método Boruta
boruta_signif<- names(boruta_output$finalDecision[boruta_output$finalDecision %in% c("Confirmed", "Tentative")])  

boruta_output$finalDecision
print(boruta_signif)  # significant variables

plot(boruta_output, las=2, xlab="", main="Variable Importance")  # Plot de la importancia de variables
