#Simple Demo
##Things we need to do
Find out the mushroom types in poisonous class which are uncertain. 

1. base on features of mushrooms using three different clustering methods to seperate three kinds of mushrooms (edibles, poisonous and uncertain) 
2. try to cluster data more than 3 classes (N=3,5,7). 
3. try three different training-test ratios.
4. plots using serveral methods in lectures 4 and 6
5. try lm and glm methods get linear fits for the data
6. SVM separate the combined data set


##Generally speaking, we need get 3\*3\*3=27 result. three methods, three classes, 3 training-test ratios. Determine the attributes used lm and glm methods. Separate data by SVM.

##Things before start (pretreat data set)

###(I have done this part in file BigDataProject2.R)

1. load data in table
2. convert data to data fame
3. change name of attributes
4. divide dataset according to training-test ratio 50-50 40-60 30-70
5. convert letters to values in dataset

the rules to convert letters is according to professor's doc:
using consecutive odd.

