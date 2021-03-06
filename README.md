---
output:
  html_document:
    keep_md: yes
---
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

After initially downloading and extracting the data on **Dec. 17, 2014** I read the include README and codebooks to get an idea of what data was included. I then visually inspected to the data in Notepad ++ to get a sense for how the data was structured to determine the best method to read the data into R.

The raw data appears to be stored in a .txt file with fixed width columns. The activity codes are stored in a separate file with a cooresponding number of rows. 

### Reading the files into R
I next created R data frames by reading the txt files into R using the read.table function. 

* test <- X_test.txt (All measurements in test)
* testy <- Y_test.txt (Activity codes in test)
* sub_test <- subject_test.txt (The subjects each row applies to)
* train <- X_train.txt (All measurements in train)
* trainy <- Y_train.txt (All activity codes in train)
* sub_train <- subject_train.txt (The subjects each row applies to)
* act_names <- The descriptive names of the activity codes
* var_names <- The descriptive names of the variables

###Changing Observation and Variable Names
Next I wrote a for loop to change all coded activities in data frames testy and trainy to the cooresponding descriptive names. I also used the gsub() function to make the variable names found in features.txt into a syntatically valid format. Next I used the names function to add the list of variables in var_names as the column names in test and train and assign "Activity_Names" as the column name in testy and trainy.

###Merging datasets
Because data frames test, testy, and sub_test and train, trainy, and sub_train possess an equal number of rows, I used cbind to clip the subjects and activity names onto the data and stored the results in data frames merged_test and merged_train. Since these two data frames contained the same number of columns, I used rbind() to clip merged_train onto the bottom of merged_test and stored this in the variable untidy_merge.

###Selecting only rows pertaining to mean and standard deviation
Next I removed the 495 rows that did not contain mean or standard deviation measurements using select(). The resulting data frame with 10,299 observations and 68 variables was stored in untidy_data.

###Tidying up and summarization
Finally, I tidied up the data using the summarise_each() function to provide the average of each of the 66 measurment variables grouped by Subject and Activity. The resulting data frame of 180 observations and 68 variables was stored in tidy_data. Tidy data was exported to the working directory using write.table as the file "tidy_data.txt".