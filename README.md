# README
## Description of run_analysis.R script

Data set source [1] 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script used the files below from the data set source:

* 'features.txt': List of all features. Total = 561
* 'activity_labels.txt': Links the class labels with their activity name. Total = 6

* 'train/subject_test.txt': Subject who performed the activity. Dim = 7352 x 1
* 'train/X_train.txt': Training set. Dim = 7352 x 561
* 'train/y_train.txt': Training labels. Dim = 7352 x 1

* 'test/subject_test.txt': Subject who performed the activity. Dim = 2947 x 1
* 'test/X_test.txt': Test set. Dim = 2947 x 561
* 'test/y_test.txt': Test labels. Dim = 2947 x 1

The run_analysis.R script steps are:

0- The data was downloaded from the data set source and loaded in R.

1- The data extracted from the training and test files was merged to produce a data frame with subject, activity labels, and features.

* completeset_df. Dim = 10299 x 563

2- From the previous data frame, it was extracted only the measurements on the mean and standard deviation for each measurement.
Measurements containing both mean() and std() keywords
Number of Variables (columns) = 1 subject + 1 activity + 33 mean() features + 33 std() features

* subset_df. Dim = 10299 x 68

3- The data frame was, then, manipulated to replace the activity labels by activity names
using activity_labels.txt data

4- And to have more descriptive variable names.

	from <- c("-", "\\(\\)", "Acc", "Gyro", "BodyBody", "Mag")
	to <- c("", "", "Acceleration", "AngularVelocity", "Body", "Magnitude")

5- Finally, the number of observation in the data frame was reduced to produce a tidy data by grouping the subject and activity and averaging the mean and std features.
Number of Observations (rows) = 30 subjects x 6 activities

* tidyset_df. Dim = 180 x 68

6- The tidyset.txt file was generated with the tidy data


#### [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
