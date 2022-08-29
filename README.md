# Getting-and-collecting-data-final-project
The final project for the getting and collecting data course through Coursera

Hello and welcome to my final project for the course!

Currently as my code is it functions, however it is not quite perfect as I am very new to coding and R is my first language. I have a couple issues with my code I'd like to bring to light as I couldn't figure out how to finish them in time for the due date. 
  1. I was unable to fully automate by gsub function tio replace the "Training labels" column with the appropriate activity names. (post-class I intend to do some digging      on how to do this)
  2. I discovered after the fact that there is a typo in certain columns of text that contain information that could be fixed and reinserted into the data set. I could        not find a way to fix this easily in a timely manner. I have ideas but haven't had enough time to implement them.
  3. The name addition is quite slow, I may see if there is a way to speed this up in the future.

How the function works: Currently there were no major changes made to any of the datasets beyond merging to assemble the data itself. 
The code is written to first read all the name data, then the test data from the files, merge it based on the columns, then repeat for the second set of data. After reading the second set of data the script will combine the data from the two sets into a single unified set. 

Next is the search for the desired information, in this cased std and mean. This is done with a pair of grep functions (I'm sure with time I'll figure out how to combine these into a single function) the results are then combined into a vector along with the first two columns (to preserve subject and activity data) which is then used to subset the "alldata" set to yield only the columns we want to see. 

After this the next code block will take the activity labels numbers and convert them into the appropriate named activities per the "activity_labels.txt" file.

Finally the script averages all data by column and returns a completion message.
