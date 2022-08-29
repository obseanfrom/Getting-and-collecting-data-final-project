Datasets:
UCI HAR Dataset

Packages:
dplyr - For the final step only (I began using it in the final section of the project and may refine this code further in the future for fun in a separate branch)

Variables:
namelist - a list of named columns from the "features.txt" file in the dataset, based on the column count I determined that it was most likely that this data coincides with the X_test and X_train data columns (which are confirmed to be identical in the readme.)
testdataX/traindataX - the primary data sets containing the actual numeric data analyzed.
testdataY/traindataY - the secondary data sets containing the labels associated with the numeric data contained in testdataX/traindataX.
testdatasubj/traindatasubj - the subject identifier information associated with the test/train datasets respectively.
testdataM/traindataM - sets containing the merged dataX/dataY/subj data. 
  - these were combined according to the number of rows/columns in each dataset. Ultimately this data was combined using cbind as the columns appeared the logical method     of combination.
alldata - combination of testdataM/traindataM, very straightforward, simply rbinding together as the columns made logical sense together already.
meanlist/stdlist - these were created to store information regarding the location of the mean and std deviation values among the hundreds of columns.
datalistM - merged data of meanlist/stdlist in order to make for an easy subset command.
alldatafilt - a full data set filtered to only include the mean/std data values.
activitylabels - a set used to store data for reference while building the gsub replacement used to create alldatafilt. This could have been automated but I wasn't sure how to do this at the time as I am quite new to programming and I'd like to figure out a clean way to automate this. 
activityintermediate - used to store a subset of alldatafilt to more easily gsub and reinsert the desired data.
alldataavg - a finished data set for the write.table function to present. Uses data grouped by training labels and subject number columns from alldatafilt.
