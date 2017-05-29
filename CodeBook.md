# Code Book
This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.

## About the data
The data was collected from the accelerometers from the Samsung Galaxy S smartphone. Human Activity Recognition database 
built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone 
with embedded inertial sensors.

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Variables :
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
, tGravityAcc-XYZ
, tBodyAccJerk-XYZ
, tBodyGyro-XYZ
, tBodyGyroJerk-XYZ
, tBodyAccMag
, tGravityAccMag
, tBodyAccJerkMag
, tBodyGyroMag
, tBodyGyroJerkMag
, fBodyAcc-XYZ
, fBodyAccJerk-XYZ
, fBodyGyro-XYZ
, fBodyAccMag
, fBodyAccJerkMag
, fBodyGyroMag
, fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
, std(): Standard deviation
, mad(): Median absolute deviation 
, max(): Largest value in array
, min(): Smallest value in array
, sma(): Signal magnitude area
, energy(): Energy measure. Sum of the squares divided by the number of values. 
, iqr(): Interquartile range 
, entropy(): Signal entropy
, arCoeff(): Autorregresion coefficients with Burg order equal to 4
, correlation(): correlation coefficient between two signals
, maxInds(): index of the frequency component with largest magnitude
, meanFreq(): Weighted average of the frequency components to obtain a mean frequency
, skewness(): skewness of the frequency domain signal 
, kurtosis(): kurtosis of the frequency domain signal 
, bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
, angle(): Angle between to vectors.

# Transformations to clean the data:
Downloaded zip file to "data" directory.
Unziped file
Read Test data: X_test.txt, y_test.txt and subject_test.txt files.

Read Train data: X_train.txt, y_train.txt and subject_train.txt files.

Read features and activity_labels data: features.txt, activity_labels.txt files.

Renamed columns V1 in ytest and yrain before merging

Renamed columns V1 in subjecttest and subjecttrain before merging

Renamed columns V1 and V2 in activity as Identifiers before merging

Renamed all columns in xtrain and xtest with features names before merging

Merged Test and train columns from ytest, subjtest, xtest and ytrain, subjtrain, xtrain

Merged the training and the test datasets to create one dataset.

Extracted only the measurements of interest:  mean and standard deviation for each measurement.

Used descriptive activity names to name the activities in the data set
                        )
Labeled the data set with descriptive variable names and

Created a tidy dataset with average for each activity/subject and named it "tidyDataset.txt" .
