# Get and clean data project

#Clear environment

rm(list=ls())

#I plan to use group_by from DPLYR

#Install.packages("dplyr")
library(dplyr)

#Define a working directory and
#Set the working directory to the project folder

if(! file.exists("coursera")){dir.create("coursera")}
setwd(file.path(getwd(),"coursera"))

if(! file.exists("get and clean data")){dir.create("get and clean data")}
setwd(file.path(getwd(),"get and clean data"))

if(! file.exists("project")){dir.create("project")}
setwd(file.path(getwd(),"project"))

#Download the data

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

#Unzip the file

zipf<-paste(file.path(getwd()),"/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",sep="")
extractdir<-file.path(getwd())
unzip(zipf,exdir=extractdir)

#record the download date

datadownloaded<-date()
write.csv(datadownloaded,"download_date.txt")

#Change the working directory

setwd("./uci har dataset")

#Read in the Activity labels

actlabel<-read.csv("activity_labels.txt",header=FALSE,sep="")

#change working directory

setwd(file.path(getwd(),"/train"))

#read the training data

train<-read.csv("X_train.txt",header=FALSE,sep="")

#Read in the training subject file

subjtrain<-read.csv("subject_train.txt",header=FALSE,sep="")
colnames(subjtrain)<-"subject"

#Read in the training activity file

acttrain<-read.csv("y_train.txt",header=FALSE,sep="")
colnames(acttrain)<-"activity"

#Change directory and read in the test data

setwd("../")
setwd(file.path(getwd(),"/test"))
test<-read.csv("X_test.txt",header=FALSE,sep="")

#Read in the testing subject file

subjtest<-read.csv("subject_test.txt",header=FALSE,sep="")
colnames(subjtest)<-"subject"

#Read in the test activity file

acttest<-read.csv("y_test.txt",header=FALSE,sep="")
colnames(acttest)<-"activity"

#reset the working directory and read in the
#feature list

setwd("../")
feeture<-read.csv("features.txt",header=FALSE,sep="")

#Add column names to the test and train dataframes

colnames(test)<-feeture$V2
colnames(train)<-feeture$V2

#Add the Subject and activity to each dataframe

train<-cbind(train,subjtrain)
train<-cbind(train,acttrain)

test<-cbind(test,subjtest)
test<-cbind(test,acttest)

#Combine the dataframes

train_test<-rbind(train,test)

#Convert the activity code to a descriptive name

train_test$activity<-actlabel[match(train_test$activity,actlabel$V1),"V2"]

#Extract only mean and standard deviation fields

mn<-grep("mean",names(train_test))
st<-grep("std",names(train_test))
both<-c(mn,st)
train_test2<-train_test[,both]
train_test2<-cbind(train_test2,train_test$activity,train_test$subject)
colnames(train_test2)[names(train_test2) == "train_test$activity"] <- "activity"
colnames(train_test2)[names(train_test2) == "train_test$subject"] <- "subject"

#Tidy data field names

names(train_test2)<-tolower(names(train_test2))         #lower case
names(train_test2)<-gsub("-","",names(train_test2))     #Remove dash
names(train_test2)<-gsub("[()]","",names(train_test2))  #Remove parentheses

#Select just the fields with means

avgs<-train_test2[,grep("mean",names(train_test2))]

#Add back in the activity and subject fields
#Rename the added fields

avgs<-cbind(avgs,train_test$activity,train_test$subject)
colnames(avgs)[names(avgs) == "train_test$activity"] <- "activity"
colnames(avgs)[names(avgs) == "train_test$subject"] <- "subject"

#Redefine the data frame as a table 
#Group by subject and activity
#Compute averages by subject and activity

avgs<-tbl_df(avgs)
avgs_by<-avgs %>% group_by(subject,activity)
avgs_by<-summarise_all(avgs_by, mean)

#Reset the working directory up a level

setwd("../")

#Write out the tidy data

write.table(avgs_by,"tidydata.txt",sep="")


