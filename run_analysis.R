#import the necesaary libraries for data reading
library(readtext)
library(dplyr)

#reading the features from the train dataset
train_features<-read.table("UCI HAR Dataset/train/X_train.txt")

#reading the labels from the train dataset
train_labels<-read.table("UCI HAR Dataset/train/Y_train.txt")

#reading the features from the test dataset
test_features<-read.table("UCI HAR Dataset/test/X_test.txt")

#reading the labels from the test dataset
test_labels<-read.table("UCI HAR Dataset/test/Y_test.txt")

#reading subject data in training set
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

#reading subject data in test set
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

#creating a single train dataset by combining train features & labels
train_dataset<-cbind.data.frame(train_features,train_labels,subject_train)

#creating a single train dataset by combining test features & labels
test_dataset<-cbind.data.frame(test_features,test_labels,subject_test)

#Combining the train and test sets to create a single dataset
final_dataset<-rbind.data.frame(train_dataset,test_dataset)

#reading feature.txt
feature_names<-read.table("UCI HAR Dataset/features.txt")

#creating a header for the final dataset
header<-c(as.character(feature_names$V2),"activity_label","subject_number")

#applying the created header
colnames(final_dataset)<-header

#extracting mean & standard deviation measures from the dataset
mean_measures<-grep(c("*mean*"),header)
std_measures<-grep(c("*std*"),header)

#creating a seubset from the final dataset that contains only mean and std measures of the dataset
subset<-final_dataset[,c(mean_measures,std_measures,562,563)]

#reading the labels
label_map<-read.table("UCI HAR Dataset/activity_labels.txt")

#renaming column names for ease of joining and increase readability
colnames(label_map)<-c("activity_label","activity_name")

#performing inner_join to add the activity names to the dataset
joined_data<-inner_join(subset,label_map,by="activity_label")

#dropping activity label since we now have the activity name
updated_dataset<-select(joined_data,-activity_label)

# k<-filter(t,subject_number==1 & activity_name=="LAYING")
# mean(k$`tBodyAcc-mean()-X`)

#extracting all column names
column_names<-colnames(updated_dataset)

#subsetting the column names for which the mean is average is needed
subset_col_names<-column_names[1:79]

#grouped and summarized data
summarized_result<-updated_dataset%>%group_by(subject_number,activity_name)%>%summarise_at(vars(all_of(subset_col_names)), mean)

#write final result to a file

write.table(result,"summarized_dataset.txt",row.names=F)
