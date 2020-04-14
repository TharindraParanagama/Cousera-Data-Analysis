# Cousera-Data Analysis
This repo provides an analysis of the Human Activity Recognition Using Smartphones Data Set and provides details on the analysis steps.

The dataset for this analysis was obtained from the UCI Machine Learning Repository:
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Understanding the dataset:

How data was collected-
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

This dataset has 591 features(number of columns in X_train.txt or X_test.txt) and 10299 observations(number of rows in X_train.txt+X_test.txt)

UCI HAR Dataset folder(In this Repo) has folders train,test and files features.txt and activity_labels.txt.The train folder has the X_train.txt(the train data with 7352 Observations and 591 columns),Y_train.txt(holds the asssociated activity labels for each observation in X_train.txt with 7352 Observations and 1 column),subject_train(holds the subject number for each observation in X_train.txt with 7352 Observations and 1 column).

Similarly the test folder has it's equivalents files.It's important to pay attention to the dimentions of different dataset before combining to make sure the combined result is meaningful.

features.txt-contains the names of the 591 features of the dataset and activity_labels.txt contains the six possible levels/activities of the activity label factor variable.

Inorder for a dataset to be tidy it should satisfy the following three principles.[Reference](https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html)

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

when considering X_train.txt or X_test.txt it's clear that the number of columns agree with the number of features of the feature.txt file.Assuming the data for each variable is accurately gathered and recorded.The first principle will be satisfied.

When considering the total number of rows in X_train.txt & X_test.txt it tallies with the total number of observatsions.Which means each observation has been presentaed as a seperate row.Assuming there were no errors in data gethering and recording.Thus the second principle also holds true.

But to make sure the third principle is true we need to embed the activity_label and subject data with the dataset.Therefore when combining the data it's important to make sure the first two priciples are not violated when trying to satisft the third.

Therefore it's important to pay attention to the dimension of the data when combining data.Therefore I first combined the training data with it's activity labels and subject data on a column wise basis.Same was doe for test data also.Later I appended the test dataset to the train dataset.Now each row contains an observational unit: a subject's measures on a particular activity.


1. **CodeBook.md**-contains the steps taken to arrive at the _summarized_result.txt_ file in **run_analysis.R** along with description on intermediate variables been created.Which holds the average of each variable for each activity and each subject.

2. **run_analysis.R**-holds the R script or implementation that was used to arrive at _summarized_result.txt_.
