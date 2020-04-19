#Set working directory
setwd("~/Desktop/cleaning data project")

#Load required packages
library(dplyr)
library(reshape2)

#read in data
subject_train = read.table("source/train/subject_train.txt")
X_train = read.table("source/train/X_train.txt")
Y_train = read.table("source/train/Y_train.txt")
subject_test = read.table("source/test/subject_test.txt")
X_test = read.table("source/test/X_test.txt")
Y_test = read.table("source/test/Y_test.txt")
features <- read.table("source/features.txt")
activityLabels <- read.table("source/activity_labels.txt")

##Names cols of data descriptively
colnames(X_train) <- features[,2] 
colnames(Y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(X_test) <- features[,2] 
colnames(Y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

#merge training and the test sets to create one dataset
merged_x <- rbind(X_test, X_train)
merged_y <- rbind(Y_test, Y_train)
merged_subject <- rbind(subject_test, subject_train)
datav1 <- cbind(merged_subject, merged_x, merged_y)

#clean environment of unused sets
rm(merged_subject, merged_x, merged_y, subject_test, subject_train, X_test, X_train, Y_test, Y_train, features)

##Extracts only the measurements on the mean and standard deviation for each measurement.
colNames <- colnames(datav1)
meansSD <- (grepl("activityId" , colNames) | 
              grepl("subjectId" , colNames) | 
              grepl("mean.." , colNames) | 
              grepl("std.." , colNames))
datav2 <- datav1[ , meansSD == TRUE]
rm(datav1, colNames, meansSD) #keep environment clean

##Uses descriptive activity names to name the activities in the data set
datav2 <- select(datav2, subjectId, activityId, everything()) #moves activityID to second col, makes it easier to work with.
datav2$activityId <- as.factor(datav2$activityId)
levels(datav2$activityId) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING",  "STANDING", "LAYING")

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
datav2$subjectId <- as.factor(datav2$subjectId)
meltedData <- melt(datav2, id = c("subjectId", "activityId"))
tidyData <- dcast(meltedData, subjectId + activityId ~ variable, mean)

#write tidy data set into a text file
write.table(tidyData, "data/tidydata.txt", row.name=FALSE)