# get data from zip file
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "data.zip"))
unzip(zipfile = "data.zip")

# Step 1: Load and Merge Datasets
# Define file paths
path <- "UCI HAR Dataset"

# Load activity labels and features
activity_labels <- fread(file.path(path, "activity_labels.txt"), col.names = c("classLabels", "activityNames"))
features <- fread(file.path(path, "features.txt"), col.names = c("index", "featureNames"))

# Identify features with mean and standard deviation
features_needed <- grep("(mean|std)\\(\\)", features$featureNames)
measurements <- features[features_needed, featureNames]

# Clean up variable names
measurements <- gsub("^t", "Time", measurements)
measurements <- gsub("^f", "Frequency", measurements)
measurements <- gsub("Acc", "Accelerometer", measurements)
measurements <- gsub("Gyro", "Gyroscope", measurements)
measurements <- gsub("Mag", "Magnitude", measurements)
measurements <- gsub("BodyBody", "Body", measurements)
measurements <- gsub("\\(\\)", "", measurements)

# Load and merge training data
train_data <- fread(file.path(path, "train/X_train.txt"))[, features_needed, with = FALSE]
setnames(train_data, colnames(train_data), measurements)
train_labels <- fread(file.path(path, "train/y_train.txt"), col.names = "Activity")
train_subjects <- fread(file.path(path, "train/subject_train.txt"), col.names = "Subject")

train <- cbind(train_subjects, train_labels, train_data)

# Load and merge test data
test_data <- fread(file.path(path, "test/X_test.txt"))[, features_needed, with = FALSE]
setnames(test_data, colnames(test_data), measurements)
test_labels <- fread(file.path(path, "test/y_test.txt"), col.names = "Activity")
test_subjects <- fread(file.path(path, "test/subject_test.txt"), col.names = "Subject")

test <- cbind(test_subjects, test_labels, test_data)

# Combine training and test data
combined_data <- rbind(train, test)

# Step 2: Use Descriptive Activity Names
combined_data[, Activity := factor(Activity, levels = activity_labels$classLabels, labels = activity_labels$activityNames)]

# Step 3: Create a Tidy Dataset with Averages
# Melt the data into a long format
melted_data <- melt(combined_data, id.vars = c("Subject", "Activity"))

# Cast the data into a tidy dataset with averages
tidy_data <- dcast(melted_data, Subject + Activity ~ variable, mean)

# Step 4: Save the Tidy Dataset
fwrite(tidy_data, file = "tidy_data.txt", row.names = FALSE)