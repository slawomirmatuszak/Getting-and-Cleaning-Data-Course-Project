### Getting and Cleaning Data Course Project
The aim of this repository is to demonstrate my ability to collect, work with, and clean a data set for peer-graded Assignment. It contains the instructions on how to run analysis on Human Activity recognition dataset.

Original data  
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##### I used files from original data set:  
  1. features.txt - includes the descriptions for features measured  
  2. train/X_train.txt - includes the measurements of the features in train set (one row - 1 measurement of 561 features)  
  3. test/X_test.txt - includes the measurements of the features in test set  
  4. train/subject_train.txt - subject for each measurement from the train set  
  5. test/subject_test.txt - subject for each measurement from the test set  
  6. train/y_train.txt - activity (from 1 to 6) for each measurement from the train set  
  7. test/y_test.txt - activity (from 1 to 6) for each measurement from the test set  

##### As a final result we have following files:  
1. `CodeBook.md` describes the data, and any transformations or work that has been performed in order to clean up the original data.   
2. Script `run_analysis.R` performs the data preparation and then followed by the 5 steps required  in the course project’s definition:  
* Merges the training and the test sets to create one data set.  
* Extracts only the measurements on the mean and standard deviation for each measurement.  
* Uses descriptive activity names to name the activities in the data set.  
* Appropriately labels the data set with descriptive variable names.  
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
3. Files `data_tidy_final.txt` and `data_tidy_final.csv` (the latter is not included in repo) are the final data output of the script. 
