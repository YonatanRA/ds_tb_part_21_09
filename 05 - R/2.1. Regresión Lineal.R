# Regresión Lineal de una variable
data(cars) # Contiene datos de velocidad y distancia de frenado de una serie de coches
head(cars)

plot(cars$speed, cars$dist)
cor.test(cars$speed, cars$dist)

modelo <- lm(dist ~ speed, data=cars) # Distance = 3.9324*Speed + (-17.5791)
summary(modelo)
abline(modelo$coefficients[1],modelo$coefficients[2],col="red")


# Predicción
predict(modelo, data.frame(speed=10))

# Function for Root Mean Squared Error (RMSE)
RMSE <- function(res){
  sqrt(mean(res^2))
}

RMSE(modelo$residuals)

# Function for Mean Absolute Error
MAE <- function(res){
  mean(abs(res))
}
MAE(modelo$residuals)

pr <- predict(modelo,cars)
plot(pr,cars$dist)
abline(0,1,col='red')
cor(pr,cars$dist)

# Regresión lineal de varias variables
install.packages("carData")
library(carData)
data(Salaries)
head(Salaries)

modelo2 <- lm(salary~sex, data=Salaries)
summary(modelo2)

modelo2 <- lm(salary~. ,data=Salaries)
summary(modelo2)

# Predicción
predict(modelo2,data.frame(rank="Prof",
                           discipline="A",
                           yrs.since.phd=20,
                           yrs.service=20,
                           sex="Female"))

