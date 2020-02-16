# Getting and Cleaning Data Course Project
The aim of this repository is to demonstrate my ability to collect, work with, and clean a data set for peer-graded Assignment. It contains the instructions on how to run analysis on Human Activity recognition dataset.

Original data  
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Files:  
1. `CodeBook.md` describes the variables, the data, and any transformations or work that has been performed in order to clean up the original data.   
2. Script `run_analysis.R` performs the data preparation and then followed by the 5 steps required  in the course project’s definition:  
* Merges the training and the test sets to create one data set.  
* Extracts only the measurements on the mean and standard deviation for each measurement.  
* Uses descriptive activity names to name the activities in the data set.  
* Appropriately labels the data set with descriptive variable names.  
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
3. Files `data_summarised_mean.txt` and `data_summarised_mean.csv` are the final data output of the script. 
