## This is a script for the Getting and Cleaning Data Course Project on Coursera
## The data is based on "Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier 
## Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
## using a Multiclass Hardware-Friendly Support Vector Machine. International 
## Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012"

if (!("dplyr" %in% rownames(installed.packages())) ) {
        print("Please install required package \"dplyr\" before proceeding")
} else {

        library(dplyr)

## Step 1
## Merges the training and the test sets to create one data set.
## Appropriately labels the data set with descriptive variable names


## Download and unzip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "dataset.zip", 
              method = "curl", mode = "wb")
unzip("dataset.zip")

## Read the activity labels and label dataframe
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity_name"))

## Read the features
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("feature_id", "feature_name"))

## Read the training data and label dataframe with features
traindata <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features[,2])

## Read the id of the training subjects and label the dataframe
subject_train_id <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")

## Read the id of the test activity and label the dataframe
activity_train_id <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")

## Read the test data and label dataframe with features
testdata <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features[,2])

## Read the id of the test subjects and label the dataframe
subject_test_id <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")

## Read the id of the test activity and label the dataframe
activity_test_id <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")

## Combine the training data
train_data <- cbind(subject_train_id, activity_train_id, traindata)

## Combine the test data
test_data <- cbind(subject_test_id, activity_test_id, testdata)

## Combine the training data and the test data
data <- rbind(train_data, test_data)
data_tbl <- tbl_df(data)


## Step 2
## Extracts only the measurements on the mean and standard deviation for each measurement. 
data_tidy <- select(data_tbl, subject_id, activity_id,
                    contains("mean", ignore.case = TRUE), 
                    contains("std", ignore.case = TRUE))

## Step 3 
## Uses descriptive activity names to name the activities in the data set
data_tidy <- merge(activity_labels, data_tidy, by.x="activity_id",by.y="activity_id",all=TRUE)
data_tidy <- select(data_tidy, -activity_id)
data_tidy <- data_tidy[c(2, 1, 3:88)]
data_tidy <- arrange(data_tidy, subject_id, activity_name)
        
## Step 4
## Write tidy table
write.csv(data_tidy, "tidydata.txt", row.names = FALSE)

## Step 5
## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject.      

grouped_tidy <- group_by(data_tidy, subject_id, activity_name)
tidy_summary <- summarise_each(grouped_tidy, funs(mean))
write.csv(tidy_summary, "tidysummary.txt", row.names = FALSE)

## Step 6
## Clean up environment and remove unwanted files

rm(list=ls(all=TRUE))
file.remove("dataset.zip")
unlink("./UCI HAR Dataset", recursive = TRUE)

}
