# El dataset Trigo.RData contiene datos pertenecientes a tres variedades de trigo. Se
# midieron siete parametros geometricos de los granos de trigo:
# 1. area A,
# 2. perimetro P,
# 3. compacidad C = 4 * pi * A/P^2,
# 4. longitud del nucleo,
# 5. ancho del nucleo,
# 6. coeciente de asimetra
# 7. longitud de la ranura del nucleo.
# La ultima columna contiene la etiqueta de cada una de las tres variedades (1,2,3)

set.seed(1)
load("Trigo.RData")

# Datos balanceados?
table(Trigo$X8)

Datos = Trigo

# Transformar la variable objetivo a 3 columnas de tipo binario con valores -1 y 1
Datos$Tipo1 = -1
Datos$Tipo2 = -1
Datos$Tipo3 = -1

Datos$Tipo1 <- ifelse(Datos$X8==1, 1, Datos$Tipo1)
Datos$Tipo2 <- ifelse(Datos$X8==2, 1, Datos$Tipo2)
Datos$Tipo3 <- ifelse(Datos$X8==3, 1, Datos$Tipo3)

# Eliminar la columna original
Datos$X8 = NULL

# División train-test
index <- sample(1:nrow(Datos), size=0.8*nrow(Datos))
train <- Datos[index,]
test <- Datos[-index,]

# Normalización
train_norm <- train
for (k in 1:7){
  train_norm[,k] = (train[,k]-mean(train[,k]))/(max(train[,k])-min(train[,k]))
}

# Red Neuronal
library(neuralnet)

nn <- neuralnet((Tipo1+Tipo2+Tipo3) ~ X1+X2+X3+X4+X5+X6+X7,
                data=train_norm,
                hidden =c(5),
                act.fct = "tanh",
                linear.output=FALSE)

plot(nn)

# Predicción en el conjunto de test
test_norm <- test
for(k in 1:7){
  test_norm[,k] = (test[,k]-mean(train[,k]))/(max(train[,k]-min(train[,k])))
}

pr.nn <- compute(nn,test_norm[,1:7])
pr.nn$net.result

# Escojo el máximo de cada columna de predicción
pred <- max.col(pr.nn$net.result)
pred

real <- Trigo$X8[-index]
real

# Matriz de confusión
table(pred,real)

# Tasa de acuerto
mean(pred==real)*100
