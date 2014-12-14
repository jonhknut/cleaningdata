README
============

This is a course project for the Coursera course "Getting and Cleaning Data". This repo contains the following files:


## Files
1) README.md
A short summary of the files on this repo, short description of the raw data, description on how the run_analysis.R script works and Aknowledgements.

2) CodeBook.md
A codebook with the data to indicate all the variables and calculated summaries, along with units and other relevant information. 

3) run_analysis.R



4) tidysummary.txt
The tidy data set created in step 5 of the course instructions. Data set was uploaded using write.table() using row.name = FALSE. The text file can be best viewed using R:

fileUrl <- "https://raw.githubusercontent.com/jonhknut/cleaningdata/master/tidysummary.txt"
download.file(fileUrl, destfile = "tidysummary.txt", method = "curl")
tidysummary <- read.table("tidysummary.txt", header = TRUE)
View(tidysummary)

5) 

