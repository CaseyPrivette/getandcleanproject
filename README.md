Getting And Cleaning Data Course Project
========================================
Casey Privette
--------------

### Description

The purpose of this script is to extract data from the Coursera Getting and Cleaning Data site and merge the data into a tidy dataset. The included script does the following to the original datasets:

1. Downloads the data from the course website and unzips the files
2. Merges the x_train and x_test datasets into one
3. Renames the activity observations from the coded names to descriptive names
4. Adds variable names to describe the variables
5. Exports a tidy dataset for later analysis

### Steps

After initially downloading and extracting the data I read the include README and codebooks to get an idea of what data was included. I then visually inspected to the data in Notepad ++ to get a sense for how the data was structured to determine the best method to read the data into R.

The raw data appears to be stored in a .txt file with fixed width columns. The activity codes are stored in a separate file with a cooresponding number of rows. 

### Reading the files into R
I next created R data frames by reading the txt files into R using the read.table function. 

* test <- X_test.txt (All measurements in test)
* testy <- Y_test.txt (Activity codes in test)
* train <- X_train.txt (All measurements in train)
* trainy <- Y_train.txt (All activity codes in train)
* act_names <- The descriptive names of the activity codes
* var_names <- The descriptive names of the variables

###Changing Observation and Variable Names
Next I wrote a for loop to change all coded activities in data frames testy and trainy to the cooresponding descriptive names. Next I used the names function to add the list of variables in var_names as the column names in test and train and assign "Activity_Names" as the column name in testy and trainy.