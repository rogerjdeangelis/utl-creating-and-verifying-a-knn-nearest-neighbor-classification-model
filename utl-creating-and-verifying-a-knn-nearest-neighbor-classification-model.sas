Creating and verifying a knn nearest neighbor a classification model                                                                 
                                                                                                                                     
        Method                                                                                                                       
          1. split the iris data into a training and test data                                                                       
             dataframes(70% training and 30% testdata) .                                                                             
             We will build the classification model using the training data and                                                      
             then apply the model to the testdata(verification data),                                                                
          2. Three nearest neigbors is hard coded but you and iterate over other                                                     
             'numbers of nearest neighbors' and maybe improve the model.                                                             
          3. Just run the knn function to create the model and apply to testdata.                                                    
                                                                                                                                     
github                                                                                                                               
https://tinyurl.com/ybpg26gk                                                                                                         
https://github.com/rogerjdeangelis/utl-creating-and-verifying-a-knn-nearest-neighbor-classification-model                            
                                                                                                                                     
SAS Forum                                                                                                                            
https://tinyurl.com/ycrw5mm8                                                                                                         
https://communities.sas.com/t5/Statistical-Procedures/How-to-perform-a-KNN-clustering-after-Proc-Corresp/m-p/665645                  
                                                                                                                                     
                                                                                                                                     
Here is an example of k-means clustering                                                                                             
https://github.com/rogerjdeangelis/utl-R-kmeans-clustering--of-tweets                                                                
                                                                                                                                     
Python example using iris data (not run in a drop down)                                                                              
https://machinelearningmastery.com/tutorial-to-implement-k-nearest-neighbors-in-python-from-scratch/                                 
                                                                                                                                     
R                                                                                                                                    
https://rpubs.com/Drmadhu/IRISclassification                                                                                         
                                                                                                                                     
/*                   _                                                                                                               
(_)_ __  _ __  _   _| |_                                                                                                             
| | `_ \| `_ \| | | | __|                                                                                                            
| | | | | |_) | |_| | |_                                                                                                             
|_|_| |_| .__/ \__,_|\__|                                                                                                            
        |_|                                                                                                                          
*/                                                                                                                                   
                                                                                                                                     
options validvarname=upcase;                                                                                                         
libname sd1 "d:/sd1";                                                                                                                
data sd1.have;                                                                                                                       
   /* structure the SAS iris data to look like the R iris data */                                                                    
   retain sepallength sepalwidth petallength petalwidth species;                                                                     
   set sashelp.iris;                                                                                                                 
   array ns[*] _numeric_;                                                                                                            
   do i=1 to dim(ns);                                                                                                                
     ns[i]=ns[i]/10;                                                                                                                 
   end;                                                                                                                              
   drop i;                                                                                                                           
run;quit;                                                                                                                            
  SD1.HAVE total obs=150                                            
                                                                    
  SEPALLENGTH    SEPALWIDTH    PETALLENGTH    PETALWIDTH    SPECIES 
                                                                    
      5.0            3.3           1.4            0.2       Setosa  
      4.6            3.4           1.4            0.3       Setosa  
      4.6            3.6           1.0            0.2       Setosa  
      5.1            3.3           1.7            0.5       Setosa  
      5.5            3.5           1.3            0.2       Setosa  
      4.8            3.1           1.6            0.2       Setosa  
      5.2            3.4           1.4            0.2       Setosa  
  ...                                                               
                                                                                                                                     
/*           _               _                                                                                                       
  ___  _   _| |_ _ __  _   _| |_                                                                                                     
 / _ \| | | | __| `_ \| | | | __|                                                                                                    
| (_) | |_| | |_| |_) | |_| | |_                                                                                                     
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                    
                |_|                                                                                                                  
*/                                                                                                                                   
                                                                                                                                     
Results after applying the knn model to the test data.                                                                               
Note the model was created using the training data.                                                                                  
                                                                                                                                     
SAS TABLE                                                                                                                            
=========                                                                                                                            
                                                                                                                                     
WORK.WANTXPO total obs=4                                                                                                             
                                                                                                                                     
            PREDICTIONS FROM KNN MODEL K=3 NEAREST NEIGHBORS                                                                         
            =================================================                                                                        
                                                                                                                                     
 LAVELS        SETOSA    VERSICOLOR       VIRGINICA                                                                                  
                                                                                                                                     
 Setosa          15           0               0                                                                                      
 Versicolor       0          18               3   miss-classified                                                                    
 Virginica        0           1  miss-        11                                                                                     
                                 classified                                                                                          
                                                                                                                                     
 Sum             15          19               14                                                                                     
                                                                                                                                     
STATIC PRINTOUT                                                                                                                      
===============                                                                                                                      
                                                                                                                                     
Table of TESTDATA by PREDICT                                                                                                         
                                                                                                                                     
TESTDATA     PREDICT                                                                                                                 
                                                                                                                                     
Frequency  |                                                                                                                         
Percent    |                                                                                                                         
Row Pct    |                                                                                                                         
Col Pct    |Setosa  |Versicol|Virginic|  Total                                                                                       
           |        |or      |a       |                                                                                              
-----------+--------+--------+--------+                                                                                              
Setosa     |     15 |      0 |      0 |     15                                                                                       
           |  31.25 |   0.00 |   0.00 |  31.25                                                                                       
           | 100.00 |   0.00 |   0.00 |                                                                                              
           | 100.00 |   0.00 |   0.00 |                                                                                              
-----------+--------+--------+--------+                                                                                              
Versicolor |      0 |     18 |      3 |     21                                                                                       
           |   0.00 |  37.50 |   6.25 |  43.75                                                                                       
           |   0.00 |  85.71 |  14.29 |                                                                                              
           |   0.00 |  94.74 |  21.43 |                                                                                              
-----------+--------+--------+--------+                                                                                              
Virginica  |      0 |      1 |     11 |     12                                                                                       
           |   0.00 |   2.08 |  22.92 |  25.00                                                                                       
           |   0.00 |   8.33 |  91.67 |                                                                                              
           |   0.00 |   5.26 |  78.57 |                                                                                              
-----------+--------+--------+--------+                                                                                              
Total            15       19       14       48                                                                                       
              31.25    39.58    29.17   100.00                                                                                       
                                                                                                                                     
                                                                                                                                     
/*         _       _   _                                                                                                             
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                                  
/ __|/ _ \| | | | | __| |/ _ \| `_ \                                                                                                 
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                                
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                                
                                                                                                                                     
*/   

%utlfkil(d:/xpt/want.xpt)        
                                 
proc datasets lib=work nolist;   
  delete want;                   
run;quit;                        
                                                                                                                                                                      
%utl_submit_r64(resolve('                                                                                                            
library(class);                                                                                                                      
library(data.table);                                                                                                                 
library(gmodels);                                                                                                                    
library(haven);                                                                                                                      
library(SASxport);                                                                                                                   
/* set random seed so we can reproduce output */                                                                                     
set.seed(5);                                                                                                                         
iris<-read_sas("d:/sd1/have.sas7bdat");                                                                                              
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3));                                                                        
trainData <- iris[ind==1,];                                                                                                          
testData <- iris[ind==2,];                                                                                                           
/* removing factorvariable from training and test datasets */                                                                        
trainData1 <- trainData[-5];                                                                                                         
testData1 <- testData[-5];                                                                                                           
/* checking the dimensions of train and test datasets */                                                                             
iris_train_labels <- trainData$SPECIES;                                                                                              
str(trainData);                                                                                                                      
dim(iris_train_labels);                                                                                                              
/* NULL */                                                                                                                           
class(iris_train_labels);                                                                                                            
/* [1] "factor" */                                                                                                                   
iris_test_labels <- testData$SPECIES;                                                                                                
dim(iris_test_labels);                                                                                                               
iris_test_pred1 <- knn(train = trainData1, test = testData1, cl= iris_train_labels,k = 3,prob=TRUE);                                 
CrossTable(x = iris_test_labels, y = iris_test_pred1,prop.chisq=FALSE);                                                              
want<-as.data.table(table(iris_test_labels, iris_test_pred1));                                                                       
colnames(want)=c("TESTDATA","PREDICT","WEIGHT");                                                                                     
want;                                                                                                                                
write.xport(want,file="d:/xpt/want.xpt");                                                                                            
'));                                                                                                                                 
                                                                                                                                     
libname xpt xport "d:/xpt/want.xpt";                                                                                                 
data want;                                                                                                                           
  set xpt.want;                                                                                                                      
run;quit;                                                                                                                            
libname xpt clear;                                                                                                                   
                                                                                                                                     
ods exclude all;                                                                                                                     
ods output observed=wantXpo(rename=label=LEVELS);                                                                                    
proc corresp data=want dim=1 observed;                                                                                               
tables testdata, predict;                                                                                                            
weight weight;                                                                                                                       
run;quit;                                                                                                                            
ods select all;                                                                                                                      
                                                                                                                                     
proc freq data=want;                                                                                                                 
 tables testdata*predict;                                                                                                            
 weight weight;                                                                                                                      
run;quit;                                                                                                                            
                                                                                                                                     
                                                                                                                                     
