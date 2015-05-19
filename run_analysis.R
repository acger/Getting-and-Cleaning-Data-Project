# Cleanup
rm(list=ls())

# Set working directory
setwd(".")

# Download and unzip the data

# URL of the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFileName <- "data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("./data")) { dir.create("data") }

# Download zip file if its missing
if(!file.exists(zipFileName)) {
        download.file(url, zipFileName, mode = "wb")
}

unzip(zipFileName, exdir = "data")


# Load meta data
features_names <- read.table("data/UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt")

# Function for loading and preprocessing the data sets
#
# 1. load the data sets
# 2. Appropriately labels the data set with descriptive variable names.
# 3. bind the data sets to one data frame
#
# Argument is the data type "train" or "test"
# Returns a data frame with all columns
loadData <- function(type) {
        # Load data sets
        data_path <- paste("data", "UCI HAR Dataset", type, sep = "/")
        train_subject <- read.table(paste(data_path, paste("subject_", type, ".txt", sep = ""), sep = "/"))
        train_x <- read.table(paste(data_path, paste("X_", type, ".txt", sep = ""), sep = "/"))
        train_y <- read.table(paste(data_path, paste("y_", type, ".txt", sep = ""), sep = "/"))
        
        # Appropriately labels the data set with descriptive variable names.
        colnames(train_subject) <- c("subject_id")
        colnames(train_x) <- features_names[, 2]
        colnames(train_y) <- c("activity_labels")
        
        # Build one data frame from the loaded data
        cbind(train_subject, train_y, train_x) 
}

# Build data frame with training data set
train_data <- loadData("train")

# Build data frame with test data set
test_data <- loadData("test")


# Merges the training and the test sets to create one data set.
data_merged <- rbind(train_data, test_data)


# Extracts only the measurements on the mean and standard deviation for each measurement. 
selected_columns <- append(c(1, 2), grep("mean\\(|std\\(", colnames(data_merged)))
data_selected <- data_merged[, selected_columns]


# Uses descriptive activity names to name the activities in the data set
data_selected$activity_labels <- activity_labels[data_selected$activity_labels, 2]


# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data2 <- aggregate(data_selected[, 3:ncol(data_selected)], by=list(subject_id=data_selected$subject_id, activity_labels=data_selected$activity_labels), FUN=mean)

# Write new data set
write.table(data2, "data/data2.txt", row.names = FALSE)
