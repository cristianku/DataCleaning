## download zip file of raw data and unzip in working directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"uci.zip")
unzip("uci.zip")

## read all test and train data

ytest <- read.table("UCI HAR Dataset\\test\\y_test.txt") # activities (numbered)
stest <- read.table("UCI HAR Dataset\\test\\subject_test.txt") # subjects as a vector
xtest <- read.table("UCI HAR Dataset\\test\\X_test.txt")  # measurements as a table

ytrain <- read.table("UCI HAR Dataset\\train\\y_train.txt") # activities (numbered)
strain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")  # subjects as a vector
xtrain <- read.table("UCI HAR Dataset\\train\\X_train.txt")  # measurements as a table

## read variable names = features and number/activity mappings
features <- read.table("UCI HAR Dataset\\features.txt")
activities <- read.table("UCI HAR Dataset\\activity_labels.txt")

## combine test and train data for measurements, activities and subjects
x <- rbind(xtest,xtrain)
y <- rbind(ytest,ytrain)
s <- rbind(stest,strain)

## label columns appropriately
featurenames <- features[,2]
names(x) <- featurenames
names(s) <- "subject"
names(y) <- "activity"

## reduce columns of measurement fram to those that contain 'mean()' or 'std()'
xlimited <- x[,grep("(mean\\(\\)|std\\(\\))",featurenames)]

## combine columns from subject, activity and measurement into 1 tidy data frame
tidytable <- cbind(s,y,xlimited)

## convert numeric activity column into a factor with descriptive labels
tidytable$activity <- factor(tidytable$activity,levels = activities[,1],labels = activities[,2])

## aggregate the table by subject and activity, taking the mean for all measurements
tidyaveraged <- aggregate(tidytable[,3:68], by = list(subject = tidytable$subject,activity = tidytable$activity),FUN = mean)

## write table to file
write.table(tidyaveraged,"UCIHAR_averaged.txt",row.name=FALSE)