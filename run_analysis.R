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
# Rename the directory for easier access to data while coding
file.rename("UCI HAR Dataset", "data")

# Read the raw data files into R as data frames
test <- read.table("./data/test/X_test.txt", 
                   header=FALSE, 
                   sep="",
                   colClasses="numeric")

testy <- read.table("./data/test/Y_test.txt", 
                    header=FALSE, 
                    sep="",
                    colClasses="character")

train <- read.table("./data/train/X_train.txt", 
                    header=FALSE, 
                    sep="",
                    colClasses="numeric")

trainy <- read.table("./data/train/Y_train.txt", 
                    header=FALSE, 
                    sep="",
                    colClasses="character")

act_names <- read.table("./data/activity_labels.txt", 
                        header=FALSE, 
                        sep="",
                        colClasses="character")

var_names <- read.table("./data/features.txt", 
                       header=FALSE, 
                       sep="",
                       colClasses="character")

# Rename the activities in testy and trainy to be more descriptive

for(i in 1:nrow(act_names)) {
      testy[testy==i] <- act_names[i,2]
      trainy[trainy==i] <- act_names[i,2]
}

names(test)  <- var_names[,2]
names(train)  <- var_names[,2]
names(testy) <- "Activity_Names"
names(trainy) <- "Activity_Names"

# Cbind the activity names with the cooresponding dataset
merged_test <- cbind(testy,test)
merged_train <- cbind(trainy, train)

# Rbind merged_test and merged_train to make a larger dataset

untidy_merge <- rbind(merged_test, merged_train)

# Select only the columns containing mean or std dev measurements

library(plyr)