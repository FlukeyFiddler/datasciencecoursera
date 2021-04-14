library(dplyr)

# Path to the unzipped Activity tracker Data directory
dataPath <- "./data"

# Create the merged set in a function to avoid having alot of redundant, 
# big variables lying around
createMergedSet <- function(dataPath = "./data") {
    # Get the test data
    testSubjects <- read.table(file.path(dataPath, "test","subject_test.txt"))
    testMeasurements <- read.table(file.path(dataPath, "test","X_test.txt"))
    testActivities <- read.table(file.path(dataPath, "test","y_test.txt"))
    
    # Get the train data
    trainSubjects <- read.table(file.path(dataPath, "train","subject_train.txt"))
    trainMeasurements <- read.table(file.path(dataPath, "train","X_train.txt"))
    trainActivities <- read.table(file.path(dataPath, "train","y_train.txt"))
    
    # Merge the test and train data
    subjects <- rbind(testSubjects,trainSubjects)
    measurements <- rbind(testMeasurements, trainMeasurements)
    activities <- rbind(testActivities, trainActivities)
    
    # Add labels
    measurementFeatures <- read.table(file.path(dataPath, "features.txt"))
    
    names(subjects) <- "subject"
    names(measurements) <- measurementFeatures[,2]
    names(activities) <- "activity"
    
    mergedSet <- cbind(subjects, activities, measurements)
}

### Requirement
# 1. Merges the training and the test sets to create one data set.
mergedSet <- createMergedSet()

### Requirement
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
stdMeansSet <- select(mergedSet, subject, activity, grep("mean\\(|std\\(", names(mergedSet)))

# 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
descriptiveActivitiesSet <- mutate(stdMeansSet, activity = activityLabels[activity,2])

# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

