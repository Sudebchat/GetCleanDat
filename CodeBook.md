Course Project : Getting And Cleaning Data

The run_analysis.R code does the following :
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names. 
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

PART 1. Merges the training and the test sets to create one data set

(1) First set the home directory
    setwd("./")   ## the working directory is prescribed here

(2) Second read the files containing the data. Here the the subject target file are assumed to be already unzipped 
    from the getdata-projectfiles-UCI HAR Dataset zip file. The following gives the description of the variables 
    used in the R code.     
　　　file_tst  ##  test data file name
   	file_trn  ##  the train data file name
   	fl1trn    ##  the train data
   	fl1tst    ##  the test data

(3) Lastly, the train and test data sets are merged into one data set (vector). The variable used in the R code 
    for this is: fl1merged  ## data after merging the two data sets

PART 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

(1) First we read the feature description file. The variables used here are as follows:
　　　　featurefl ## feature file name
　　　　feattest  ## read the feature names
(2) Next we select the feature names with "mean" and "std" in them. The variables used here are as follows:
　　　　colindex  ## index for the features with "mean" and "std" in them using grep
　　　　lenfeat   ## gives the number of features selected

(3) Next we create a list containing the position of the "features" with "mean"  and "std" in them and sort the 
    data in increasing order and this is kept in the following variable:
　　　　rnlstdmean ## contains the column positions of the selected features

(4) Next we create the data set with mean and std columns by selecting the elements from the big merged vector 
    of the train and test data set. This data is kept in the following dataset:
　　　　selectcols  ## the data set with mean and std columns (values)
　　　　nfeatures   ## the total number of features
　　　　nrecords    ## the new number of records in training and test data combined

(5) Next we write the tidy data into an intermediary file named "tidydata" for next processing

PART 3. Using the descriptive activity names to name the activities in the data set. 

The rule here is that no capital letters, no hyphens, no dots, no underscores to be used in the names. And based on this rule create an ordered set of mean and std column labels. The following variable is used to hold the new names:
　　　　colnams  ## column names to be used for mean and std data
　　　　
The actual names are listed below with the original feature name listed on the right. 
　　　　"tbodyaccmeanx"       	## "tBodyAcc-mean()-X"               
　　　　"tbodyaccmeanY"       	## "tbodyAcc-mean()-y"              
　　　　"tbodyaccmeanz"       	## "tBodyAcc-mean()-Z"               
　　　　"tbodyaccstdx"        		## "tBodyAcc-std()-X"               
　　　　"tbodyaccstdy"        		## "tBodyAcc-std()-Y"                
　　　　"tbodyaccstdz"        		## "tBodyAcc-std()-Z"               
　　　　"tgravityaccmeanx"    		## "tGravityAcc-mean()-X"            
　　　　"tgravityaccmeany"    		## "tGravityAcc-mean()-Y"           
　　　　"tgravityaccmeanz"    		## "tGravityAcc-mean()-Z"            
　　　　"tgravityaccstdx"    		## "tGravityAcc-std()-X"            
　　　　"tgravityaccstdy"    		## "tGravityAcc-std()-Y"             
　　　　"tgravityaccstdz"    		## "tGravityAcc-std()-Z"            
　　　　"tbodyaccjerkmeanx"  		## "tBodyAccJerk-mean()-X"           
　　　　"tbodyaccjerkmeany"  		## "tBodyAccJerk-mean()-Y"          
　　　　"tbodyaccjerkmeanz"  		## "tBodyAccJerk-mean()-Z"           
　　　　"tbodyaccjerkstdx"   		## "tBodyAccJerk-std()-X"           
　　　　"tbodyaccjerkstdy"   		## "tBodyAccJerk-std()-Y"            
　　　　"tbodyaccjerkstdz"   		## "tBodyAccJerk-std()-Z"           
　　　　"tbodygyromeanx"     		## "tBodyGyro-mean()-X"              
　　　　"tbodygyromeany"     		## "tBodyGyro-mean()-Y"             
　　　　"tbodygyromeanz"     		## "tBodyGyro-mean()-Z"              
　　　　"tbodygyrostdx"      		## "tBodyGyro-std()-X"              
　　　　"tbodygyrostdy"      		## "tBodyGyro-std()-Y"               
　　　　"tbodygyrostdz"      		## "tBodyGyro-std()-Z"              
　　　　"tbodygyrojerkmeanx" 		## "tBodyGyroJerk-mean()-X"          
　　　　"tbodygyrojerkmeany" 		## "tBodyGyroJerk-mean()-Y"         
　　　　"tbodygyrojerkmeanz" 		## "tBodyGyroJerk-mean()-Z"          
　　　　"tbodygyrojerkstdx"  		## "tBodyGyroJerk-std()-X"          
　　　　"tbodygyrojerkstdy"  		## "tBodyGyroJerk-std()-Y"           
　　　　"tbodygyrojerkstdz"  		## "tBodyGyroJerk-std()-Z"          
　　　　"tbodyaccmagmean"    	## "tBodyAccMag-mean()"              
　　　　"tbodyaccmagstd"     		## "tBodyAccMag-std()"              
　　　　"tgravityaccmagmean" 		## "tGravityAccMag-mean()"           
　　　　"tgarvityaccmagstd"  		## "tGravityAccMag-std()"           
　　　　"tbodyaccjerkmagmean"  	## "tBodyAccJerkMag-mean()"          
　　　　"tbodyaccjerkmagstd"   	## "tBodyAccJerkMag-std()"          
　　　　"tbodygyromagmean"     	## "tBodyGyroMag-mean()"             
　　　　"tbodygyromagstd"      	## "tBodyGyroMag-std()"             
　　　　"tbodygyrojerkmagmean" 	## "tBodyGyroJerkMag-mean()"         
　　　　"tbodygyrojerkmagstd"  	##"tBodyGyroJerkMag-std()"         
　　　　"fbodyaccmeanx"      		## "fBodyAcc-mean()-X"               
　　　　"fbodyaccmeany"      		## "fBodyAcc-mean()-Y"              
　　　　"fbodyaccmeanz"      		## "fBodyAcc-mean()-Z"               
　　　　"fbodyaccstdx"       		## "fBodyAcc-std()-X"               
　　　　"fbodyaccstdy"       		## "fBodyAcc-std()-Y"                
　　　　"fbodyaccstdz"       		## "fBodyAcc-std()-Z"               
　　　　"fbodyaccmeanfreqx"  		## "fBodyAcc-meanFreq()-X"           
　　　　"fbodyaccmeanfreqy"  		## "fBodyAcc-meanFreq()-Y"          
　　　　"fbodyaccmeanfreqz"  		## "fBodyAcc-meanFreq()-Z"
　　　　"fbodyaccjerkmeanx"  		## "fBodyAccJerk-mean()-X"
　　　　"fbodyaccjerkmeany"  		## "fBodyAccJerk-mean()-Y"           
　　　　"fbodyaccjerkmeanz"  		## "fBodyAccJerk-mean()-Z"          
　　　　"fbodyaccjerkstdx"   		## "fBodyAccJerk-std()-X"            
　　　　"fbodyaccjerkstdy"   		## "fBodyAccJerk-std()-Y"           
　　　　"fbodyaccjerkstdz"   		## "fBodyAccJerk-std()-Z"            
　　　　"fbodyaccjerkmeanfreqx"  	## "fBodyAccJerk-meanFreq()-X"    
　　　　"fbodyaccjerkmeanfreqy"  	## "fBodyAccJerk-meanFreq()-Y"       
　　　　"fbodyaccjerkmeanfreqz"  	## "fBodyAccJerk-meanFreq()-Z"      
　　　　"fbodygyromeanx"     		## "fBodyGyro-mean()-X"              
　　　　"fbodygyromeany"     		## "fBodyGyro-mean()-Y"             
　　　　"fbodygyromeanz"     		## "fBodyGyro-mean()-Z"              
　　　　"fbodygyrostdx"      		## "fBodyGyro-std()-X"              
　　　　"fbodygyrostdy"      		## "fBodyGyro-std()-Y"               
　　　　"fbodygyrostdz"      		## "fBodyGyro-std()-Z"              
　　　　"fbodygyromeanfreqx" 		## "fBodyGyro-meanFreq()-X"          
　　　　"fbodygyromeanfreqy" 		## "fBodyGyro-meanFreq()-Y"         
　　　　"fbodygyromeanfreqz" 		## "fBodyGyro-meanFreq()-Z"          
　　　　"fbodyaccmagmean"    	## "fBodyAccMag-mean()"             
　　　　"fbodyaccmagstd"     		## "fBodyAccMag-std()"               
　　　　"fbodyaccmagmeanfreq"      	## "fBodyAccMag-meanFreq()"         
　　　　"fbodybodyaccjerkmagmean"  	## "fBodyBodyAccJerkMag-mean()"      
　　　　"fbodybodyaccjerkmagstd"   	## "fBodyBodyAccJerkMag-std()"      
　　　　"fbodybodyaccjerkmagmeanfreq" ## "fBodyBodyAccJerkMag-meanFreq()"  
　　　　"fbodybodygyromagmean"     ## "fBodyBodyGyroMag-mean()"        
　　　　"fbodybodygyromagstd"      	## "fBodyBodyGyroMag-std()"          
　　　　"fbodybodygyromagmeanfreq" 	## "fBodyBodyGyroMag-meanFreq()"    
　　　　"fbodybodygyrojerkmagmean" 	## "fBodyBodyGyroJerkMag-mean()"     
　　　　"fbodybodygyrojerkmagstd"  	## "fBodyBodyGyroJerkMag-std()"     
　　　　"fbodybodygyrojerkmagmeanfreq"  ## "fBodyBodyGyroJerkMag-meanFreq()"

PART 4. Appropriately labeling the data set with the activity names (used in writing the tidy data set for submission

(1) First creating a matrix of the selected mean and std data. The variables used here are:
　　　　matmergdat   	## matrix containing the merged data  
　　　　
(2) Next the activity labels for the train and est data are merged. The variables used here are:
　　　　acttyptrn 	## train data activity variable
　　　　acttyptst 	## test data activity variable
　　　　acttypmerg   	## the merged activity variable

(3) Next merge the tidy data with the activity variable. Here the variables used are:
　　　　acttyp   	## data.frame for the acttypmerg data
　　　　tidydat1 	## The merged data with the activity variable added

(4) Next add the new column labels to this matrix data (tidydat1). The variables used here are:
　　　　newcolnam    ## updated with activity type label

(5) Next write the tidy data set into a txt file in the local c:\temp directory. The name of the file is tidydata1.txt.

PART 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject

(1) First get the volunteer id data for test and training records. Here the variables used are:
　　　　volunidtrn 	## train data (subject_test.txt file)
　　　　volunidtst 	## test data (subject_test.txt)
　　　　volunidmerg  ## the merged data for the volunteer id values
　　　　
(2) Next creating a matrix of all the feature variables. The name of the matrix is:
　　　　matmergdat1  ##  Matrix for all feature variables (train and test combined)
　　　　tidydat3     ##  matmergdt1 combined with activity and subject(volunteer) data

(3) Next creating a simple 3 column matrix for calculating mean of each feature. The variables used here are:
　　　　colname4	## The column names here are "feature","activity","subject"
        tidydat4 	## Contains the data for each feature  when calculating the mean

(4) Next prepare the matrix for the final data set for the mean data by feature by subject (vounteer). The name of 
    this matrix is:
　　　　tidydat2 	## final tidy data set with mean values and column labels
　　The column names for the file is represented by:
　　　　colnm 		## column labels for tidydat2

(5) Next for each feature calculate the mean and put it in the final data set. The ddply function of the plyr 
    package is used here to calculate the mean value. The dataset used here is:
 	     tidydat2 	## the final data for writing to a file

(6) And finally the data is written into the tidydata2.txt file in the local c:\temp directory.
