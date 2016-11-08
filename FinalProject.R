
### Loading Packages
library("dplyr")


####                      Getting & Naming Data

##  Getting Train Data and Adjusting Table
setwd("C:/Users/breno/OneDrive/Estudo/Coursera/GettingCleaningData/UCI HAR Dataset/train")
TrainData <- read.table("X_train.txt")
TrainSubject <- read.table("subject_train.txt")
TrainLabel <- read.table("Y_train.txt")

#Adding Labels and Subject ID to Data
TrainFullData <- cbind(TrainData, TrainLabel, TrainSubject)

#Adjusting Column Names
names(TrainFullData)[562] <- "Label"
names(TrainFullData)[563] <- "SubjectID"
VariableNames <- read.table("C:/Users/breno/OneDrive/Estudo/Coursera/GettingCleaningData/UCI HAR Dataset/features.txt")
names(TrainFullData)[1:561] <- as.character(VariableNames[,2]) ##



##  Getting Test Data and Adjusting Table
setwd("C:/Users/breno/OneDrive/Estudo/Coursera/GettingCleaningData/UCI HAR Dataset/test")
TestData <- read.table("X_test.txt")
TestSubject <- read.table("subject_test.txt")
TestLabel <- read.table("Y_test.txt")

#Adding Labels and Subject ID to Data
TestFullData <- cbind(TestData, TestLabel, TestSubject)

#Adjusting Column Names
names(TestFullData)[562] <- "Label"
names(TestFullData)[563] <- "SubjectID"
VariableNames <- read.table("C:/Users/breno/OneDrive/Estudo/Coursera/GettingCleaningData/UCI HAR Dataset/features.txt")
names(TestFullData)[1:561] <- as.character(VariableNames[,2])

##  Merging Two Data Sets
FullData <- rbind(TrainFullData, TestFullData)

## Creating Column with Descriptive Variable Names
ActivityLabels <- read.table("C:/Users/breno/OneDrive/Estudo/Coursera/GettingCleaningData/UCI HAR Dataset/activity_labels.txt")
TranslateActivity <- function(x){
  as.character(ActivityLabels[x, 2])
  }
ActivityDescription <- TranslateActivity(FullData$Label)
FullData <- cbind(FullData, ActivityDescription)

####                      Extracting and Saving Specific Data 

# Finding and Selecting Relevant Columns
RelCols <- c(grep("std", names(FullData)), grep("mean", names(FullData)))
SelData <- FullData[,c(RelCols, 561:564)]

# Getting means for each measure
NewDS <- summarise_each(group_by(SelData, SubjectID, ActivityDescription), funs(mean))

# Creating new table for the new dataset
write.table(NewDS, "C:/Users/breno/OneDrive/Estudo/Coursera/GettingCleaningData/CourseProject-CleaningData/TidyDataSet.txt")

