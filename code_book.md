#Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

For the smartphone data set, relevant experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years old. Each individual performed six different activities wearing a smartphone, including walking, walking upstairs, walking downstairs, sitting, standing and laying. The smartphone was embedded accelerometer and gyroscope to capture the movement of the individuals. The experiments were also video-recorded to label the data manually.

## The Data Package

The dataset includes the following files:

features.txt - includes the descriptions for features measured
train/X_train.txt - includes the measurements of the features in train set.
test/X_test.txt - includes the measurements of the features in test set
train/subject_train.txt - subject for each measurement from the train set
test/subject_test.txt - subject for each measurement from the test set
train/y_train.txt - activity (from 1 to 6) for each measurement from the train set
test/y_test.txt - activity (from 1 to 6) for each measurement from the test set


# Variables in the tidy dataset:

-subject: this is the numeric ID that denotes the subject (person) whose activity was measured. Values are from 1 to 30.

-activity: the type of activity. Values are WALKING,WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING

-features:

*t at the beginning means that is a measurement based on the "time" domain. Measurements taken from the phone were measured at a frequency of 50Hz, meaning 50 discrete measurements per second.

*f at the beginning means that is a measurement based on the "frequency" domain, taken as a Fast Fourier Transform of the time-based signals.

*Body means that signal is based on the body of the subject, one of two components derived from the time based signals on the phone's accelerometer

*Gravity means that signal is based on gravity. Gravity is the second of the two measurement components derived from the phone's accelerometer.

*Gyro means that signal is taken from the gyroscope on the phone.

*Jerk means that is a measurement of sudden movement, based on body acceleration and angular velocity.

*Mag indicates a measurement of the magnitude of the Euclidean norm of a three-dimensional signal.

*X indicates that measurement was taken along the "X" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.

*Y indicates that measurement was taken along the "Y" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.

*Z indicates that measurement was taken along the "Z" dimension of the phone, as in a three-dimensional Cartesian coordinate system of X, Y and Z.

*mean() indicates that the measurement is a mean in the original dataset

*std() indicates that the measurement is a standard deviation in the original dataset.



#The following data transformations were conducted to form a tidy dataset:

- Join the test and train sets.
- Keep only the features that refer to the mean and standard deviation, those that contain "mean()" and "std()" (discarding the meanFreq() and angle variables)
- Added a new feature activitylabel - factor variable for activities with the following levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
- Tidy dataset was build as a mean values of features grouped by activitylabel and subject - for each subject and activity type determined mean values over all activities of that type.
