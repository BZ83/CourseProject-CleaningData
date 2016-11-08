# CourseProject-CleaningData
Final Project for Coursera's Getting and Cleaning Data Course

       1. Purpose of the Script

This script processes data on experiments in which volunteers were asked to perform activities and have their movement recorded by accelerometers and gyroscopes embedded in smartphones.

The following describes each step and indicates which lines of code meet each of Coursera’s “Getting and Cleaning Data” assignment requirements. 

The script assumes the data has already been downloaded.


       2. Coursera Requirements

This section indicates in which lines each of the following courser requirements can be found:

2.a) Merges the training and the test sets to create one data set: lines 1 to 49 – see exact descriptions in steps below

2.b)Extracts only the measurements on the mean and standard deviation for each measurement: lines 54 and 55

2.c)Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names: lines 44 to 49

2.d) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject: lines 58 and 61


       3. Step 1 - load relevant libraries
       
3.a)Library dplyr is loaded to help handle the data (line 3)


       4. Step 2 - load and name the data
       
4.a) directory is set for location of Train Data (line 9)
4.b) data frames are created for the Train Data (line 10), the Subject ID (line 11) and the activity labels (line 12)
4.c) an object “TrainFullData” is created that merges the data with subject ID and the activity labels (line 15)
4.d) subject ID and Labels are properly named (lines 18 and 19)
4.e) names for measure variables are obtained from file (line 20) and applied to dataset (line 21)
4.f) directory is set for location of Test Data (line 26)
4.g) data frames are created for the Test Data (line 27), the Subject ID (line 28) and the activity labels (line 29)
4.h) an object “TestFullData” is created that merges the data with subject ID and the activity labels (line 32)
4.i) subject ID and Labels are properly named (lines 35 and 36)
4.j) names for measure variables are obtained from file (line 37) and applied to dataset (line 38)



       5. Step 3 - merge data sets into one
       
5.a) “FullData” object is created merging the Train and Test data sets (line 41)


       6. Step 4 - add descriptive names to a relevant variable
       
6.a) Activity labels are obtained from local file (line 44)
6.b) A function is defined to translate  activity codes to descriptive names (lines 45-47)
6.c) An object is created translating each activity code for the full data (line 48)
6.d) The translation is added as an column to the full dataset (line 49)


       7. Step 5 - extract relevant data and summarize data
7.a) All variables containing “mean” or “std” in their text are identified (line 54)
7.b) The relevant data are selected: the columns indicated in line 54 and columns 561:564, which have the relevant labels (line 55)
7.c) An object NewDS is created to store the summarized mean for each measure, grouped by activity and subject (line 58)

       8. Step 6 - create new data table with the summarized data
8.a) A new file is created based on the data processed (line 61)


