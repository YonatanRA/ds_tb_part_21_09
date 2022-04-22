# LIMPIEZA DE DATOS

x <- c(10, 20, NA, 30, NA, 40) # Vector con valores NA (Not availables)
is.na(x) # Esta función permite conocer los valores NA 
x[!is.na(x)] # Excluyo los valores NA
mean(x,na.rm=TRUE) # Muchas funciones permiten ignorar los valores NA

# Dataset de ejemplo
data("airquality")
df = airquality

# Cantidad de valores NA
sum(is.na(df))
summary(df)
colSums(is.na(df))

# Computar por la mediana
df$Ozone[is.na(df$Ozone)] <- median(df$Ozone, na.rm = TRUE)
colSums(is.na(df))

df$Solar.R[is.na(df$Solar.R)] <- median(df$Solar.R, na.rm = TRUE)
colSums(is.na(df))

# Omitir valores NA
df2 = na.omit(airquality)

# CORRECCIÓN DE OUTLIERS
boxplot(df)
par(mfrow=c(1,2))
boxplot(df$Ozone,col = "antiquewhite3",main = "Boxplot of Ozone",outcol="Blue",outpch=19,boxwex=0.7,range = 1.5)
hist(df$Ozone,col = "antiquewhite3",main = "Histogram of Ozone", xlab = "Observations",breaks = 15)

# Valores fuera del rango inter cuartílico
ric <- IQR(df$Ozone)
q2 <- quantile(df$Ozone,0.75)
sum(df$Ozone > q2+1.5*IQR(df$Ozone))
df[df$Ozone > q2+1.5*IQR(df$Ozone),]

# TRANSFORMACIÓN DE VARIABLES CATEGÓRICAS
rm(list=ls())
data("Titanic")
df = as.data.frame(Titanic)
summary(df)
unique(df$Class)

# Imprimo la clase de cada columna
for (col in names(df)){
  print(c(col,class(df[[col]])))
}

# Transformación de la columnas categóricas a numérica
df$Class_num <- ifelse(df$Class=="1st",1,
                       ifelse(df$Class=="2nd",2,
                              ifelse(df$Class=="3rd",3,4)))
head(df)                                     

df$Sex_num <- ifelse(df$Sex=="Male",1,0)
df$Age_num <- ifelse(df$Age=="Child",1,0)
df$Survived_num <- ifelse(df$Survived=="No",0,1)

head(df)
class(df$Freq)

df2 <- df[,c("Class_num","Sex_num","Age_num","Survived_num","Freq")]
df2

# One-hot encoding
install.packages("dummies")
library(dummies)
df3 <- dummy.data.frame(df)
head(df3)

df4 <- cbind(df3[,1:4],df2[,2:5])
df4
