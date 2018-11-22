#Getting and Cleaning Data: Course Project

The script run_analysis.R follow the next step:

1. Get the data: Download and unzip the data. It checks if the data directory exists, if not it creates it. Then checks if the file is already downloaded, if not it downloads it. At the end we will have a directory called "data/UCI HAR Dataset" where the needed files will be. 

2. Get the list of the files such as activity_labels.txt, features_info.txt, features.txt etc. 

2. Read data from the targeted files: Create separate columns for data and variable names across subject and activity. Read data from the files into the variables. Read the Activity files, Subject files, Features files using the function read.table.

4. Merges the training and the test data sets to a single data set: using the rbind function. 

5. Only those columns with the mean and standard deviation measures are taken from the whole dataset: Subset Name of Features by measurements on the mean and standard deviation.

6. After extracting these columns, they are given the correct names, taken from features.txt

7. Create a new dataset with all the average measures for each subject and activity type was generated, using the library 'plyr'. Aggregate the data using aggregate function. Make a text file using the write.table function. The output file is called FinalData.txt, and uploaded to this repository.



##About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.