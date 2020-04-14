----------------------------------------------------------------------------------------------------
**Step 1:Import Libraries**
================================================
The necessary libraries were imported first _(i.e.readtext,dplyr)_

1. *readtext*-used for import and handling for plain and formatted text files
2. *dplyr*-used as a grammar of data manipulation

**Step 2:Import Data** 
================================================
Imported *X_train* and *Y_train* text files via *read.table()*.These imported data were stored in **train_features** and **train_labels**, R dataframes respectively.similarly the test data in *X_test* and *Y_test*,subject data in *subject_train* and *subject_test* text files were saved to **test_features**, **test_labels**, **subject_train** and **subject_test** R dataframes respectively.

**Step 3:Creating A Single Dataset For Analysis**
================================================
The training data(i.e.train_features,train_labels,subject_train) were combined together using cbind and assigned to **train_dataset**.The same process was performed on the test portion combining test data(i.e.test_features,test_labels,subject_test)  and assigning it to **test_dataset**.

Finally the train_dataset and test_dataset was subject to rbind to create a single dataset stored in **combined_dataset**.

**Step 4:Manipulating the final dataset**
================================================
Inorder to create a header for the final dataset.I read the feature names(i.e.stored in feature_names) listed on features.txt(i.e.provided with UCI HAR DAtaset) converted it from factor to character and added the two additional column names _"activity_label"_-the activity the subject was subject to,_"subject_number"_-the subject's subject number assigned, which were not part of the features.This result was stored in **header**.

Once the header was created for _563 variables_.The column names of **combined_dataset** was updated
accordingly.

**Step 5:Extracting the required measurements**
================================================

Using the grep function I used the regular expression _*mean*,*std*_ to search for measurements associated with mean and standard deviation in the header names and return the indices of the locations these matches were found.The extracted indices for mean measurements were stored in **mean_measurement** and for standard deviation measurement in **std_measurements**.

**Step 6:Creating a subset**
================================================
To create a dataset that only contains this measurements,I passed these column indices along with the column indices for _activity_label-index 562_ and _subject_number-index-563_ to the combined_dataset to subset the required columns only.This dadaset was stored in **subset_combined_dataset** variable.

**Step 7:Assigning descriptive activity labels**
================================================
After reading the data from _activity_labels.txt(i.e.provided with UCI HAR DAtaset)_ and storing it in **label_map**.Afterwards updated the column names of label map to descriptive and column names(i.e.activity_label,activity_name).

performed an inner_join to create a column with descriptive activity names,by joining subset dataset and label_map on the common activity_label field.saved the joined data to **joined_data**.

Updated the joined data table with the necessary columns by dropping activity_label field which was no longer important,since the descriptive activity name was added.The remaining data were stored in **updated_dataset**.

**Step 8:Computing the average of each variable for each activity and each subject**
================================================
Extracted the column names from the updated dataset and stored in **column_names**.obtained the subset of columns for which are numeric and for which the mean should be computed.stored the subset columns in **subset_col_names**.

Used the chain of commands associated with the pipe characted to first the group the data in updated _dataset by subject_number and activity_name fields.Then the obtained results were summarized by computing the mean on the variables specified in the vars function as an argument(i.e.passed the subset_col_names).The final summarized mean on the grouping was stored in **summarized_result** variable.

------------------------------------------------------------------------------------------------------

Information on the datasets created in analysis the process.
------------------------------------------------------------
1. **combined_dataset**:dataset with combined train(train features,train activity labels.train subject number) and test data(test features,test activity labels.test subject number) but before subsetting by the measurements of mean and std.

2. **subset_combined_dataset**:the datset that was obtained after subsetting the final_dataset on mean and std measurements and preserving the activity_label and subject_number.

3. **updated_dataset**:the dataset that was obtained by adding a seperate column to hold the descriptive status of the activity(i.e.activity_name field) and dropping the activity label column.

4.  **summarized_result**:this contains the dataset that has been grouped by activity and subject and summarized by the mean on all variables.

> Dimensions of the combined_dataset:10299 observations/rows and 563 columns/variables(561 original features+activity_label+subject_number)_

> Dimensions of the subset_combined_dataset:10299 observations/rows and 81 columns/variables(79 original feature measures mean/std+activity_label+subject_number)

> Dimensions of the updated_dataset:10299 observations/rows and 81 columns/variables(79 original feature measures mean/std+activity_name+subject_number)

> Dimensions of the summarized_result:180 observations/rows and 81 columns/variables(79 original feature measures mean/std+activity_name+subject_number)

Listed below are the 79 features extracted accordingly.The below features are based on the following readings obtained for the triaxels.

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.

Features
---------
1. tBodyAcc-mean()-X
2. tBodyAcc-mean()-Y
3. tBodyAcc-mean()-Z
4. tGravityAcc-mean()-X
5. tGravityAcc-mean()-Y
6. tGravityAcc-mean()-Z
7. tBodyAccJerk-mean()-X
8. tBodyAccJerk-mean()-Y
9. tBodyAccJerk-mean()-Z
10. tBodyGyro-mean()-X
11. tBodyGyro-mean()-Y
12. tBodyGyro-mean()-Z
13. tBodyGyroJerk-mean()-X
14. tBodyGyroJerk-mean()-Y
15. tBodyGyroJerk-mean()-Z
16. tBodyAccMag-mean()
17. tGravityAccMag-mean()
18. tBodyAccJerkMag-mean()
19. tBodyGyroMag-mean()
20. tBodyGyroJerkMag-mean()
21. fBodyAcc-mean()-X
22. fBodyAcc-mean()-Y
23. fBodyAcc-mean()-Z
24. fBodyAcc-meanFreq()-X
25. fBodyAcc-meanFreq()-Y
26. fBodyAcc-meanFreq()-Z
27. fBodyAccJerk-mean()-X
28. fBodyAccJerk-mean()-Y
29. fBodyAccJerk-mean()-Z
30. fBodyAccJerk-meanFreq()-X
31. fBodyAccJerk-meanFreq()-Y
32. fBodyAccJerk-meanFreq()-Z
33. fBodyGyro-mean()-X
34. fBodyGyro-mean()-Y
35. fBodyGyro-mean()-Z
36. fBodyGyro-meanFreq()-X
37. fBodyGyro-meanFreq()-Y
38. fBodyGyro-meanFreq()-Z
39. fBodyAccMag-mean()
40. fBodyAccMag-meanFreq()
41. fBodyBodyAccJerkMag-mean()
42. fBodyBodyAccJerkMag-meanFreq()
43. fBodyBodyGyroMag-mean()
44. fBodyBodyGyroMag-meanFreq()
45. fBodyBodyGyroJerkMag-mean()
46. fBodyBodyGyroJerkMag-meanFreq()
47. tBodyAcc-std()-X
48. tBodyAcc-std()-Y
49. tBodyAcc-std()-Z
50. tGravityAcc-std()-X
51. tGravityAcc-std()-Y
52. tGravityAcc-std()-Z
53. tBodyAccJerk-std()-X
54. tBodyAccJerk-std()-Y
55. tBodyAccJerk-std()-Z
56. tBodyGyro-std()-X
57. tBodyGyro-std()-Y
58. tBodyGyro-std()-Z
59. tBodyGyroJerk-std()-X
60. tBodyGyroJerk-std()-Y
61. tBodyGyroJerk-std()-Z
62. tBodyAccMag-std()
63. tGravityAccMag-std()
64. tBodyAccJerkMag-std()
65. tBodyGyroMag-std()
66. tBodyGyroJerkMag-std()
67. fBodyAcc-std()-X
68. fBodyAcc-std()-Y
69. fBodyAcc-std()-Z
70. fBodyAccJerk-std()-X
71. fBodyAccJerk-std()-Y
72. fBodyAccJerk-std()-Z
73. fBodyGyro-std()-X
74. fBodyGyro-std()-Y
75. fBodyGyro-std()-Z
76. fBodyAccMag-std()
77. fBodyBodyAccJerkMag-std()
78. fBodyBodyGyroMag-std()
79. fBodyBodyGyroJerkMag-std()

_Additional two columns_

80. activity_label-A factor that stores the corresponding level of activity from the available 6 levels.
81. subject_number-The number assigned to each subject from a sample of 30 subjects.
