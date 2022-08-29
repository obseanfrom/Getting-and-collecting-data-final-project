library(dplyr)  
  #read and store the first dataset
  #name columns appropriately (from features.txt)

namelist <- read.table("F:/Program Files/UCI HAR Dataset/features.txt")
testdataX <- read.table("F:/Program Files/UCI HAR Dataset/test/X_test.txt",
                        col.names = namelist$V2)
testdataY <- read.table("F:/Program Files/UCI HAR Dataset/test/Y_test.txt",
                        col.names = "Training labels")
testdatasubj <- read.table("F:/Program Files/UCI HAR Dataset/test/subject_test.txt",
                           col.names = "Subject number")

  #merge first dataset into a unified set, fix names of merged data
  #Organized with Y and subj first to provide locus

testdataM <- cbind(testdataY, testdatasubj, testdataX)

  #read and store the second set of data

traindataX <- read.table("F:/Program Files/UCI HAR Dataset/train/X_train.txt",
                         col.names = namelist$V2)
traindataY <- read.table("F:/Program Files/UCI HAR Dataset/train/Y_train.txt",
                         col.names = "Training labels")
traindatasubj <- read.table("F:/Program Files/UCI HAR Dataset/train/subject_train.txt",
                            col.names = "Subject number")

  #merge second dataset into a unified set

traindataM <- cbind(traindataY, traindatasubj, traindataX)

  #now combine all data into a unified set

alldata <- rbind(traindataM, testdataM)

  #Filter for desired information based on colnames

meanlist <- grep("mean",names(alldata), value = FALSE)
stdlist <- grep("std",names(alldata),value = FALSE)
datalistM<- c(1,2,stdlist,meanlist)
alldatafilt <- alldata[,datalistM]

  #substitute for data included in activity_labels file
  #subset out and rename

activitylabels <- read.table("F:/Program Files/UCI HAR Dataset/activity_labels.txt")
activityintermediate <- alldatafilt$Training.labels
alldatafilt$Training.labels <- gsub("1","Walking",
                               gsub("2","walking up stairs",
                               gsub("3","Walking down stairs",
                               gsub("4","Sitting",
                               gsub("5", "Standing",
                               gsub("6", "Laying",activityintermediate))))))

  #create independent data set with average of each variable for each activity and each subjet

alldataavg <- alldatafilt %>% group_by(Training.labels,Subject.number) %>% summarise_all(list(mean = mean)) %>% ungroup()
write.table(alldataavg,"tidydataset.txt",row.names = FALSE)

message("script run successfully", " new data set with name 'tidydataset.txt'"," created in the working directory")
