## CODE BOOK

##  Variables

cdir - the current working directory

urlZip - the url from where the data is downloaded

features - stores the different features es the dataset

activityLabels - stores all the activity labels

testValues - stores the values of the variables of the test data

testActivities - stores the descriptions of the activities of the test data

testSubjects - stores subjects of the test data

testF - final test table

trainValues - stores the values of the variables of the train data

trainActivities - stores the descriptions of the activities of the train data

trainSubjects - stores subjects of the train data

trainF - final train table

alltables - testF and trainF merged table

averageTable - average of each variabel for each activity and subject of the alltables table


##  Tranformation

testValues - only are the columns with the word mean or std are selected

testActivities - is the result of merging testActivities and activityLabels by activity

trainActivities - is the result of merging trainActivities and activityLabels by activity

testF - is the result of combining testActivities, testSubjects and testValues

trainF - is the result of combining trainActivities, trainSubjects and trainValues

averageTable - average of each variabel for each activity and subject of the alltables table
