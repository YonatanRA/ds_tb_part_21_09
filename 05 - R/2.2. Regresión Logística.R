# Regresión logística
# Dataset que contiene admitidos y no admitidos a una universidad en función de la nota de ciertos exámenes
df <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(df)
table(df$admit)

# Modelo de regresión logística
modelo <- glm(admit ~ gre+gpa+rank, data=df, family="binomial")
summary(modelo)

# Predicción
x <- data.frame(gre=790,gpa=3.8,rank=1)
predict(modelo, x, type='response')

# Evaluar modelo
prediccion_prob <- predict(modelo,df,type="response")
summary(prediccion_prob)

df$prediccion_prob <- prediccion_prob

# Corte óptimo en las probabilidades
install.packages("InformationValue")
library(InformationValue)
opt <- optimalCutoff(df$admit, prediccion_prob)
opt

df$predicted <- ifelse(df$prediccion_prob>=opt,1,0)

# Matriz de confusión
table(df$predicted,df$admit)
confusionMatrix(df$admit, prediccion_prob, threshold=opt)

# Accuracy
1-misClassError(df$admit, prediccion_prob, threshold = opt)

# Precision
Precision <- precision(df$admit, prediccion_prob, threshold = opt)
Precision

# Recall
Recall <- sensitivity(df$admit, prediccion_prob, threshold = opt)
Recall

# Specificity
specificity(df$admit, prediccion_prob, threshold = opt)

# F1 Score
(2*Precision*Recall)/(Precision+Recall)

# ROC
plotROC(actuals=df$admit, predictedScores = df$prediccion_prob)

# Construir curva ROC
ejex <- vector() # FPR
ejey <- vector() # TPR

for (opt in seq(from=0,to=1,by=0.001)){
  ejex <- c(ejex,1-specificity(df$admit, prediccion_prob, threshold = opt))
  ejey <- c(ejey,sensitivity(df$admit, prediccion_prob, threshold = opt))
}

plot(ejex,ejey,type="l",col="red",ylab="Sensitivity",
     xlab="1-Specificity")
abline(c(0,0),c(1,1))

width = diff(c(0,1-ejey))
auc <- sum((1-ejex)*width)
auc
