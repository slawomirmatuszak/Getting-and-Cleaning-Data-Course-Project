# Code Book for `data_data_tidy_final` file and `run_analysis.R` script


Script `run_analysis.R` performs all steps required by Coursera "Getting and Cleaning Data Course Project":

1. Extracts required information and merge the training and the test sets to create one data set

2. Selects measurements that contain information about average and standard deviation

3. Use descriptive activity names to name the activities in the data set

4. Labels the data set with descriptive variable names

5. Creates a second, independent tidy data set (called `data_tidy_final`) with the average of each variable for each activity and each subject. 

Every step taken is explained in notes in script itself. Whenever it was possible, I used functions from dplyr package, as personally I prefer it over base functions. 

