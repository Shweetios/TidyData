#Getting data into R
traindata<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/train/X_train.txt")
testdata<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/test/X_test.txt")

trainlabel<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/train/y_train.txt")
testlabel<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/test/y_test.txt")

subjecttrain<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/train/subject_train.txt")
subjecttest<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/test/subject_test.txt")
features<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/features.txt")
activity<-read.table("C:/Users/Brandon/Desktop/Coursera/UCI HAR Dataset/activity_labels.txt")

#1) combining all data into on data set
data<- rbind(traindata,testdata)
data<-cbind(rbind(trainlabel,testlabel),data)
data<-cbind(rbind(subjecttrain,subjecttest),data)

#2)Subsetting only data  of mean & standard deviation
subfeat<- subset(features,grepl("mean.",features$V2)|grepl("std.",features$V2))
data<-data[,c(1,2,subfeat$V1+2)]

#3)replacing activity with name of activity
for(i in 1:6){
data[,2]<-gsub(i,activity[i,2],data[,2])
data[,2]<-gsub(i,activity[i,2],data[,2])}

#4)changing variables names to appropriate names
colnames(data) <-c("Subject","Activity",subfeat$V2)

#5)Making clean and tidy data set
#Making a matrix for activity data
dataactivity<-matrix(NaN,nrow = 6,ncol = length(subfeat$V1)+1)
for(i in 1:6){
 x<-subset(data,data[,2]==activity[i,2])
 x<-apply(x[,3:length(x)],2,mean)
dataactivity[i,]<-c(activity[i,2],x)
}
#making matrix for subject data
datasubject<-matrix(NaN,nrow = 30,ncol = length(subfeat$V1)+1)
for(i in 1:30){
  x<-subset(data,data[,1]==i)
  x<-apply(x[,3:length(x)],2,mean)
  datasubject[i,]<-c(i,x)
}

#putting data into one tidy data set
tidydata<-rbind(dataactivity,datasubject)
colnames(tidydata)<-c("Subject/Activity",subfeat$V2)
rownames(tidydata)<-c(rep("activity",6),rep("Subject",30))

write.table(tidydata,file = "tidydata.txt",row.names = FALSE)


