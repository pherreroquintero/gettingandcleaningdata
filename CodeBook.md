#Coursera Project. Getting And Cleaning Data
==================================================================
Based on Human Activity Recognition Using Smartphones Dataset
Version 1.0
From the authors Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
==================================================================


Data from The experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz



### The dataset includes the following files:
=========================================

1. 'featuresDataset.txt' 
Each row identifies the subject who performed the activity, the Mean and Standar Deviation of the features measured
* Variables
	* activity: Activity performed in the experiment. (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
	* tbodyaccmeanx, tbodyaccmeany, tbodyaccmeanz: Body linear acceleration mean on x,y z
	* tbodyaccstdx, tbodyaccstdy, tbodyaccstdz: Body acceleration std on x,y z
	* tgravityaccmeanx, tgravityaccmeany, tgravityaccmeanz: Gravity acceleration mean on x,y z
	* tgravityaccstdx, tgravityaccstdy, tgravityaccstdz: Gravity acceleration std on x,y z
	* tbodyaccjerkmeanx, tbodyaccjerkmeany, tbodyaccjerkmeanz 
	* tbodyaccjerkstdx, tbodyaccjerkstdy, tbodyaccjerkstdz
	* tbodygyromeanx, tbodygyromeany, tbodygyromeanz
	* tbodygyrostdx, tbodygyrostdy, tbodygyrostdz
	* tbodygyrojerkmeanx, tbodygyrojerkmeany, tbodygyrojerkmeanz
	* tbodygyrojerkstdx, tbodygyrojerkstdy, tbodygyrojerkstdz
	* tbodyaccmagmean
	* tbodyaccmagstd
	* tgravityaccmagmean
	* tgravityaccmagstd 
	* tbodyaccjerkmagmean
	* tbodyaccjerkmagstd
	* tbodygyromagmean
	* tbodygyromagstd
	* tbodygyrojerkmagmean
	* tbodygyrojerkmagstd
	* fbodyaccmeanx, fbodyaccmeany, fbodyaccmeanz
	* fbodyaccstdx, fbodyaccstdy, fbodyaccstdz
	* fbodyaccjerkmeanx, fbodyaccjerkmeany, fbodyaccjerkmeanz
	* fbodyaccjerkstdx, fbodyaccjerkstdy, fbodyaccjerkstdz
	* fbodygyromeanx, fbodygyromeany, fbodygyromeanz
	* fbodygyrostdx, fbodygyrostdy, fbodygyrostdz
	* fbodyaccmagmean
	* fbodyaccmagstd
	* fbodybodyaccjerkmagmean
	* fbodybodyaccjerkmagstd
	* fbodybodygyromagmean 
	* fbodybodygyromagstd
	* fbodybodygyrojerkmagmean
	* fbodybodygyrojerkmagstd
	



2. 'averageFeaturesDataset.txt': List of all features.
Shows the FeaturesDataset information in the form of the average of each variable for each activity and each subject 
* Variables
	* activity: Activity performed in the experiment. (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
	* Subject: int from 1 to 30 that identifies the subject
	* All the averages of the FeaturesDataset variables 
	
Notes: 
======
- Features are normalized and bounded within [-1,1]
