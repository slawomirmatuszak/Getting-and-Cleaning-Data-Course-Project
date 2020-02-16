# install (if necessary) and load packages
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
if("data.table" %in% rownames(installed.packages()) == FALSE) {install.packages("data.table")}
library(data.table)
library(dplyr)

# download and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
path <- getwd()
if (!file.exists("data")) { 
 dir.create("data") 
}
download.file(url, file.path(path, "data/dataFiles.zip"))
unzip(zipfile = "./data/dataFiles.zip", exdir = "./data")
file.remove("./data/dataFiles.zip")

# 1. extract required information and merge the training and the test sets to create one data set
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "code")
x <- bind_rows(x_train, x_test)
y <- bind_rows(y_train, y_test)
subject <- bind_rows(subject_train, subject_test)
data_merged <- cbind(subject, y, x)

# remove unnecessary objects from the environment
rm(x,y, x_test, y_test, subject, subject_test, subject_train, features, x_train, y_train, path, url)

# 2. select data that contain information about average and standard deviation
data_tidy <- data_merged %>% 
  select(subject, code, contains("mean", ignore.case = TRUE), contains("std", ignore.case = TRUE))

# 3 Use descriptive activity names to name the activities in the data set
data_tidy$code <- activities[data_tidy$code, 2]
data_tidy <- rename(data_tidy, "activities"=2)
rm(activities)

# 4. labels the data set with descriptive variable names
names(data_tidy)<-gsub("Acc", "Accelerometer", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("Gyro", "Gyroscope", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("BodyBody", "Body", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("Mag", "Magnitude", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("^t", "Time", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("^f", "Frequency", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("tBody", "TimeBody", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("std", "STD", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("meanFreq", ".Mean.Frequency", names(data_tidy), ignore.case = TRUE)
names(data_tidy)<-gsub("mean", "Mean", names(data_tidy), ignore.case = TRUE)

# 5. create a second, independent tidy data set with the average of each variable for each activity and each subject.
data_tidy_final <- data_tidy %>%
  group_by(subject, activities) %>%
  summarise_all(mean)
# save the output
write.table(data_tidy_final, "data_tidy_final.txt", row.name=FALSE)
write.csv(data_tidy_final, "data_tidy_final.csv")