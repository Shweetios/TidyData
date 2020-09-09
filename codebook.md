Variables-
data, untidy data set of data
tidydata, neatened data set of data
x, wash away variable to store subject/ activity data for each element of each
dataactivity,  data for activities & mean of each corresponding variables
datasubject,  data for subject & mean of each corresponding variables

Data-

traindata , data set of X_train
testdata, data set of X_test
trainlabel, data set of activity in use in X_train
testlabel, data set of activity in use in X_test
subjecttrain, data of which subject did which data in X_train
subjecttest, data of which subject did which data in X_test
features, data for the differenct variable names of X_train/X_test
activity, Data of names of different activities

Lines 1-11:
Adding data from directory.
Lines 13-16:
Combining all data into one data set
Lines 18-20:
Only shoing data for means and std
Lines 22-25:
Replacing activity number with the name
Lines 28:
Changing variable names in matrix
Lines 30 -44:
Subsetting each activity & adding means of each corresponding variable to a to dataset dataactivity
Subsetting each subject & adding means of each corresponding variable to a to dataset datasubject

