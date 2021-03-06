install.packages("class")
install.packages("gmodels")
install.packages("vegan")
install.packages("e1071")
library(class)
library(gmodels)

setwd('c:/Users/hfyjc/Desktop/BigDataProject2-master')

mr<-read.table("agaricus-lepiota.data", sep=",", header=FALSE)
str(mr)

mr.df<-as.data.frame(mr)
mr.df

names(mr)<-c('class', 'cshape', 'csurface', 'ccolor', 'bruises', 'odor', 'gattach', 'gspace', 'gsize',
             'gcolor', 'sshape', 'sroot', 'ssabove', 'ssbelow', 'scabove', 'scbelow', 'vtype', 'vcolor',
             'rnumber', 'rtype', 'spcolor', 'popnum', 'habitat')
names(mr)


mrf<-as.data.frame(mr,stringAsFactors=FALSE)
mrf[,c(1,23)]<-sapply(mrf[,c(1,23)], as.character)
# class
mrf$class[mrf$class=='e']<-0
mrf$class[mrf$class=='p']<-1
# cap-shape
mrf$cshape<-as.character(mrf$cshape)
mrf$cshape[mrf$cshape=='b']<-1
mrf$cshape[mrf$cshape=='c']<-3
mrf$cshape[mrf$cshape=='x']<-5
mrf$cshape[mrf$cshape=='f']<-7
mrf$cshape[mrf$cshape=='k']<-9
mrf$cshape[mrf$cshape=='s']<-11
# cap-surface
mrf$csurface<-as.character(mrf$csurface)
mrf$csurface[mrf$csurface=='f']<-1
mrf$csurface[mrf$csurface=='g']<-3
mrf$csurface[mrf$csurface=='y']<-5
mrf$csurface[mrf$csurface=='s']<-7
# cap-color
mrf$ccolor<-as.character(mrf$ccolor)
mrf$ccolor[mrf$ccolor=='n']<-1
mrf$ccolor[mrf$ccolor=='b']<-3
mrf$ccolor[mrf$ccolor=='c']<-5
mrf$ccolor[mrf$ccolor=='g']<-7
mrf$ccolor[mrf$ccolor=='r']<-9
mrf$ccolor[mrf$ccolor=='p']<-11
mrf$ccolor[mrf$ccolor=='u']<-13
mrf$ccolor[mrf$ccolor=='e']<-15
mrf$ccolor[mrf$ccolor=='w']<-17
mrf$ccolor[mrf$ccolor=='y']<-19
# bruises
mrf$bruises<-as.character(mrf$bruises)
mrf$bruises[mrf$bruises=='t']<-1
mrf$bruises[mrf$bruises=='f']<-3
# odor
mrf$odor<-as.character(mrf$odor)
mrf$odor[mrf$odor=='a']<-1
mrf$odor[mrf$odor=='l']<-3
mrf$odor[mrf$odor=='c']<-5
mrf$odor[mrf$odor=='y']<-7
mrf$odor[mrf$odor=='f']<-9
mrf$odor[mrf$odor=='m']<-11
mrf$odor[mrf$odor=='n']<-13
mrf$odor[mrf$odor=='p']<-15
mrf$odor[mrf$odor=='s']<-17
# gattach
mrf$gattach<-as.character(mrf$gattach)
mrf$gattach[mrf$gattach=='a']<-1
mrf$gattach[mrf$gattach=='d']<-3
mrf$gattach[mrf$gattach=='f']<-5
mrf$gattach[mrf$gattach=='n']<-7
# gspace
mrf$gspace<-as.character(mrf$gspace)
mrf$gspace[mrf$gspace=='c']<-1
mrf$gspace[mrf$gspace=='w']<-3
mrf$gspace[mrf$gspace=='d']<-5
# gsize
mrf$gsize<-as.character(mrf$gsize)
mrf$gsize[mrf$gsize=='b']<-1
mrf$gsize[mrf$gsize=='n']<-3
# gcolor
mrf$gcolor<-as.character(mrf$gcolor)
mrf$gcolor[mrf$gcolor=='k']<-1
mrf$gcolor[mrf$gcolor=='n']<-3
mrf$gcolor[mrf$gcolor=='b']<-5
mrf$gcolor[mrf$gcolor=='h']<-7
mrf$gcolor[mrf$gcolor=='g']<-9
mrf$gcolor[mrf$gcolor=='r']<-11
mrf$gcolor[mrf$gcolor=='o']<-13
mrf$gcolor[mrf$gcolor=='p']<-15
mrf$gcolor[mrf$gcolor=='u']<-17
mrf$gcolor[mrf$gcolor=='e']<-19
mrf$gcolor[mrf$gcolor=='w']<-21
mrf$gcolor[mrf$gcolor=='y']<-23
# sshape
mrf$sshape<-as.character(mrf$sshape)
mrf$sshape[mrf$sshape=='e']<-1
mrf$sshape[mrf$sshape=='t']<-3
# sroot
mrf$sroot<-as.character(mrf$sroot)
mrf$sroot[mrf$sroot=='b']<-1
mrf$sroot[mrf$sroot=='c']<-3
mrf$sroot[mrf$sroot=='u']<-5
mrf$sroot[mrf$sroot=='e']<-7
mrf$sroot[mrf$sroot=='z']<-9
mrf$sroot[mrf$sroot=='r']<-11
mrf$sroot[mrf$sroot=='?']<-13
# ssabove
mrf$ssabove<-as.character(mrf$ssabove)
mrf$ssabove[mrf$ssabove=='f']<-1
mrf$ssabove[mrf$ssabove=='y']<-3
mrf$ssabove[mrf$ssabove=='k']<-5
mrf$ssabove[mrf$ssabove=='s']<-7
# ssbelow
mrf$ssbelow<-as.character(mrf$ssbelow)
mrf$ssbelow[mrf$ssbelow=='f']<-1
mrf$ssbelow[mrf$ssbelow=='y']<-3
mrf$ssbelow[mrf$ssbelow=='k']<-5
mrf$ssbelow[mrf$ssbelow=='s']<-7
# scabove
mrf$scabove<-as.character(mrf$scabove)
mrf$scabove[mrf$scabove=='n']<-1
mrf$scabove[mrf$scabove=='b']<-3
mrf$scabove[mrf$scabove=='c']<-5
mrf$scabove[mrf$scabove=='g']<-7
mrf$scabove[mrf$scabove=='o']<-9
mrf$scabove[mrf$scabove=='p']<-11
mrf$scabove[mrf$scabove=='e']<-13
mrf$scabove[mrf$scabove=='w']<-15
mrf$scabove[mrf$scabove=='y']<-17
# scbelow
mrf$scbelow<-as.character(mrf$scbelow)
mrf$scbelow[mrf$scbelow=='n']<-1
mrf$scbelow[mrf$scbelow=='b']<-3
mrf$scbelow[mrf$scbelow=='c']<-5
mrf$scbelow[mrf$scbelow=='g']<-7
mrf$scbelow[mrf$scbelow=='o']<-9
mrf$scbelow[mrf$scbelow=='p']<-11
mrf$scbelow[mrf$scbelow=='e']<-13
mrf$scbelow[mrf$scbelow=='w']<-15
mrf$scbelow[mrf$scbelow=='y']<-17
# vtype
mrf$vtype<-as.character(mrf$vtype)
mrf$vtype[mrf$vtype=='p']<-1
mrf$vtype[mrf$vtype=='u']<-3
# vcolor
mrf$vcolor<-as.character(mrf$vcolor)
mrf$vcolor[mrf$vcolor=='n']<-1
mrf$vcolor[mrf$vcolor=='o']<-3
mrf$vcolor[mrf$vcolor=='w']<-5
mrf$vcolor[mrf$vcolor=='y']<-7
# rnumber
mrf$rnumber<-as.character(mrf$rnumber)
mrf$rnumber[mrf$rnumber=='n']<-1
mrf$rnumber[mrf$rnumber=='o']<-3
mrf$rnumber[mrf$rnumber=='t']<-5
# rtype
mrf$rtype<-as.character(mrf$rtype)
mrf$rtype[mrf$rtype=='c']<-1
mrf$rtype[mrf$rtype=='e']<-3
mrf$rtype[mrf$rtype=='f']<-5
mrf$rtype[mrf$rtype=='l']<-7
mrf$rtype[mrf$rtype=='n']<-9
mrf$rtype[mrf$rtype=='p']<-11
mrf$rtype[mrf$rtype=='s']<-13
mrf$rtype[mrf$rtype=='z']<-15
# spcolor
mrf$spcolor<-as.character(mrf$spcolor)
mrf$spcolor[mrf$spcolor=='k']<-1
mrf$spcolor[mrf$spcolor=='n']<-3
mrf$spcolor[mrf$spcolor=='b']<-5
mrf$spcolor[mrf$spcolor=='h']<-7
mrf$spcolor[mrf$spcolor=='r']<-9
mrf$spcolor[mrf$spcolor=='o']<-11
mrf$spcolor[mrf$spcolor=='u']<-13
mrf$spcolor[mrf$spcolor=='w']<-15
mrf$spcolor[mrf$spcolor=='y']<-17
# popnum
mrf$popnum<-as.character(mrf$popnum)
mrf$popnum[mrf$popnum=='a']<-1
mrf$popnum[mrf$popnum=='c']<-3
mrf$popnum[mrf$popnum=='n']<-5
mrf$popnum[mrf$popnum=='s']<-7
mrf$popnum[mrf$popnum=='v']<-9
mrf$popnum[mrf$popnum=='y']<-11
# habitat
mrf$habitat<-as.character(mrf$habitat)
mrf$habitat[mrf$habitat=='g']<-1
mrf$habitat[mrf$habitat=='l']<-3
mrf$habitat[mrf$habitat=='m']<-5
mrf$habitat[mrf$habitat=='p']<-7
mrf$habitat[mrf$habitat=='u']<-9
mrf$habitat[mrf$habitat=='w']<-11
mrf$habitat[mrf$habitat=='d']<-13


dataset.df<-sample(nrow(mrf), 1*nrow(mrf))
## training-test dataset
train.df<-sample(nrow(mrf), 0.7*nrow(mrf))
#train.df<-sample(nrow(mrf), 0.6*nrow(mrf))
#train.df<-sample(nrow(mrf), 0.5*nrow(mrf))

#train set
mrftrain.df<-mrf[train.df,]
#mrftrain.df<-mrf[train.df,]
#mrftrain.df<-mrf[train.df,]
#mrftest set
mrftest.df<-mrf[-train.df,]
#mrftest.df<-mrf[-train.df,]
#mrftest.df<-mrf[-train.df,]


# k-means (no need train and test dataset)
kc3<-kmeans(dataset.df,3)
#kc5<-kmeans(dataset.df,5)
#kc7<-kmeans(dataset.df,7)

# knn
# get train label
knn_train_label<-mrftrain.df[,1]
# remove label
knn_train_data<-mrftrain.df[,2:23]
knn_test_data<-mrftest.df[,2:23]
# return prediction of test set
knn_pred<-knn(train=knn_train_data, test=knn_test_data, cl=knn_train_label,k= 7)
# eveluating knn
knn_test_label<-mrftest.df[,1]
CrossTable(x=knn_test_label, y=knn_pred, prop.chisq=FALSE)

# Hierarchical clustering
library(vegan)
distance.ex<-vegdist(mrftrain.df, method="euc", na.rm=TRUE)
hclust.ex<-hclust(distance.ex, method="ward.D2")
plot(hclust.ex,hang=-1)


pairs(class~cshape+csurface+ccolor+bruises+odor, data=mr)

# lm model
lm_model<-lm(mrftrain.df$ccolor ~ mrftrain.df$gspace, data=mrftrain.df)
# lm predict
lm_pred <- predict(lm_model, data=mrftest.df)
#plot(class~sshape+sroot, data=mr)
plot(mr$ccolor, mr$gspace, xlab = "ccolor", ylab='gspace',
     main="ccolor-gspace graph")

#glm
glm_res<-glm(as.numeric(mrf$ccolor) ~ as.numeric(mrf$gspace) + as.numeric(mrf$gsize) + 
               as.numeric(mrf$gattach) + as.numeric(mrf$bruises), family = gaussian, data = mrf)
summary(glm_res)

# SVM separate uncertain dataset
library(e1071)
# get uncertain dataset
uncertain <- mrf[mrf$class==1,]
uncertain.df<-sample(nrow(uncertain), 1*nrow(uncertain))
svm_res <- svm(as.numeric(uncertain$ccolor) ~ as.numeric(uncertain$gspace) + 
                 as.numeric(uncertain$gsize) + as.numeric(uncertain$gattach) + 
                 as.numeric(uncertain$bruises), data=uncertain, kernel="linear")
