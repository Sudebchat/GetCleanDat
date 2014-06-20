## Course Project : Getting And Cleaning Data
##
## It does the following
##
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive activity names. 
## 5.Creates a second, independent tidy data set with the average of each variable for 
##   each activity and each subject. 
##

## PART 1. Merges the training and the test sets to create one data set
##
## Assumes that the required text files are avaiable in unzipped
## format in the working directory

file_tst <- "./X_test.txt"   ## setting the test data file name
file_trn <- "./X_train.txt"  ## setting the train data file name

fl1trn <- scan(file_trn,what=numeric()) ## reading the train data
fl1tst <- scan(file_tst,what=numeric()) ## reading the test data

fl1merged <- c(fl1trn,fl1tst)  ## merging the two data sets

length(fl1merged)  ## check the number of elements in the merged data

## PART 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement. 

featurefl <- "./features.txt"      ## feature file name
feattest <- scan(featurefl,what="character")   ## read the feature names
lenfeat1 <- length(feattest)      ## get the number of elements in features data

## find the feature names with "mean" and "std" in them
colindex <- c(grep("mean()",feattest,value=FALSE),grep("std()",feattest,value=FALSE))
colindex  ## check the selection
lenfeat <- length(colindex)   ## get the number of features selected

rnlstdmean <- NULL  ## initializing the column position of the selected features

## creating column position list for mean and std data
for (i in 1:lenfeat) {
  rnlstdmean <- c(rnlstdmean, as.integer(feattest[colindex[i]-1]))
}
rnlstdmean    ## check the created data

## sorting the position in increasing order
indxstdmean <- sort(rnlstdmean, decreasing=FALSE) 
indxstdmean   ##  check the newly ordered positions

## Creating the data set with mean and std columns (values)

selectcols <- NULL
nfeatures <- 561    ## from the features list the total number of features
nrecords <- length(fl1merged)/nfeatures  ## the new number of records in
                                         ## training and test data combined
##
## Using matrix manipulation to select the columns with "mean" and
## "std" in column names
##
m1 <- NULL
m1 <- matrix(fl1merged, nrow=nrecords, ncol=nfeatures)
lst <- NULL   ## create the list of column numbers to be selected
for (i in 1:lenfeat) {
  lst <- c(lst,indxstdmean[i])
}
selectcols <- m1[,lst]   ## select the required columns

## Writing the tidy data
##
write(selectcols,file="tidydata",lenfeat,sep=",")

## check the content of tidy data
##
tsttidy <- scan("./tidydata",what=numeric(), sep=",")
head(tsttidy)

## PART 3. Using the descriptive activity names to name the activities in the 
## data set (no capital letters, no hyphens, no dots, no underscores)
## creating an ordered set of mean and std column labels

colnams<- NULL      ## initiaizing the new name list
ordindxcol <- sort(colindex, decreasing=FALSE)
ordindxcol
for (i in 1:lenfeat) {  ## listing the mean and std column labels
  colnams <- c(colnams, feattest[ordindxcol[i]])
}
colnams  ## checking the column names to be used for mean and std data

newcolnam <- NULL

## new column names for the features according to the naming rules 
newcolnam[1] <- "tbodyaccmeanx"       ## "tBodyAcc-mean()-X"               
newcolnam[2] <- "tbodyaccmeanY"       ## "tbodyAcc-mean()-y"              
newcolnam[3] <- "tbodyaccmeanz"       ## "tBodyAcc-mean()-Z"               
newcolnam[4] <- "tbodyaccstdx"        ## "tBodyAcc-std()-X"               
newcolnam[5] <- "tbodyaccstdy"        ## "tBodyAcc-std()-Y"                
newcolnam[6] <- "tbodyaccstdz"        ## "tBodyAcc-std()-Z"               
newcolnam[7] <- "tgravityaccmeanx"    ## "tGravityAcc-mean()-X"            
newcolnam[8] <- "tgravityaccmeany"    ## "tGravityAcc-mean()-Y"           
newcolnam[9] <- "tgravityaccmeanz"    ## "tGravityAcc-mean()-Z"            
newcolnam[10] <- "tgravityaccstdx"    ## "tGravityAcc-std()-X"            
newcolnam[11] <- "tgravityaccstdy"    ## "tGravityAcc-std()-Y"             
newcolnam[12] <- "tgravityaccstdz"    ## "tGravityAcc-std()-Z"            
newcolnam[13] <- "tbodyaccjerkmeanx"  ## "tBodyAccJerk-mean()-X"           
newcolnam[14] <- "tbodyaccjerkmeany"  ## "tBodyAccJerk-mean()-Y"          
newcolnam[15] <- "tbodyaccjerkmeanz"  ## "tBodyAccJerk-mean()-Z"           
newcolnam[16] <- "tbodyaccjerkstdx"   ## "tBodyAccJerk-std()-X"           
newcolnam[17] <- "tbodyaccjerkstdy"   ## "tBodyAccJerk-std()-Y"            
newcolnam[18] <- "tbodyaccjerkstdz"   ## "tBodyAccJerk-std()-Z"           
newcolnam[19] <- "tbodygyromeanx"     ## "tBodyGyro-mean()-X"              
newcolnam[20] <- "tbodygyromeany"     ## "tBodyGyro-mean()-Y"             
newcolnam[21] <- "tbodygyromeanz"     ## "tBodyGyro-mean()-Z"              
newcolnam[22] <- "tbodygyrostdx"      ## "tBodyGyro-std()-X"              
newcolnam[23] <- "tbodygyrostdy"      ## "tBodyGyro-std()-Y"               
newcolnam[24] <- "tbodygyrostdz"      ## "tBodyGyro-std()-Z"              
newcolnam[25] <- "tbodygyrojerkmeanx" ## "tBodyGyroJerk-mean()-X"          
newcolnam[26] <- "tbodygyrojerkmeany" ## "tBodyGyroJerk-mean()-Y"         
newcolnam[27] <- "tbodygyrojerkmeanz" ## "tBodyGyroJerk-mean()-Z"          
newcolnam[28] <- "tbodygyrojerkstdx"  ## "tBodyGyroJerk-std()-X"          
newcolnam[29] <- "tbodygyrojerkstdy"  ## "tBodyGyroJerk-std()-Y"           
newcolnam[30] <- "tbodygyrojerkstdz"  ## "tBodyGyroJerk-std()-Z"          
newcolnam[31] <- "tbodyaccmagmean"    ## "tBodyAccMag-mean()"              
newcolnam[32] <- "tbodyaccmagstd"     ## "tBodyAccMag-std()"              
newcolnam[33] <- "tgravityaccmagmean" ## "tGravityAccMag-mean()"           
newcolnam[34] <- "tgarvityaccmagstd"  ## "tGravityAccMag-std()"           
newcolnam[35] <- "tbodyaccjerkmagmean"  ## "tBodyAccJerkMag-mean()"          
newcolnam[36] <- "tbodyaccjerkmagstd"   ## "tBodyAccJerkMag-std()"          
newcolnam[37] <- "tbodygyromagmean"     ## "tBodyGyroMag-mean()"             
newcolnam[38] <- "tbodygyromagstd"      ## "tBodyGyroMag-std()"             
newcolnam[39] <- "tbodygyrojerkmagmean" ## "tBodyGyroJerkMag-mean()"         
newcolnam[40] <- "tbodygyrojerkmagstd"  ##"tBodyGyroJerkMag-std()"         
newcolnam[41] <- "fbodyaccmeanx"      ## "fBodyAcc-mean()-X"               
newcolnam[42] <- "fbodyaccmeany"      ## "fBodyAcc-mean()-Y"              
newcolnam[43] <- "fbodyaccmeanz"      ## "fBodyAcc-mean()-Z"               
newcolnam[44] <- "fbodyaccstdx"       ## "fBodyAcc-std()-X"               
newcolnam[45] <- "fbodyaccstdy"       ## "fBodyAcc-std()-Y"                
newcolnam[46] <- "fbodyaccstdz"       ## "fBodyAcc-std()-Z"               
newcolnam[47] <- "fbodyaccmeanfreqx"  ## "fBodyAcc-meanFreq()-X"           
newcolnam[48] <- "fbodyaccmeanfreqy"  ## "fBodyAcc-meanFreq()-Y"          
newcolnam[49] <- "fbodyaccmeanfreqz"  ## "fBodyAcc-meanFreq()-Z"
newcolnam[50] <- "fbodyaccjerkmeanx"  ## "fBodyAccJerk-mean()-X"
newcolnam[51] <- "fbodyaccjerkmeany"  ## "fBodyAccJerk-mean()-Y"           
newcolnam[52] <- "fbodyaccjerkmeanz"  ## "fBodyAccJerk-mean()-Z"          
newcolnam[53] <- "fbodyaccjerkstdx"   ## "fBodyAccJerk-std()-X"            
newcolnam[54] <- "fbodyaccjerkstdy"   ## "fBodyAccJerk-std()-Y"           
newcolnam[55] <- "fbodyaccjerkstdz"   ## "fBodyAccJerk-std()-Z"            
newcolnam[56] <- "fbodyaccjerkmeanfreqx"  ## "fBodyAccJerk-meanFreq()-X"    
newcolnam[57] <- "fbodyaccjerkmeanfreqy"  ## "fBodyAccJerk-meanFreq()-Y"       
newcolnam[58] <- "fbodyaccjerkmeanfreqz"  ## "fBodyAccJerk-meanFreq()-Z"      
newcolnam[59] <- "fbodygyromeanx"     ## "fBodyGyro-mean()-X"              
newcolnam[60] <- "fbodygyromeany"     ## "fBodyGyro-mean()-Y"             
newcolnam[61] <- "fbodygyromeanz"     ## "fBodyGyro-mean()-Z"              
newcolnam[62] <- "fbodygyrostdx"      ## "fBodyGyro-std()-X"              
newcolnam[63] <- "fbodygyrostdy"      ## "fBodyGyro-std()-Y"               
newcolnam[64] <- "fbodygyrostdz"      ## "fBodyGyro-std()-Z"              
newcolnam[65] <- "fbodygyromeanfreqx" ## "fBodyGyro-meanFreq()-X"          
newcolnam[66] <- "fbodygyromeanfreqy" ## "fBodyGyro-meanFreq()-Y"         
newcolnam[67] <- "fbodygyromeanfreqz" ## "fBodyGyro-meanFreq()-Z"          
newcolnam[68] <- "fbodyaccmagmean"    ## "fBodyAccMag-mean()"             
newcolnam[69] <- "fbodyaccmagstd"     ## "fBodyAccMag-std()"               
newcolnam[70] <- "fbodyaccmagmeanfreq"      ## "fBodyAccMag-meanFreq()"         
newcolnam[71] <- "fbodybodyaccjerkmagmean"  ## "fBodyBodyAccJerkMag-mean()"      
newcolnam[72] <- "fbodybodyaccjerkmagstd"   ## "fBodyBodyAccJerkMag-std()"      
newcolnam[73] <- "fbodybodyaccjerkmagmeanfreq" ## "fBodyBodyAccJerkMag-meanFreq()"  
newcolnam[74] <- "fbodybodygyromagmean"     ## "fBodyBodyGyroMag-mean()"        
newcolnam[75] <- "fbodybodygyromagstd"      ## "fBodyBodyGyroMag-std()"          
newcolnam[76] <- "fbodybodygyromagmeanfreq" ## "fBodyBodyGyroMag-meanFreq()"    
newcolnam[77] <- "fbodybodygyrojerkmagmean" ## "fBodyBodyGyroJerkMag-mean()"     
newcolnam[78] <- "fbodybodygyrojerkmagstd"  ## "fBodyBodyGyroJerkMag-std()"     
newcolnam[79] <- "fbodybodygyrojerkmagmeanfreq"  ## "fBodyBodyGyroJerkMag-meanFreq()"

## newcolnam   ## check the new names 

## PART 4. Appropriately labeling the data set with the activity names
##   (used in writing the tidy data set for submission)
##

## first creating a matrix of the selected mean and std data
##

matmergdat <- selectcols

## adding the column: activity type 
## for test and train data
acttyptrn <- scan("./y_train.txt", what=numeric())   ## train data labels
acttyptst <- scan("./y_test.txt", what=numeric())    ## test data labels
acttypmerg <- c(acttyptrn,acttyptst)

## merge the test data with the activity variable
acttyp <- data.frame(acttypmerg)
tidydat1 <- cbind(matmergdat,acttyp)

head(tidydat1)  ## chcking the content

## next add the new column labels to this matrix data
newcolnam[80] <- "activity"   ## activity type label
colnames(tidydat1) <- newcolnam

## write the tidy data set into a file
write.csv(tidydat1,file="c:/temp/tidydata1.txt",row.names=FALSE)

## check if the file can be read properly
df1 <- read.csv("c:/temp/tidydata1.txt", header=TRUE)
head(df1)

## PART 5. Creating a second, independent tidy data set with the average of
## each variable for each activity and each subject

## Volunteer id data for test and training records
volunidtrn <- scan("./subject_train.txt",what=numeric())   ## train data
volunidtst <- scan("./subject_test.txt",what=numeric())    ## test data
volunidmerg <- c(volunidtrn,volunidtst)

volnid <- data.frame(volunidmerg)  ## converting data to vertical frame

## first creating a matrix of all the feature variables
##
matmergdat1 <- fl1merged

## next adding the activity and subject(volunteer) data
tidydat3 <- cbind(matmergdat1,acttyp,volnid)

## creaing the simple feature column labels
ncolname <- NULL
for (i in 1:nfeatures) {
  ncolname[i] <- paste("feature",as.character(i), sep="")
}
ncolname[nfeatures+1] <- "activity"   ## activity type
ncolname[nfeatures+2] <- "subject"    ## volunteer id

colnames(tidydat3) <- ncolname  ## giving proper column labels to the intermediate data

## wil be using the plyr package here
library(plyr)

totalrow <- 6 * 30  ##  type of activities * number of subjects
tidydat2 <- as.numeric(c(1:totalrow*(nfeatures+2)))  ## container for the final result
tidydat2 <- matrix(tidydat2,nrow=totalrow,ncol=nfeatures+2)  ## set up as matrix

## setting up the column names for the final data set (tidydat2)
colnm <- NULL
for (i in 1:nfeatures) {
  colnm[i] <- paste("feature",as.character(i),"mean",sep="")
}
colnm[nfeatures+1] <- "activity"
colnm[nfeatures+2] <- "subject"
colnames(tidydat2) <- colnm

## setting up the column names for the intermediate data set to calculate means
colname4 <- c("feature", "activity", "subject")

## for each feature calculate the mean and put it in the final data set
for (i in 1:nfeatures) {
  ftmean <- matrix(0,nrow=totalrow,ncol=3)  ## intializing intermediate matrix
  tidydat4 <- tidydat3[,c(i,nfeatures+1,nfeatures+2)]  ## isolating the feature for calculation
  colnames(tidydat4) <- colname4   ## giving the input data the required column names
  ftmean <- ddply(tidydat4,.(activity,subject), summarize, nname=mean(feature))  ## calculating the mean
  tidydat2[,i] <- ftmean[,3]   ## put the calculated data in the final data.frame
  }
tidydat2[,nfeatures+1] <- ftmean[,1]  ## put the activity data in the data set
tidydat2[,nfeatures+2] <- ftmean[,2]  ## put the subject id in the data set

## write the data into a csv file
write.csv(tidydat2,file="c:/temp/tidydata2.txt",row.names=FALSE)

## Check if the file can be read properly
dft <- read.csv("c:/temp/tidydata2.txt", header=TRUE)
head(dft)
