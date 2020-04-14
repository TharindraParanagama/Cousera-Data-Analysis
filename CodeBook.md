----------------------------------------------------------------------------------------------------
Step 1:Import Libraries

The necessary libraries were imported(i.e.readtext,dplyr)

1.readtext-used for import and handling for plain and formatted text files
2.dplyr-used as a grammar of data manipulation

Step 2:Import Data 

Imported X_train and Y_train text files via read.table().These imported data were stored in train_features and train_labels, R dataframes respectively.similarly the test data in X_test and Y_test,subject data in subject_train and subject_test text files were saved to test_features, test_labels,subject_train and subject_test R dataframes respectively.

Step 3:Creating A Single Dataset For Analysis

The training data(i.e.train_features,train_labels,subject_train) were combined together using cbind and assigned to train_dataset.The same process was performed on the test portion combining test data(i.e.test_features,test_labels,subject_test) and assigning it to test_dataset.

finally the train_dataset and test_dataset was subject to rbind to create a single dataset stored in final_dataset.

Step 4:Manipulating the final dataset

Inorder to create a header for the final dataset.I read the feature names(i.e.stored in feature_names) listed on features.txt(i.e.provided with UCI HAR DAtaset) converted it from factor to character and added the two additional column names "activity_label"-the activity the subject was subject to,"subject_number"-the subject's subject number assigned, which were not part of the features.This result was stored in header.

Once the header was created for 563 variables.The column names of final_dataset was updated
accordingly.

Step 5:Extracting the required measurements

Using the grep function I used the regular expression *mean*,*std* to search for measurements associated with mean and standard deviation in the hearder names and return the indices of the locations these matches were found.The extracted indices for mean measurements were stored in mean_measurement and for std measurement in std_measurements.

Step 6:Creating a subset

To create a dataset that only contains this measurements,I passed these column indices along with the column indices for activity_label-index 562 and subject_number-index-563 to the final dataset to subset the required columns only.This dadaset was stored in subset variable.

Step 7:Assigning descriptive activity labels

After reading the data from activity_labels.txt(i.e.provided with UCI HAR DAtaset) and storing it in label_map.Afterwards updated the column names of label map to descriptive and column names(i.e.activity_label,activity_name).

performed an inner_join to create a column with descriptive activity names,by joining subset dataset and label_map on the common activity_label field.saved the joined data to joined_data.

Updated the joined data table with the necessary columns by dropping activity_label field which was no longer important,since the descriptive activity name was added.The remaining data were stored in updated dataset.

Step 8:Computing the average of each variable for each activity and each subject.

extracted the column names from the updated dataset and stored in column_names.obtained the subset of columns for which are numeric and for which the mean should be computed.stored the subset columns in subset_col_names.

used the chain of commands associated with the pipe characted to first the group the data in updated _dataset by subject_number and activity_name fields.Then the obtained results were summarized by computing the mean on the variables specified in the vars function as an argument(i.e.passed the subset_col_names).The final summarized mean on the grouping was stored in result variable.

------------------------------------------------------------------------------------------------------

Extracted features that correspond to mean and standard deviation measures from the final_dataset.

Dimensions of the final_dataset:10299 Observations/rows and 563 columns/variables(561 original features+activity_label+subject_number)

Dimensions of the summarized_result:180 observations/rows and 81 columns/variables(79 original feature measures mean/std+activity_name+subject_number)

Listed below are the 79 features extracted accordingly.The below features are based on the following readings obtained for the triaxels.

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.

Features
---------
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()
fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-meanFreq()
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-std()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-std()

Additional two columns

activity_label-A factor that stores the corresponding level of activity from the available 6 levels.
subject_number-The number assigned to each subject from a sample of 30 subjects.