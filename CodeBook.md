# CodeBook for the Tidy Dataset

This CodeBook describes the variables, data, and transformations performed to create the tidy dataset (`tidy_data.txt`) from the Human Activity Recognition Using Smartphones Dataset.

---

## **1. Data Description**

The Human Activity Recognition Using Smartphones Dataset provides data for studying human activity recognition (HAR) using wearable devices. The dataset was collected from 30 participants (ages 19–48) performing six activities while wearing a waist-mounted Samsung Galaxy S II smartphone.

### **Activities**
The dataset captures six activities:
- **WALKING**
- **WALKING_UPSTAIRS**
- **WALKING_DOWNSTAIRS**
- **SITTING**
- **STANDING**
- **LAYING**

### **Sensors and Data**
- **Sensors**: Triaxial accelerometer and gyroscope.
- **Sampling**: 50Hz with 2.56-second sliding windows (50% overlap).
- **Preprocessing**:
  - Noise reduction using median and Butterworth filters.
  - Signals separated into body motion and gravity components.
  - Additional derived signals: jerk (time derivatives) and magnitudes (Euclidean norms).

### **Features**
- **561 features** were extracted, including:
  - Statistical measures (mean, standard deviation).
  - Signal properties (Signal Magnitude Area, correlation, frequency skewness, etc.).
  - Features span time and frequency domains.

### **Dataset Structure**
- Partitioned into **70% training** and **30% testing** sets.
- Each record includes:
  - **Subject ID** (1–30).
  - **Activity label**.
  - 561 feature measurements.

This dataset serves as a benchmark for evaluating activity recognition methods and is publicly available via the UCI Machine Learning Repository.

---

## **2. Variables in the Tidy Dataset**

The tidy dataset contains the following variables:

1. **Subject**: Identifier for the participant (values: 1–30).
2. **Activity**: Descriptive label for the activity performed:
   - WALKING
   - WALKING_UPSTAIRS
   - WALKING_DOWNSTAIRS
   - SITTING
   - STANDING
   - LAYING
3. **Feature Columns**: Measurements derived from the smartphone's accelerometer and gyroscope. Examples:
   - `TimeBodyAccelerometerMeanX`: Mean value of body acceleration along the X-axis (time domain).
   - `FrequencyBodyGyroscopeSTDZ`: Standard deviation of gyroscope angular velocity along the Z-axis (frequency domain).
   - Additional features follow a similar naming structure.

---

## **3. Transformations**

The following steps were performed to process and clean the dataset:

1. **Merging Datasets**:
   - Combined training and test datasets, including measurements, activity labels, and subject identifiers.

2. **Extracting Relevant Features**:
   - Selected only features related to mean and standard deviation.

3. **Descriptive Naming**:
   - Cleaned and standardized variable names for clarity:
     - Replaced abbreviations (e.g., `Acc` → `Accelerometer`, `Gyro` → `Gyroscope`).
     - Removed parentheses and unnecessary characters.

4. **Labeling Activities**:
   - Replaced activity codes with descriptive labels from `activity_labels.txt`.

5. **Creating a Tidy Dataset**:
   - Reshaped the dataset to calculate the average of each measurement for each `Subject` and `Activity`.

---

## **4. Data Source**

The original dataset is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).