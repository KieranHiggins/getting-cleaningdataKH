#Codebook

##The Data

Experimental data from 30 volunteers (aged 19-48) performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a Samsung Galaxy S II on the waist. From the original data notes:

>Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For more info see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Preparation (using script run_analysis.R)
* Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip.
* Set working directory per your setup (line 2)
* Load required packages (lines 5-6)
* Read in raw data tables (lines 9-16)
* Give variables descriptive names (lines 19-25)
* Merge training and testing to form one dataset (lines 28-31)
* Extract only measurements for sd and mean for each measurement (lines 37 - 42)
* Use descriptive activity names to name the activities in the data set (lines 46 - 48)
* Create a second, independent tidy data set with the average of each variable for each activity and each subject (lines 51 -53)


##Variables
* subjectId: 1 to 30 each representing a participant in the study
* activityId: the activity that the subject was doing at the time of the measurement

> Note: t denotes time, f denotes frequency domain signals, Body/Gravity denotes source, Acc/Gyro denotes linear acceleration or angular velocity, mag denotes magniture, XYZ denotes axis of movement.

* tBodyAcc-mean-X
* tBodyAcc-mean-Y
* tBodyAcc-mean-Z
* tBodyAcc-std-X
* tBodyAcc-std-Y
* tBodyAcc-std-Z
* tGravityAcc-mean-X
* tGravityAcc-mean-Y
* tGravityAcc-mean-Z
* tGravityAcc-std-X
* tGravityAcc-std-Y
* tGravityAcc-std-Z
* tBodyAccJerk-mean-X
* tBodyAccJerk-mean-Y
* tBodyAccJerk-mean-Z
* tBodyAccJerk-std-X
* tBodyAccJerk-std-Y
* tBodyAccJerk-std-Z
* tBodyGyro-mean-X
* tBodyGyro-mean-Y
* tBodyGyro-mean-Z
* tBodyGyro-std-X
* tBodyGyro-std-Y
* tBodyGyro-std-Z
* tBodyGyroJerk-mean-X
* tBodyGyroJerk-mean-Y
* tBodyGyroJerk-mean-Z
* tBodyGyroJerk-std-X
* tBodyGyroJerk-std-Y
* tBodyGyroJerk-std-Z
* tBodyAccMag-mean
* tBodyAccMag-st
* tGravityAccMag-mean
* tGravityAccMag-std
* tBodyAccJerkMag-mean
* tBodyAccJerkMag-std
* tBodyGyroMag-mean
* tBodyGyroMag-std
* tBodyGyroJerkMag-mean
* tBodyGyroJerkMag-std
* fBodyAcc-mean-X
* fBodyAcc-mean-Y
* fBodyAcc-mean-Z
* fBodyAcc-std-X
* fBodyAcc-std-Y
* fBodyAcc-std-Z
* fBodyAccJerk-mean-X
* fBodyAccJerk-mean-Y
* fBodyAccJerk-mean-Z
* fBodyAccJerk-std-X
* fBodyAccJerk-std-Y
* fBodyAccJerk-std-Z
* fBodyGyro-mean-X
* fBodyGyro-mean-Y
* fBodyGyro-mean-Z
* fBodyGyro-std-X
* fBodyGyro-std-Y
* fBodyGyro-std-Z
* fBodyAccMag-mean
* fBodyAccMag-std
* fBodyBodyAccJerkMag-mean
* fBodyBodyAccJerkMag-std
* fBodyBodyGyroMag-mean
* fBodyBodyGyroMag-std
* fBodyBodyGyroJerkMag-mean
* fBodyBodyGyroJerkMag-std
