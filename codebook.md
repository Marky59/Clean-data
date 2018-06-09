# Codebook

## Variables

url - The url address of the raw data zip file.
destfile - The downloaded data zip file.
zipf - The complete path and file name of the data zip file.
datedownloaded - The date the data was downloaded.
actlabel - data frame of the activity labels.
train - data frame of the training data.
subjtrain - data frame of the training data subjects.
acttrain - data frame of the training activity.
test - data frame of the test data.
subjtest - data frame of the test data subjects.
acttest - data frame of the test data activity.
feeture - data frame of the features.
train_test - data frame of the combined test and train data.
mn - vector of the indices of the train_test data with "mean" in the variable name.
st - vector of the indices of the train_test data with "std" in the variable name.
both - data sets mn and st combined.
train_test2 - data frame of the train_test data with column indices matching "both".
avgs - The fields from train_test2 with "mean" in the variable name.
