##Set working directory & read in data
setwd("C:/Users/40058335/Desktop/UCI HAR Dataset")

#read in training table
subject_train = read.table("train/subject_train.txt")
X_train = read.table("train/X_train.txt")
Y_train = read.table("train/Y_train.txt")

#read in testing table
subject_test = read.table("test/subject_test.txt")
X_test = read.table("test/X_test.txt")
Y_test = read.table("test/Y_test.txt")

#read in feature vector
features <- read.table("features.txt")

#read in activity labels
activityLabels <- read.table("activity_labels.txt")

##Names cols of data

colnames(X_train) <- features[,2] 
colnames(Y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(X_test) <- features[,2] 
colnames(Y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

#merge training and the test sets to create one dataset
merged_testing <- cbind(Y_train, subject_train, X_train)
merged_train <- cbind(Y_test, subject_test, X_test)
datav1 <- rbind(merged_train, merged_testing)

##Extracts only the measurements on the mean and standard deviation for each measurement.

colNames <- colnames(datav1)
meansdA <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
meansdB <- datav1[ , meansdA == TRUE]

##Uses descriptive activity names to name the activities in the data set
activenames <- merge(meansdB, activityLabels,
                              by='activityId',
                              all.x=TRUE)

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
datav2 <- aggregate(. ~subjectId + activityId, activenames, mean)
datav2 <- datav2[order(datav2$subjectId, datav2$activityId),]

#write tidy data set into a text file
write.table(datav2, "tidydata.txt", row.name=FALSE)
