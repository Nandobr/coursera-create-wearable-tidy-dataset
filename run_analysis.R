## Peer-graded Assignment Project:
## 1- Merges the training and the test sets to create one data set.
## 2- Extracts only the measurements on the mean and standard deviation for each measurement.
## 3- Uses descriptive activity names to name the activities in the data set
## 4- Appropriately labels the data set with descriptive variable names.
## 5- From the data set in step 4, creates a second, independent tidy data set with the average
##    of each variable for each activity and each subject.
##
## set working directory
setwd("~/R_coursera/Getting and Cleaning Data")
## Check if directory data exists
if (!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download zip file
download.file(fileUrl,destfile = "./data/ActivityDataset.zip")
## unzip file
unzip(zipfile = "./data/ActivityDataset.zip", exdir = "./data")

## Reading Test and Train data
xtest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjtest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
xtrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjtrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
## Reading features and activity_labels
features <- read.table("./data/UCI HAR Dataset/features.txt")
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## renaming columns V1 in ytest and yrain before merging
colnames(ytest) <- "IDactivity"
colnames(ytrain) <- "IDactivity"

## renaming columns V1 in subjecttest and subjecttrain before merging
colnames(subjtest) <- "IDsubject"
colnames(subjtrain) <- "IDsubject"

## renaming columns V1 and V2 in activity before merging
colnames(activity) <- c("IDactivity", "activityname")

## renaming all columns in xtrain and xtest with features names before merging
colnames(xtest) <- features[,2]
colnames(xtrain) <- features[,2]

## Merging test and train columns 
mergedtrain <- cbind(ytrain, subjtrain, xtrain)
mergedtest <- cbind(ytest, subjtest, xtest)

## Merges the training and the test sets to create one data set.
## Merging test and train datasets in one dataset
mergeddata <- rbind(mergedtrain, mergedtest)

## Extracts only the measurements on the mean and standard deviation for each measurement.
allcolumnnames <- colnames(mergeddata)
meanstd <- (grepl("IDactivity", allcolumnnames) |
            grepl("IDsubject", allcolumnnames) |      
            grepl("mean", allcolumnnames) |
            grepl("std", allcolumnnames) 
            )
meanStdDataset <- mergeddata[,meanstd == TRUE]

## Uses descriptive activity names to name the activities in the data set
meanstdactivity <- merge(meanStdDataset, activity,
                         by="IDactivity", all.x = TRUE
                         )
## Appropriately labels the data set with descriptive variable names and
## Create a second tidy dataset with average for each activity/subject.
TidyDataset <- aggregate(. ~ IDsubject + IDactivity, meanstdactivity, mean)
write.table(TidyDataset, "TidyDataset.txt", row.name = FALSE)
