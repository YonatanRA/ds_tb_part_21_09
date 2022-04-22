# Relación entre variables

# Chi-cuadrado
datos <- as.table(matrix(c(5,1,3,10,8,3), ncol=3))
colnames(datos) <- c('Alta', 'Media','Baja')
rownames(datos) <- c('Hombre', 'Mujer')
datos
chisq.test(datos)

# Otro ejemplo
df <- read.csv("https://goo.gl/j6lRXD")
head(df)
table(df$treatment, df$improvement)
chisq.test(table(df$treatment, df$improvement))

# ANOVA
insectos <- c(16,11,20,21,14,7,37,32,15,25,39,41,21,12,14,17,13,17,45, 59,48,46,38,47)
colores <- as.factor(c(rep(c("azul", "verde", "blanco","amarillo"), each =6)))
colores
fm = aov(insectos ~ colores)
summary(fm)

# Otro ejemplo
data(iris)
iris
summary(aov(iris$Sepal.Length~iris$Species))
summary(aov(iris$Sepal.Width~iris$Species))
summary(aov(iris$Petal.Length~iris$Species))
summary(aov(iris$Petal.Width~iris$Species))

# Coeficiente de correlación
horas <- c(7,4,12,11,8,6,11,5)
peso <- c(74,50,89,84,65,60,70,52)
cor(horas,peso)
cor.test(horas,peso)

# Matriz de correlación
install.packages("corrplot")
library(corrplot)
corrplot(cor(iris[,1:4]), type = "upper")

library(readr)
Ownership <- read_csv("https://wiki.q-researchsoftware.com/images/b/b9/Ownership.csv")
corrplot(cor(Ownership),type = "upper")
