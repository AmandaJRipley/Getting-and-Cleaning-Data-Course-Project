## Script for Getting and Cleaning Data Course Project
## Download and unzip data set files if it has not already been done
## Check for directory
if(!file.exists("./projectData")){dir.create("./projectData")
}
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Check if Data has been downloaded
if(!file.exists("./projectData/Dataset.zip")){
download.file(Url,destfile="./projectData/Dataset.zip",mode = "wb")
}
## Check if Data has been unzipped
if(!file.exists("./projectData/UCI HAR Dataset")){
  unzip(zipfile="./projectData/Dataset.zip",exdir="./projectData")
}
## List Files
path <- file.path("./projectData" , "UCI HAR Dataset")
files <- list.files(path, recursive=TRUE)

## Read Files
YTest  <- read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
YTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
SubTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
SubTest  <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
XTest  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
XTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)

#1 Merges the training and the test sets to create one data set.
## Consolidate test and train tables
YData <- rbind(YTrain, YTest)
SubData <- rbind(SubTrain, SubTest)
XData <- rbind(XTrain, XTest)

## Assign Names to columns
names(SubData) <- c("subject")
names(YData) <- c("activity")
featureNames <- read.table(file.path(path, "features.txt"),head=FALSE)
names(XData) <- featureNames$V2

## Merge 3 data sets into one
d1 <- cbind(SubData, YData)
Data <- cbind(XData, d1)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.
## Subset names from features
subsetFeatureNames <- featureNames$V2[grep("mean\\(\\)|std\\(\\)", featureNames$V2)]
## Create a list containg the subset of feature names plus subject and activity
selectNames <- c(as.character(subsetFeatureNames), "subject", "activity")
## Use list created above to subset the Data 
Data <- subset(Data, select = selectNames)

#3 Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path, "activity_labels.txt"),header = FALSE)
Data$activity <- factor(Data$activity,labels=activityLabels[,2])

#4 Appropriately labels the data set with descriptive variable names.
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub(".std...", "StdDev", names(Data))
names(Data)<-gsub(".mean...", "Mean", names(Data))
names(Data)<-gsub(".std..", "StdDev", names(Data))
names(Data)<-gsub(".mean..", "Mean", names(Data))


#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData<-aggregate(. ~subject + activity, Data, mean)
tidyData<-tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE,quote = FALSE, sep = '\t')



