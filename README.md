# gettingandcleaningdata
Getting and cleaning data course project repository

The following script perform the following steps in order to create two tidy datasets
featuresDatased and AverageFeaturesDataset

###0. Check existance of the files.

###1. Merges the training and the test sets to create one data set.
* 1.01 Read the training dataset located in  ./train/X_train.txt
* 1.02 Read the activity ids for the previous loaded set
* 1.03 Merge the ActivityIds with the Training set
* 1.04 Read the testing dataset located in  ./test/X_test.txt
* 1.05 Read the activity ids for the previous loaded set
* 1.06 Merge the ActivityIds with the Testing set
* 1.07 Merge both train and test dataset

###2 Extracts only the measurements on the mean and standard deviation for each measurement
* 2.01 Load features.txt to identify the columns that contain mean or std
* 2.02 extract the mean and std measures cols. Those features that contain "std()" or "mean()"
* 2.03 Extract mean, std measures and activitiIds

###3 Uses descriptive activity names to name the activities in the data set
* 3.01 read the activity names located in activity_labels.txt
* 3.02 merge the activiy names with the features dataset. First column in both datasets
* 3.03 drop first column containing the id because now it has the activity names in the las column

###4 Appropriately labels the data set with descriptive variable names.
* 4.01 get names of the Measures
* 4.02 clean the names of the measures.Remove parenthesis, eliminate '-' and lower the names
* 4.03 combine the name of the measures and activity
* 4.04 apply names to the dataset

###5 creates a second, independent tidy data set with the average of each variable 
* 5.01 Read train subjects located in ./train/subject_train.txt
* 5.02 Read test subjects located in ./test/subject_test.txt
* 5.03 Combine train and test subjects rows, same order as the previous dataset "featuresDataset"
* 5.04 Combine featuresDataset dataset with subjects dataset
* 5.05 Create the groups for calculate the means
* 5.06 perform the summary

###POST EXECUTION.Remove all the temporary vaiables form the environment

