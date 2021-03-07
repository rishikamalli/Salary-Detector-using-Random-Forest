#RANDOM FOREST REGRESSION IN R 
#Importing the data 
dataset <- read.csv("Position_Salaries.csv")
dataset <- dataset[2:3] 

#Fitting Random Forest Regression to the dataset 
#install.packages("randomForest")
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1], 
                         y = dataset$Salary, 
                         ntree = 500) 

#Predict a new result with RF Regression Model
y_pred = predict(regressor, newdata = data.frame(Level = 6.5)) 
#predicting salary for the level 6.5 years

#Visualize the Random Forest Regression results 
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01) 
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = "red")+
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), color = "blue")+
  ggtitle("Random Forest Regression Model")+
  xlab("Level")+
  ylab("Salary")
