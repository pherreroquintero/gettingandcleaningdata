# The following script perform the following steps in order to create two tidy datasets
# featuresDatased and AverageFeaturesDataset
#0. Check existance of the files.
#1. Merges the training and the test sets to create one data set.
        #1.01 Read the training dataset located in  ./train/X_train.txt
        #1.02 Read the activity ids for the previous loaded set
        #1.03 Merge the ActivityIds with the Training set
        #1.04 Read the testing dataset located in  ./test/X_test.txt
        #1.05 Read the activity ids for the previous loaded set
        #1.06 Merge the ActivityIds with the Testing set
        #1.07 Merge both train and test dataset
#2 Extracts only the measurements on the mean and standard deviation for each measurement
        #2.01 Load features.txt to identify the columns that contain mean or std
        #2.02 extract the mean and std measures cols. Those features that contain "std()" or "mean()"
        #2.03 Extract mean, std measures and activitiIds
#3 Uses descriptive activity names to name the activities in the data set
        #3.01 read the activity names located in activity_labels.txt
        #3.02 merge the activiy names with the features dataset. First column in both datasets
        #3.03 drop first column containing the id because now it has the activity names in the las column
#4 Appropriately labels the data set with descriptive variable names.
        #4.1 get names of the Measures
        #4.2 clean the names of the measures.Remove parenthesis, eliminate '-' and lower the names
        #4.3 combine the name of the measures and activity
        #4.4 apply names to the dataset
#5 creates a second, independent tidy data set with the average of each variable 
        #5.01 Read train subjects located in ./train/subject_train.txt
        #5.02 Read test subjects located in ./test/subject_test.txt
        #5.03 Combine train and test subjects rows, same order as the previous dataset "featuresDataset"
        #5.04 Combine featuresDataset dataset with subjects dataset
        #5.05 Create the groups for calculate the means
        #5.06 perform the summary
#POST EXECUTION.Remove all the temporary vaiables form the environment




#0. Check existance of the files.
# The following files are needed to execute the following script
if (!all(file.exists("./data/train/X_train.txt"
                   ,"./data/train/y_train.txt"
                   ,"./data/test/X_test.txt"
                   ,"./data/test/y_test.txt"
                   ,"./data/features.txt"
                   ,"./data/activity_labels.txt"
                   ,"./data/train/subject_train.txt"
                   ,"./data/test/subject_test.txt")))
{
        print("Error: File not found")
} else {
        
        #1. Merges the training and the test sets to create one data set.
        
        #1.01 Read the training dataset located in  ./train/X_train.txt
        trainFeatures <-read.table(file = "./data/train/X_train.txt" #file location
                                ,header = FALSE)                #Not containing headers
                                
        
        #1.02 Read the activity ids for the previous loaded set
        trainActivityIds <-read.csv(file = "./data/train/y_train.txt" #file location
                                 ,header = FALSE)                #Not containing headers
                                 
        #1.03 Merge the ActivityIds with the Training set
        trainFeatures <- cbind(trainActivityIds,trainFeatures)
        
        
        
        #Now, repeat the process for the testing set
        #1.04 Read the testing dataset located in  ./test/X_test.txt
        testFeatures <-read.table(file = "./data/test/X_test.txt" #file location
                                ,header = FALSE)
        
        #1.05 Read the activity ids for the previous loaded set
        testActivityIds <-read.csv(file = "./data/test/y_test.txt" #file location
                                    ,header = FALSE)           #Not containing headers
        
        #1.06 Merge the ActivityIds with the Testing set
        testFeatures <- cbind(testActivityIds,testFeatures)
        
        #1.07 Merge both train and test dataset
        featuresDataset <- rbind(trainFeatures,testFeatures)
        
        
        #2 Extracts only the measurements on the mean and standard deviation for each measurement
        #2.01 Load features.txt to identify the columns that contain mean or std
        features <- read.csv(file = "./data/features.txt"
                             ,sep = " "
                             ,header = FALSE
                             ,stringsAsFactors = FALSE)
        
        #2.02 extract the mean and std measures cols. Those fetatures that contain "std()" or "mean()"
        meanStdCols <- grep(pattern = "(std\\(\\))|(mean\\(\\))",features[,2])
        
        #add one to all index columns and then add the #the col index one that contains the activityId
        activityIdMeanStdCols <- c(1,meanStdCols+1) 
        
        #2.03 Extract mean, std measures and activitiIds
        featuresDataset <- featuresDataset[,activityIdMeanStdCols]
        
        #3 Uses descriptive activity names to name the activities in the data set
        #3.01 read the activity names located in activity_labels.txt
        activityLabels <- read.csv(file = "./data/activity_labels.txt"
                             ,sep = " "
                             ,header = FALSE
                             ,stringsAsFactors = FALSE)
        
        #3.02 merge the activiy names with the features dataset. First column in both datasets
        featuresDataset <- merge(featuresDataset,activityLabels,by.x = 1,by.y = 1)
        
        #3.03 drop first column containing the id because now it has the activity names in the las column
        featuresDataset <- featuresDataset[,c(-1)]
        
        #4 Appropriately labels the data set with descriptive variable names.
        #4.1 get names of the Measures
        namesFeatures <- features[meanStdCols,2]
        
        #4.2 clean the names of the measures.Remove parenthesis, eliminate '-' and lower the names
        namesFeatures <- tolower(gsub("-","",gsub("\\(\\)","",namesFeatures)))
        
        #4.3 combine the name of the measures and activity
        namesFeaturesActivity <- c(namesFeatures,"activity")
        
        #4.4 apply names to the dataset
        names(featuresDataset) <- namesFeaturesActivity
        
        #5 creates a second, independent tidy data set with the average of each variable 
        # for each activity and each subject.
        #5.01 Read train subjects located in ./train/subject_train.txt
        trainSubjects <- read.csv(file = "./data/train/subject_train.txt" #file location
                                ,header = FALSE)            #Not containing headers
        
        
        #5.02 Read test subjects located in ./test/subject_test.txt
        testSubjects <- read.csv(file = "./data/test/subject_test.txt" #file location
                                    ,header = FALSE)            #Not containing headers
        
        #5.03 Combine train and test subjects rows, same order as the previous dataset
        subjects <- rbind(trainSubjects,testSubjects)
        names(subjects) <- c("subject")
        
        #5.04 Combine featuresActivity dataset with subjects dataset
        featuresActivitySubject <- cbind(featuresDataset,subjects)
        
        #5.05 Create the groups
        library(dplyr)
        ActivitySubjectGroup <- group_by(featuresActivitySubject,activity,subject)
        
        #5.06 perform the summary
        averageFeaturesDataset <- summarize_each(ActivitySubjectGroup,funs(mean))
        
        #POST EXECUTION.Remove all the temporary vaiables form the environment
        rm("trainActivityIds")
        rm("testActivityIds") 
        rm("trainFeatures")
        rm("testFeatures")
        rm("activityLabels")
        rm("ActivitySubjectGroup")
        rm("features")
        rm("featuresActivitySubject")
        rm("subjects")
        rm("testSubjects")
        rm("trainSubjects")
        rm("activityIdMeanStdCols")
        rm("meanStdCols")
        rm("namesFeatures")
        rm("namesFeaturesActivity")
}
