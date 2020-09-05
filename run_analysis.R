##  Course Project - Getting and cleaning data

    ## Downloading the data
    if(!file.exists("./data")){dir.create("./data")}
    cdir <- "./data"
    setwd(cdir)
    urlZip <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
    download.file(urlZip,"./Dataset.zip")
    unzip("./Dataset.zip")
    
   
    ## Reading features file
    features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("rowNumber","variable"))
    View(features)
  
    ## Reading activity labels file
    activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity","description"))
    
    
    ## TEST FILES
    
    ## Readind test values
    testValues <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$variable )
    testValues <- testValues[,grepl("mean|std", colnames(testValues))]
    
    ## Reading test activities file
    testActivities <-  read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "activity")
    
    ## Reading test subjects
    testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

    ## Merging test activities with activities labels
    testActivities <- merge(testActivities, activityLabels, by = "activity" )
    
    ## Putting the test data together
    testF <- cbind(testActivities,testSubjects,testValues)
    
    
    ## TRAIN FILES
    
    ## Reading train values
    trainValues <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$variable)
    trainValues <- trainValues[,grepl("mean|std", colnames(trainValues))]
    
    ## Reading train activities
    trainActivities <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity")
    
    ## Reading train subjects
    trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
    
    ## Merging train activities with activities labels
    trainActivities <- merge(trainActivities, activityLabels, by = "activity")
    
    ## Putting train data together
    trainF <- cbind(trainActivities,trainSubjects,trainValues)
    
        
    ## COMBINING TEST AND TRAIN TABLES
    
    alltables <- rbind(testF,trainF)
    alltables <- alltables %>%
        select(-activity) %>%
        rename(activity = description)
    View(alltables)
    
    
    ## AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT
    
    alltables <- group_by(alltables, activity, subject)
    averageTable <- summarise_each(alltables, funs = mean)
    View(averageTable)
 
    write.table(averageTable, file = "AverageTableVariable.txt", row.names = FALSE)
    
    