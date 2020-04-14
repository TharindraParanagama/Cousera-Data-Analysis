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
x<-grep(c("*mean*"),header)
y<-grep(c("*std*"),header)

#creating a seubset from the final dataset that contains only mean and std measures of the dataset
subset<-final_dataset[,c(x,y,562,563)]

label_map<-read.table("UCI HAR Dataset/activity_labels.txt")
colnames(label_map)<-c("activity_label","activity_name")

t<-inner_join(subset,label_map,by="activity_label")

t<-select(t,-activity_label)
# k<-filter(t,subject_number==1 & activity_name=="LAYING")
# mean(k$`tBodyAcc-mean()-X`)
r<-colnames(t)
r<-r[1:79]
y<-t%>%group_by(subject_number,activity_name)%>%summarise_at(vars(all_of(r)), mean)



#u<-filter(y,subject_number==1 & activity_name=="SITTING")
#%>%summarise_at(vars(-activity_name,-subject_number),funs(mean(.,na.rm=T)))