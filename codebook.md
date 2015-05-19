# Codebook

## Description
The script for creating a tidy data set from raw data (*run_analysis.R*). The script downloads the raw data, unzips it, performs some processing and saves the result to a file.

## Running the script
The script uses its current directory as the working directory. As long as you are happy with this default option, you don't need to make any modifications to the script.

## Source data
The source data contains sensor data from a smartphone carried by some volunteers while performing some activity like walking or sitting. The full description of the experiment and the source data set can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data is downloaded by the script from the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Transformations steps performed
Loading, preprocessing and transformation is performed by the R script. The script does the following:

* Merges the training and the test sets to create one data set.
    * Joins the columns from the three files *subject_train.txt*, *x_train.txt* and *y_train.txt*
    * Joins the columns from the three files *subject_test.txt*, *x_test.txt* and *y_test.txt*
    * merges the two data frames *test* and *train* to one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. (filtered by variable name "std(" or "mean(") 
* Uses descriptive activity names to name the activities in the data set. (taken from *activity_labels.txt*)
* Appropriately labels the data set with descriptive variable names.  (taken from *features.txt*)
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data set is stored in the file *data/data2.txt*.

## Result data set description

### ID and activity labels

#### Column "subject_id"
Id of the subject which performed the experiments.


#### Column "activity_label"
Activity performed which is one of the following:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

### Columns
Mean of the original values grouped by *subject_id* and *activity_label*.

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

