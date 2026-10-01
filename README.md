# Manufacturing Quality Intelligence System

An end-to-end machine learning project focused on predicting machine failures and identifying the type of machine failure using manufacturing data.

### Project Overview

This repository contains multiple machine learning projects developed using Python, SQL, and machine learning techniques.

The projects focus on analysing manufacturing data, predicting machine failures, and identifying potential failure types.

### This project uses manufacturing machine data to:

- Clean and prepare data using MySQL
- Explore and analyse machine operating patterns using Python
- Build machine learning models to predict machine failure
- Build a multi-label model to identify specific failure types
- Communicate findings through an interactive Power BI dashboard
- Provide machine failure predictions through a Streamlit application

The project contains two machine learning models:

 * Machine Failure Prediction – Binary classification
 * Machine Failure Type Prediction – Multi-label classification


### Project Workflow

Manufacturing Data

        ↓

MySQL Data Integration & Cleaning

        ↓

Python Exploratory Data Analysis

        ↓

Feature Engineering

        ↓

Machine Learning

        ↓

Model Evaluation

        ↓

Power BI Reporting

        ↓

Streamlit Prediction Application



## 1. Data Processing with MySQL

- The raw manufacturing data was organised across multiple tables containing machine information, sensor readings, and failure records.

- SQL Data Integration

- The tables were joined using Product ID to create a combined machine failure dataset.

- SQL Cleaning

- The cleaning process included:

  * Creating a staging table
  * Renaming columns for consistency
  * Check for duplicate records
  * Removing duplicate records
  * Checking for missing values
  * Validating failure indicators
  * Checking for impossible negative values
  * Standardising product type values
  * Removing failure columns with no useful variation
  * The cleaned dataset was then used for the Python analysis and machine learning stages.



## 2. Exploratory Data Analysis

Python was used to investigate the structure and behaviour of the manufacturing data.

- Analysis included:

 * Dataset structure and data types
 * Missing-value analysis
 * Descriptive statistics
 * Feature distributions
 * Machine failure distributions
 * Product type analysis
 * Outlier detection
 * Correlation analysis
 * Failure-type analysis

- Key Features Analysed

  * Air temperature
  * Process temperature
  * Rotational speed
  * Torque
  * Tool wear
  * Product type


## 3. Feature Engineering

- Two additional features were created to provide the models with useful machine-operating information.

- Operating Temperature Difference = Process Temperature - Air Temperature

This represents the temperature difference between the manufacturing process and the surrounding air.

- Mechanical Power = Torque × Rotational Speed

This provides an additional measure of machine operating load.



## 4. Machine Failure Prediction

### Objective:

- The first model predicts whether a machine is likely to experience a failure.

This is treated as a binary classification problem:

0 → No Failure

1 → Failure

### Machine Learning Workflow

- Train-test split
- Numerical and categorical preprocessing
- Missing-value imputation
- Feature scaling
- One-hot encoding
- Polynomial feature engineering
- Class balancing
- Cross-validation
- Hyperparameter tuning using GridSearchCV
- Model comparison
- Final evaluation
- Model persistence using Joblib

- Models Evaluated 
  * Logistic Regression
  * Decision Tree
  * Random Forest
  * Gradient Boosting
  * Evaluation

### The final model was evaluated on unseen test data using:

- Accuracy
- Precision
- Recall
- F1 Score
- ROC-AUC
- Confusion Matrix
- Classification Report
- ROC Curve
- Precision-Recall analysis
- Final Model
- Logistic Regression

The final model was selected after comparing the candidate models and evaluating their performance.



## 5. Machine Failure Type Prediction

### Objectives:

- The second model predicts the specific type of machine failure.

This is treated as a multi-label classification problem, meaning that more than one failure type can potentially be associated with the same machine.

- Failure Types

 * Tool Wear Failure
 * Power Failure
 * Overstrain Failure
 * Model Architecture

A neural network was developed using TensorFlow/Keras.

- The model uses:

 * Dense layers
 * ReLU activation
 * Three sigmoid output neurons
 * Binary Focal Crossentropy
 * Class balancing
 * Adam optimisation
 * Early stopping
 * Model checkpointing
 * Sigmoid activation is used because each failure type is predicted independently rather than forcing the model to choose only one class.

* Evaluation

The multi-label model is evaluated using:

a. Precision
b. Recall
c. F1 Score
d. Accuracy
e. ROC-AUC
f. Classification Report
g. Multi-label Confusion Matrices
h. Per-class thresholds are used when converting predicted probabilities into failure-type predictions.



## 6. Power BI Dashboard

Power BI was used to turn the manufacturing analysis into an interactive business-facing report.

### Dashboard: Machine Failure Report

- The dashboard provides an overview of:

- Total machine
- Total machine failures
- Overstrain failure
- Power failures
- Tool wear failures
- Failure distribution by product type
- Mechanical power distribution
- Machine operating process distribution
- Tool wear patterns
- Mechanical power vs. tool wear
- Mechanical power vs. machine operating process
- Dashboard Preview

Because the failure-type problem is multi-label, failure-type counts can overlap. Therefore, the sum of individual failure types does not necessarily equal the number of machines with a failure.



## 7. Streamlit Application

An interactive Streamlit application was developed to allow users to enter machine operating conditions and obtain predictions from the trained models.

### User application accepts:

- Product Type
- Air Temperature
- Process Temperature
- Rotational Speed
- Torque
- Tool Wear




## 7. Technology Stack

Data & SQL

- MySQL
- SQL
- Data Cleaning
- Data Integration
- CTEs
- Window Functions

Python & Data Science

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Machine Learning

- Scikit-learn
- Logistic Regression
- Decision Trees
- Random Forest
- Gradient Boosting
- TensorFlow/Keras
- Neural Networks
- Multi-label Classification
- Feature Engineering
- Cross-validation
- Hyperparameter Tuning
- Model Evaluation
- Visualisation & Applications
- Power BI
- Streamlit
- Joblib


## 8.  Key Data Science Skills Demonstrated

This project demonstrates practical experience with:

- Data cleaning
- SQL data integration
- Exploratory data analysis
- Descriptive statistical analysis
- Feature engineering
- Data preprocessing
- Imbalanced classification
- Binary classification
- Multi-label classification
- Neural networks
- Cross-validation
- Hyperparameter tuning
- Model evaluation
- Model persistence
- Data visualisation
- Business-oriented reporting
- Interactive machine learning applications


## 9. Key Takeaways

This project demonstrates an end-to-end approach to a manufacturing data science problem, moving from raw relational data through:

Data Preparation → EDA → Feature Engineering → Machine Learning → Evaluation → Power BI → Interactive Prediction

The project also demonstrates the difference between:

Predicting whether a machine will fail
Predicting which failure type(s) may occur




Author

Siphesihle Nkosi

Aspiring Data Scientist | Machine Learning | Data Analyst






