## Use the directory ".data' as working directory

if (!file.exists("./data")){
  dir.create("./data")
}
## Download the file and put the file in the "data" folder

URL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL,destfile="./data/Dataset.zip",method="auto")

##Unzip DataSet to /data directory

unzip(zipfile="./data/Dataset.zip", exdir= "./data")

##Get the list of the files

path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files

##Load required packages

library(dplyr)
library(data.table)
library(tidyr)

##Read data from the files into the variables

features <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read subject files

subject_test <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

#Read the Activity files

y_test <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/test/y_test.txt", col.names = "code")
y_train <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Read data features.

x_train <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
x_test <- read.table("C:/Users/Gabriela Cantos/Desktop/coursera/Getting and Cleaning Data/Project/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)

##Step 1: Merges the training and the test sets to create one data set.

dataSubject <- rbind(subject_train, subject_test)
dataActivity<- rbind(y_train, y_test)
dataFeatures<- rbind(x_train, x_test)

Merged_Data <- cbind(dataSubject, dataActivity, dataFeatures)

#Extracts only the measurements on the mean and standard deviation for each measuremen
Mean_std<- select(Merged_Data, subject, code, contains("mean"), contains("std"))


#Uses descriptive activity names to name the activities in the data set

Mean_std$code<- activities[Mean_std$code, 2]

#Appropriately labels the data set with descriptive variable names

names(Mean_std)[2]= "activity"
names(Mean_std)<-gsub("std()", "SD", names(Mean_std))
names(Mean_std)<-gsub("mean()", "MEAN", names(Mean_std))
names(Mean_std)<-gsub("^t", "time", names(Mean_std))
names(Mean_std)<-gsub("^f", "frequency", names(Mean_std))
names(Mean_std)<-gsub("Acc", "Accelerometer", names(Mean_std))
names(Mean_std)<-gsub("Gyro", "Gyroscope", names(Mean_std))
names(Mean_std)<-gsub("Mag", "Magnitude", names(Mean_std))
names(Mean_std)<-gsub("BodyBody", "Body", names(Mean_std))
namesMean_std)<-gsub("angle", "Angle", names(Mean_std))
names(Mean_std)<-gsub("gravity", "Gravity", names(Mean_std))

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Final_Tidy_Data<- Mean_std %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(Final_Tidy_Data, file = "FinalData.txt", row.name=FALSE)


