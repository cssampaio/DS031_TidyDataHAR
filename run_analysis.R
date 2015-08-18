# Getting and Cleaning Data - Project tidy data for Human+Activity+Recognition+Using+Smartphones

# Download data file
if(!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile = "getdata-projectfiles-UCI HAR Dataset.zip")
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

# 1- Merge training and test sets

# Dim = 7352 x 561
setTrain_df <- read.table("./UCI HAR Dataset/train/X_train.txt")
# Dim = 2947 x 561
setTest_df <- read.table("./UCI HAR Dataset/test/X_test.txt")
# Dim = 10299 x 561
set_df <- rbind(setTrain_df, setTest_df)

# Dim = 7352 x 1
labelTrain_df <- read.table("./UCI HAR Dataset/train/y_train.txt")
# Dim = 2947 x 1
labelTest_df <- read.table("./UCI HAR Dataset/test/y_test.txt")
# Dim = 10299 x 1
label_df <- rbind(labelTrain_df, labelTest_df)

# Dim = 7352 x 1
subjectTrain_df <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Dim = 2947 x 1
subjectTest_df <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# Dim = 10299 x 1
subject_df <- rbind(subjectTrain_df, subjectTest_df)

# Dim = 10299 x 563
completeset_df <- cbind(subject_df, label_df, set_df)

# Add column names to data frame
features_df <- read.table("./UCI HAR Dataset/features.txt")
i <- sapply(features_df, is.factor)
features_df[i] <- lapply(features_df[i], as.character)
colnames(completeset_df) <- c("subject", "activity", features_df[,2])
    
# 2- Extract mean and std for each measurement

# only for measurements with both mean and std measures
meanIndex <- grep("mean\\(\\)", features_df[,2])
stdIndex <- grep("std\\(\\)", features_df[,2])
# vector for column indexes: subject + activity + mean and std features
# Dim = 1 x 68
index_vector <- c(1, 2, 2 + sort(c(meanIndex, stdIndex)))

# Dim = 10299 x 68
subset_df <- completeset_df[, index_vector]

# 3- Add descriptive activity names

# replacing activity codes by activity names
activity_df <- read.table("./UCI HAR Dataset/activity_labels.txt")
subset_df[,2] <- activity_df[,2][match(subset_df[,2], activity_df[,1])]

# 4- Label the data set with descriptive variable names

from <- c("-", "\\(\\)", "Acc", "Gyro", "BodyBody", "Mag")
to <- c("", "", "Acceleration", "AngularVelocity", "Body", "Magnitude")
for (i in 1:length(from)) {
    names(subset_df) <- gsub(from[i],to[i],names(subset_df))
}

# 5- Create tidy data set with the average of each variable for each activity and each subject

# Load useful libraries
library(dplyr)

# Group by subject + activity and average features
# Rows = 30 subjects x 6 activities = 180
# Columns = subject + activity + 33 mean features + 33 std features = 68
# Dim = 180 x 68
tidyset_df <- subset_df %>% group_by(subject, activity) %>% summarise_each(funs(mean))


# 6- Create txt file with tidy data

write.table(tidyset_df, file = "tidyset.txt", row.name=FALSE)

# checking file
data <- read.table("./tidyset.txt", header = TRUE)
View(data)