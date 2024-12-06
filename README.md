# README for the `run_analysis.R` Script

## **Purpose**

The `run_analysis.R` script processes and cleans the Human Activity Recognition Using Smartphones Dataset to create a tidy dataset (`tidy_data.txt`). This tidy dataset contains the average of mean and standard deviation measurements for each activity and subject, providing a summary for further analysis.

---

## **Files Included**

1. **run_analysis.R**: The primary R script that performs data cleaning, transformation, and summarization.
2. **tidy_data.txt**: The output tidy dataset, saved in a tab-delimited text format.
3. **CodeBook.md**: A detailed description of the variables, dataset structure, and transformations applied.

---

## **Steps Performed by the Script**

### **1. Downloading and Extracting Data**
   - Downloads the dataset from the provided URL.
   - Extracts the contents into the working directory as `UCI HAR Dataset`.

### **2. Loading and Merging Datasets**
   - Reads training and test datasets, including:
     - Measurement data (`X_train` and `X_test`).
     - Activity labels (`y_train` and `y_test`).
     - Subject identifiers (`subject_train` and `subject_test`).
   - Combines these datasets into a single data table for all participants.

### **3. Selecting Relevant Features**
   - Extracts measurements on the mean (`mean()`) and standard deviation (`std()`) for each signal using feature names provided in `features.txt`.

### **4. Labeling Data**
   - Assigns descriptive variable names to measurement columns:
     - Replaces abbreviations (e.g., `Acc` → `Accelerometer`, `Gyro` → `Gyroscope`).
     - Cleans variable names for readability (e.g., removing parentheses).
   - Replaces activity codes (e.g., `1`) with descriptive activity names (e.g., `WALKING`) using `activity_labels.txt`.

### **5. Creating a Tidy Dataset**
   - Reshapes the combined dataset to a long format using `melt()`.
   - Aggregates the data to calculate the mean of each variable for every combination of `Subject` and `Activity`.

### **6. Saving the Output**
   - Writes the final tidy dataset to `tidy_data.txt`, ensuring it is reusable for further analysis.

---

## **How Components are Connected**

1. **Raw Dataset**:
   - The script begins by downloading and extracting the raw dataset.
   - Metadata files (`activity_labels.txt` and `features.txt`) are used to guide feature selection and labeling.

2. **Data Loading and Merging**:
   - Measurement, activity, and subject data from both training and test sets are loaded and combined.

3. **Data Transformation**:
   - Features are filtered to retain only mean and standard deviation measurements.
   - Descriptive activity names and variable labels are assigned to improve interpretability.

4. **Output**:
   - A tidy dataset (`tidy_data.txt`) is generated with the mean of each measurement for each activity and subject.

---

## **How to Run the Script**

1. **Prepare the Environment**:
   - Place the `run_analysis.R` script in your working directory.
   - Install the required R packages if not already installed:
     ```R
     install.packages(c("data.table", "reshape2"))
     ```

2. **Execute the Script**:
   - Run the script in R or RStudio:
     ```R
     source("run_analysis.R")
     ```

3. **Output**:
   - The script will generate `tidy_data.txt` in the working directory.

---

## **License**

The original dataset is licensed under the [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).