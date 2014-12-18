##This script will download for the Coursera Data Science Getting and Cleaning
##datasets from Samsung Galaxy S and perform the following:
##1) Merge the datasets
##2) Extract the mean and standard deviation for each observation
##3) Renames the activities and variables in the dataset
##4) Exports a tidy dataset for analysis

# Set the working directory to the project directory
setwd("~/DataScienceCoursera/getandcleandata/GetAndCleanProject")

# Download and unzip the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="project.zip")
unzip("project.zip")