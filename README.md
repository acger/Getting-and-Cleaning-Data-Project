# Getting and Cleaning Data Project

## Description
The script for creating a tidy data set from raw data (*run_analysis.R*). The script downloads the raw data, unzips it, performs some processing and saves the result to a file.

## Running the script
The script uses its current directory as the working directory. As long as you are happy with this default option, you don't need to make any modifications to the script.
All needed directories are created by the script.

## Transformation
The scripts loads all data from *test* and *train* files. The columns for the loaded data are merged in two data frames (one for *test and one for *train*). The column names are replaced with the values in *features.txt* to make them better readable.
The two data frames are merged in one big data frame. After this the values (ids for activities) are replaced by the values from *activity_labels.txt*.
The data set is filtered so that only the subject id, the activity labels, and the feature columns containing the *mean* or the *std* of a feature is preserved.
Finally the feature values are more summarized by creating the average for the data by grouping them by *subject id* and *activity*.

The detailed description of the transformations performed by the script can be found in the codebook (codebook.md).


## Result
The result is writte to the file *data/data2.txt*.

