# manufacturing-quality-intelligence-system
End-to-end manufacturing quality prediction system using SQL, Python and Machine Learning.

## Tech Stack
-SQL (MySQL)
-Python
-Pandas
-NumPy
-Matplotlib
-Seaborn
-Scikit-learn
-TensowFlow/Keras
-Git
-GitHub

## Project Workflow

1 SQL
    a. Joining Tables
    b. Cleaning
       - created a stagging table
       - renamed column names for consistency
       - checked for duplicates
       - removed duplicates
       - checked for NULL values
2. PYTHON - Exploratory Data Analysis
    a. Loaded and inspected the cleaned dataset
    b. Examined dataset structure and data types
    c. Completed dataset cleaning
    d. Analysed numerical features
    e. Investigated feature distribution
    f. Investigated machine failure patterns
    g. Examined potential outliers
    h.  Identified relationships between variables
  
  3. Machine Learning - Classification
        a. Defined the machine failure target variable 
        b. Selected relavant predictor features
        c. Split the data into training and testing sets
        d. Built preprocessing pipelines
        e. Applied appropriate numerical & categorical preprocessing
        f. Built classification models
        g. Tuned model hyperparameters using cross-validation
        h. Selected the final model based on evaluation results
       
4. Model Evaluation
The final model was evaluated on unseen test data using 
    a. Accuracy
    b. Precision
    c. Recall
    d. F1-score
    e. ROC-AUC
    e. Confusion matrix
    f. Classification report
    g. ROC curve
    h. Precision-Recall curve

5. Model Persistence
   a. Saved the trained final model using Joblib
