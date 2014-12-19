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

sub_test <- read.table("./data/test/subject_test.txt", 
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

sub_train <- read.table("./data/train/subject_train.txt", 
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
      #Make variable names syntatically valid
      var_names <- gsub("()", "", var_names[,2], fixed=TRUE)
      var_names <- gsub("-", "_", var_names, fixed=TRUE)
      var_names <- gsub(",", "_", var_names, fixed=TRUE)
      var_names <- gsub("(", "_", var_names, fixed=TRUE)
      var_names <- gsub(")", "_", var_names, fixed=TRUE)
      var_names <- make.unique(var_names)

# Rename the activities in testy and trainy to be more descriptive

for(i in 1:nrow(act_names)) {
      testy[testy==i] <- act_names[i,2]
      trainy[trainy==i] <- act_names[i,2]
}

names(test)  <- var_names
names(testy) <- "Activity"
names(sub_test) <- "Subject"
names(train)  <- var_names
names(trainy) <- "Activity"
names(sub_train) <- "Subject"


# Cbind the activity names and subjects with the cooresponding dataset
merged_test <- cbind(sub_test, testy,test)
merged_train <- cbind(sub_train, trainy, train)

# Rbind merged_test and merged_train to make a larger dataset

untidy_merge <- rbind(merged_test, merged_train)

# Select only the columns containing mean or std dev measurements omitting
# those that relate to mean Frequency or angle

library(dplyr)
untidy_data <- select(untidy_merge, 
            Subject, Activity, 
            contains("mean"), 
            contains("std"),
            -contains("angle"),
            -contains("Freq"))

# Summarize untidy_data using summarise_each function to show the average
# of the means and std devs grouped by subject and activity.

tidy_data <- summarise_each(
      group_by(untidy_data, Subject, Activity), 
      funs(mean))

# Export tidy_data to a .txt file in the working directory

write.table(tidy_data, file="./tidy_data.txt", row.names=FALSE)