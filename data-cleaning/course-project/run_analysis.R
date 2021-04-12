# Path to the unzipped Activity tracker Data directory
dataPath <- "./data"

# Merges the training and the test sets to create one data set.
mergeSets <- function(dataPath = './data') {
    featureLabels <- read.table(file.path(dataPath, "features.txt"))
    activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
    
    # Get the test data
    testSubjects <- read.table(file.path(dataPath, "test","subject_test.txt"))
    testFeatureReadings <- read.table(file.path(dataPath, "test","X_test.txt"))
    testActivities <- read.table(file.path(dataPath, "test","y_test.txt"))
    
    # Get the train data
    trainSubjects <- read.table(file.path(dataPath, "train","subject_train.txt"))
    trainFeatureReadings <- read.table(file.path(dataPath, "train","X_train.txt"))
    trainActivities <- read.table(file.path(dataPath, "train","y_train.txt"))
    
    # Now merge all the data
    
}

# Extracts only the measurements on the mean and standard deviation for each measurement. 

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive variable names. 

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

