set.seed(500)

# Random Forest y Gradient Boosting

library(MASS)
data <- Boston

# División train-test
index <- sample(1:nrow(data),round(0.80*nrow(data)))
train <- data[index,]
test <- data[-index,]

# RANDOM FOREST
library(randomForest)

rf <- randomForest(medv ~., data=train, ntree=500)
pr.rf <- predict(rf,test)

MSE <- mean((pr.rf-test$medv)^2)
MSE
cor(pr.rf,test$medv)

plot(test$medv,pr.rf)
abline(0,1,col='red')

# GBM
library(caret)

# Crossvalidation
ctrl <- trainControl(method='repeatedcv',
                     number=10,repeats=3,
                     allowParallel=T)

modelGBM <- train(medv~., data=train, method="gbm",
                  trControl=ctrl, verbose=F)

modelGBM

plot(modelGBM)

# Predicción
pr.gb <- predict(modelGBM,test)
MSE <- mean((pr.gb-test$medv)^2)
MSE
cor(pr.gb,test$medv)

plot(test$medv,pr.gb)
abline(0,1,col='red')

# XGBOOST
modelXGB <- train(medv~., data=train, method="xgbTree",
                  trControl=ctrl,verbosity = 0)

modelXGB

plot(modelXGB)

# Predicción
pr.xgb <- predict(modelXGB,test)
MSE <- mean((pr.xgb-test$medv)^2)
MSE
cor(pr.xgb,test$medv)

plot(test$medv,pr.xgb)
abline(0,1,col='red')