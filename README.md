
#Introduction

This project requires the performance of supervised learning experiments on a dataset related to aquaculture. 

The aim is to build and compare different machine learning models for classification and regression tasks.

#Dataset

The dataset escapesClean.csv is a cleaned version of escape.csv, containing several new variables. It relates to fish farming and includes features that are essential for the experiments.

#Experiments

-Experiment 1: Classification Task

Model 1: Logistic Regression to predict 'Cause'
Model 2: Linear Discriminant Analysis to predict 'Cause'

-Experiment 2: Regression Task

Model 3: Linear Regression to predict 'Number'
Model 4: Random Forest Regressor to predict 'Number'

#Performance Metrics Used

-Experiment 1: Classification Task
Metrics Used: Area Under the Curve (AUC)
Purpose: To evaluate the effectiveness of Model 1 and Model 2 in classifying 'Cause'.

-Experiment 2: Regression Task
Metrics Used: R-Squared Score
Purpose: To evaluate the predictive accuracy of Model 3 and Model 4 in predicting 'Number'.

#Model Summary

-Model 1: Used Logistic Regression to predict 'Cause'
-Model 2: Used Linear Discriminant Analysis to predict 'Cause'
-Model 3: Used Linear Regression to predict 'Number'
-Model 4: Used Random Forest Regressor to predict 'Number'


#Model Deployment

A basic R Shiny app was used to deploy one of the models from Experiment 1. The app lets the user to input values for the predictors and will display the predicted 'Cause'.


