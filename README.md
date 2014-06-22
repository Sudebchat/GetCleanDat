Repo: GetCleanDat
===========

Project assignment for "Getting and Cleaning Data" Course

File: Readme.md

Brief description of the content

Course Project : Getting And Cleaning Data

It does the following five tasks:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The following describes the different files used in the project.

1) The original data comes from the following URL:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
    
   Please refer to the data dictionary for this data available at the following URL:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    
   Also please refer to the Readme file that is in the zip folder for the data set for the overall background on how the data set was created.

2) The analysis script for the project is in run_analysis.R file.
   It has five sections each corresponding to the 5 different tasks specified in the project.
   It assumes that the required files (*.txt) are already extracted from the zip file and placed in the working directory.
   The run_analysis.R script also contains detailed comments to supplement understanding the flow of the code for each project part as described in the project assignment details.
   
3) The CodeBook.md contains the descriptions of the variables used in the analysis. 
   This document explains the activities in each part along with descriptions of the variables used in each part. The run_analysis.R script also contains detailed comments to supplement understanding the information in the codebook.

4) The tidydata1.txt file contains the mean and std variables selected from the merged data of training and test data sets, with appropriate column names to describe the variables. In naming the variables, a simple rule of not using capital letters, hyphen, dot and underscore was applied. The file is written in a csv format and should be pretty straightforward to read into R for further analysis.

5) The tidydat2.txt file contains the mean of all the feature variables in the original merged train and test data sets. The mean values are calculated by activity and subject (volunteer). So there are 180 rows, 6 types of activity and 30 different volunteers. The total number of features is 561, so the final data set contains 563 columns per row. The file is also written in a csv format and should be pretty straightforward to read into R for further analysis.

And finally this Readme.md contains the overall guide to the project files submitted for evaluation of the project tasks.
