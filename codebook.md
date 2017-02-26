## Feature Selection and Data Processing
 
A description of the project can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
Raw data was obtained from the zip file at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . 
A detailed description of how the data was aquired and individual observations were processed can be found in the features_info.txt file within this zip file.

Raw data was downloaded, combined, filtered and averaged using the run_analysis.R script from the following Github repo as described in the corresponding Readme.md file:
https://github.com/lars-von-buchholtz/DataCleaning

Only mean and standard deviation of each measurement feature were retained. Data was averaged by subject and activity type and written to a text file that can be read with read.table("UCIHAR_averaged.txt",header = TRUE). Each line corresponds to averaged information about one activity type performed by one subject.

### Notes:
meanFreq() was discarded from the study because it doesn't reflect the mean of the sample
angles were discarded from the study even when they contained mean vectors because they are further computations of the data, not means themselves

## Variables

The following naming pattern is used:

Variable names starting with 't' denote time domain data; variables starting with 'f' denote frequency domain data.
'mean()' or 'std()' denotes the mean and standard deviation of the sampled data, respectively
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


* _subject_:  experimental subject number
* _activity_: activity description [WALKING|WALKING_UPSTAIRS|WALKING_DOWNSTAIRS|SITTING|STANDING|LAYING]
* _tBodyAcc-mean()/std()-XYZ_: mean or standard deviation of specified coordinate of Body Acceleration
* _tGravityAcc-mean()/std()-XYZ_: mean or standard deviation of specified coordinate of Gravity Acceleration
* _tBodyAccJerk-mean()/std()-XYZ_: mean or standard deviation of specified coordinate of Jerk Signal from Accelerometer
* _tBodyGyro-mean()/std()-XYZ_:  mean or standard deviation of specified coordinate of Gyroscope signal
* _tBodyGyroJerk-mean()/std()-XYZ_: mean or standard deviation of specified coordinate of Jerk Signal from Gyroscope
* _tBodyAccMag-mean()/std()_: mean or standard deviation of magnitude of Body Acceleration
* _tGravityAccMag-mean()/std()_: mean or standard deviation of magnitude of Gravity Acceleration
* _tBodyAccJerkMag-mean()/std()_: mean or standard deviation of magnitude of Jerk signal from Accelerometer
* _tBodyGyroMag-mean()/std()_: mean or standard deviation of magnitude of Gyroscope signal
* _tBodyGyroJerkMag-mean()/std()_: mean or standard deviation of magnitude of Jerk signal from Gyroscope
* _fBodyAcc-XYZ-mean()/std()_: mean and standard deviation of fast fourier transform of tBodyAcc
* _fBodyAccJerk-XYZ-mean()/std()_: mean and standard deviation of fast fourier transform of tBodyAccJerk
* _fBodyGyro-XYZ-mean()/std()_: mean and standard deviation of fast fourier transform of tBodyGyro
* _fBodyAccMag-mean()/std()_: mean and standard deviation of fast fourier transform of tBodyAccMag
* _fBodyAccJerkMag-mean()/std()_: mean and standard deviation of fast fourier transform of tBodyAccJerkMag
* _fBodyGyroMag-mean()/std()_: mean and standard deviation of fast fourier transform of tBodyGyroMag
* _fBodyGyroJerkMag-mean()/std()_: : mean and standard deviation of fast fourier transform of tBodyGyroMag



