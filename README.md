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

The raw data appears to be stored in a .txt file with fixed width columns. The activity codes are stored in a separate file with a coorsponding number of rows. Variable names are not included in the raw data file and will need to be merged from the included codebook.

### Reading the files into R
I next created R data frames by reading the txt files into R using the read.table function.