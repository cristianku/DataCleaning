## Introduction

The script run_analysis.R processes data from Smartphone Sensors.
A description of the project that collected the raw data can be found at  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
Raw data was obtained from the zip file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
A detailed description of how the data was aquired and individual observations were processed can be found in the features_info.txt file within this zip file.

## Code Description

Raw data is downloaded as a zip file from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", unzipped and relevant text files are read into dataframes. Data from corresponding files in the training and testing dataset are combined rowwise using the rbind() function.
Column variables are then assigned from the features.txt file. Irrelevant columns that don't contain information about means or standard deviations are being discarded. Columns for subject number and activity performed during the measurement are being added to the dataframe using cbind(). Numeric codes for activities are replaced by a factor with descriptive labels. The resulting dataframe 'tidytable' contains only tidy data.

A second tidy dataframe 'tidyaveraged' is created which in each line contains the averaged means and standard deviations for each subject/activity combination.

This dataframe is finally written to a text file 'UCIHAR_averaged.txt' that can be read with read.table("UCIHAR_averaged.txt",header = TRUE). Each line corresponds to averaged information about one activity type performed by one subject.

# Notes:
meanFreq() was discarded from the study because it doesn't reflect the mean of the sample
angles were discarded from the study even when they contained mean vectors because they are further computations of the data, not means themselves

