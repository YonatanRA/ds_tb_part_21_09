set.seed(500)

# Carga de datos
library(MASS)
data <- Boston
# CRIM: tasa de criminalidad
# ZN - proporcion de terrenos residenciales divididos en zonas para lotes de mas de 25,000 pies cuadrados.
# INDUS - proporcion de acres comerciales no comerciales por ciudad.
# CHAS - (1 si el tramo limita al rio)
# NOX: concentracion de oxidos ntricos (partes por 10 millones)
# RM: numero promedio de habitaciones por vivienda
# AGE: proporcion de unidades ocupadas por el propietario construidas antes de 1940
# DIS - distancias ponderadas a cinco centros de empleo de Boston
# RAD - Indice de accesibilidad a las carreteras radiales
# IMPUESTO - tasa de impuesto a la propiedad
# PTRATIO - proporcion alumno-maestro por ciudad
# BLACK - proporcion de negros por barrio
# LSTAT -% estado mas bajo de la poblacion
# MEDV - Valor mediano de las casas (variable de salida)

# División train-test
index <- sample(1:nrow(data), round(0.80*nrow(data)))
train <- data[index,]
test <- data[-index,]

# Comprobación valores NA
miss <- colSums(is.na(train))
miss

# Normalizar los datos
train_norm <- train
for (k in 1:14){
  train_norm[,k] = (train[,k]-mean(train[,k]))/(max(train[,k])-min(train[,k]))
}

summary(train_norm)

# Entrenamiento de la red neuronal
install.packages("neuralnet")
library(neuralnet)

nn <- neuralnet(medv ~ ., data=train_norm,
                hidden=c(10), linear.output = T)

plot(nn)

test_norm <- test
for(k in 1:14){
  test_norm[,k] = (test[,k]-mean(train[,k]))/(max(train[,k]-min(train[,k])))
}

pr.nn <- compute(nn, test_norm[1:13])
pred.nn <- pr.nn$net.result * (max(train[,14])-min(train[,14])) + mean(train[,14])
pred.nn

MSE <- mean((test$medv-pred.nn)^2)
MSE

error_porcentaje.nn = 100*mean(abs(pred.nn-test$medv)/test$medv)
error_porcentaje.nn

plot(test$medv,pred.nn,col='red',main='Real vs Predicted NN',pch=18,cex=0.7)
abline(0,1,lwd=2)
cor(test$medv,pred.nn)
