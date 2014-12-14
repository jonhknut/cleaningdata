README
============

This is a course project for the Coursera course "Getting and Cleaning Data". 


## Files
This repo contains the following files:

1) README.md
A short summary of the files on this repo, short description of the raw data, description on how the run_analysis.R script works and Aknowledgements.

2) CodeBook.md
A codebook with the data to indicate all the variables and calculated summaries, along with units and other relevant information. 

3) run_analysis.R
The R script to make a tidy summary version of the data (see below for description).

4) tidysummary.txt
The tidy data set created in step 5 of the course instructions. Data set was uploaded using write.table() using row.name = FALSE. The text file can be best viewed using R:

fileUrl <- "https://raw.githubusercontent.com/jonhknut/cleaningdata/master/tidysummary.txt"
download.file(fileUrl, destfile = "tidysummary.txt", method = "curl")
tidysummary <- read.table("tidysummary.txt", header = TRUE)
View(tidysummary)

5) tidydata.txt
The tidy data set created in step 4 of the course instruction. This file was not necessary to add, but shows that the script is working as it should. 

## A brief description of the script
The run_analysis.R script merges data and produces in the end a summary of the mean  value for each variable of each subject and activity. This result is reported in tidysummary.txt. 

Step-wise description: 
1) It checks whether "dplyr" package has been installed and loads the "dplyr" package. 

2) It then reads all required .txt files and adds column names at the same time
.

3) Furthermore, it combines all the training data and the test data into one file and makes the file readable by the "dplyr" package. 

4) Next, it extracts the mean and standard deviation results from the data using select()

5) Then it adds descriptive activity names, removes activity id column, rearrange the columns and sort the rows based on subject id. 

6) It then writes the full data table to a file called tidydata.text (not included in the project description, but added since it's a nice way to show that the script did work as expected).

7) Grouping and summarizing

8) Writing a table for the summary data called "tidysummary.txt" (see CodeBook for description)

9) Cleaning the enviornment and removes the .zip file and the raw data folder from the computer

## Raw vs. manipulated data
The original, raw data included a list of all features (features.txt), list of class label and activity name (activity_labels.txt), training set (X_train.xt), training labels (y_train.txt), subject ID in the training data (subject_train.txt), test set (X_test.xt), test labels (y_test.txt) and subject ID in the test data (subject_test.txt).

These were combined into one tidy dataset (tidydata.txt). Furthermore, this tidy data set were grouped into subject and activity and the mean value for each variable of each subject and activity was reported in tidysummary.txt.

## Acknowledgements
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012