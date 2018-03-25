

setwd('/Users/yiqian/Documents/GitHub/BigDataProject2')

mr<-read.table("agaricus-lepiota.data", sep=",", header=FALSE)
str(mrdata)

mr.df<-as.data.frame(mrdata)
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
mrf$class[mrf$bruises=='t']<-1
mrf$class[mrf$bruises=='f']<-3
# odor
mrf$class[mrf$odor=='a']<-1
mrf$class[mrf$odor=='l']<-3
mrf$class[mrf$odor=='c']<-5
mrf$class[mrf$odor=='y']<-7
mrf$class[mrf$odor=='f']<-9
mrf$class[mrf$odor=='m']<-11
mrf$class[mrf$odor=='n']<-13
mrf$class[mrf$odor=='p']<-15
mrf$class[mrf$odor=='s']<-17
# gattach
mrf$class[mrf$gattach=='a']<-1
mrf$class[mrf$gattach=='d']<-3
mrf$class[mrf$gattach=='f']<-5
mrf$class[mrf$gattach=='n']<-7
# gspace
mrf$class[mrf$gspace=='c']<-1
mrf$class[mrf$gspace=='d']<-3
mrf$class[mrf$gspace=='f']<-5
mrf$class[mrf$gspace=='n']<-7
# gsize
mrf$class[mrf$gsize=='b']<-1
mrf$class[mrf$gsize=='n']<-3
# gcolor
mrf$class[mrf$gcolor=='k']<-1
mrf$class[mrf$gcolor=='n']<-3
mrf$class[mrf$gcolor=='b']<-5
mrf$class[mrf$gcolor=='h']<-7
mrf$class[mrf$gcolor=='g']<-9
mrf$class[mrf$gcolor=='r']<-11
mrf$class[mrf$gcolor=='o']<-13
mrf$class[mrf$gcolor=='p']<-15
mrf$class[mrf$gcolor=='u']<-17
mrf$class[mrf$gcolor=='e']<-19
mrf$class[mrf$gcolor=='w']<-21
mrf$class[mrf$gcolor=='y']<-23
# sshape
mrf$class[mrf$sshape=='e']<-1
mrf$class[mrf$sshape=='t']<-3
# sroot
mrf$class[mrf$sroot=='b']<-1
mrf$class[mrf$sroot=='c']<-3
mrf$class[mrf$sroot=='u']<-5
mrf$class[mrf$sroot=='e']<-7
mrf$class[mrf$sroot=='z']<-9
mrf$class[mrf$sroot=='r']<-11
mrf$class[mrf$sroot=='?']<-13
# ssabove
mrf$class[mrf$ssabove=='f']<-1
mrf$class[mrf$ssabove=='y']<-3
mrf$class[mrf$ssabove=='k']<-5
mrf$class[mrf$ssabove=='s']<-7
# ssbelow
mrf$class[mrf$ssbelow=='f']<-1
mrf$class[mrf$ssbelow=='y']<-3
mrf$class[mrf$ssbelow=='k']<-5
mrf$class[mrf$ssbelow=='s']<-7
# scabove
mrf$class[mrf$scabove=='n']<-1
mrf$class[mrf$scabove=='b']<-3
mrf$class[mrf$scabove=='c']<-5
mrf$class[mrf$scabove=='g']<-7
mrf$class[mrf$scabove=='o']<-9
mrf$class[mrf$scabove=='p']<-11
mrf$class[mrf$scabove=='e']<-13
mrf$class[mrf$scabove=='w']<-15
mrf$class[mrf$scabove=='y']<-17
# scbelow
mrf$class[mrf$scbelow=='n']<-1
mrf$class[mrf$scbelow=='b']<-3
mrf$class[mrf$scbelow=='c']<-5
mrf$class[mrf$scbelow=='g']<-7
mrf$class[mrf$scbelow=='o']<-9
mrf$class[mrf$scbelow=='p']<-11
mrf$class[mrf$scbelow=='e']<-13
mrf$class[mrf$scbelow=='w']<-15
mrf$class[mrf$scbelow=='y']<-17
# vtype
mrf$class[mrf$vtype=='p']<-1
mrf$class[mrf$vtype=='u']<-3
# vcolor
mrf$class[mrf$vcolor=='n']<-1
mrf$class[mrf$vcolor=='o']<-3
mrf$class[mrf$vcolor=='w']<-5
mrf$class[mrf$vcolor=='y']<-7
# rnumber
mrf$class[mrf$rnumber=='n']<-1
mrf$class[mrf$rnumber=='o']<-3
mrf$class[mrf$rnumber=='t']<-5
# rtype
mrf$class[mrf$rtype=='c']<-1
mrf$class[mrf$rtype=='e']<-3
mrf$class[mrf$rtype=='f']<-5
mrf$class[mrf$rtype=='l']<-7
mrf$class[mrf$rtype=='n']<-9
mrf$class[mrf$rtype=='p']<-11
mrf$class[mrf$rtype=='s']<-13
mrf$class[mrf$rtype=='z']<-15
# spcolor
mrf$class[mrf$spcolor=='k']<-1
mrf$class[mrf$spcolor=='n']<-3
mrf$class[mrf$spcolor=='b']<-5
mrf$class[mrf$spcolor=='h']<-7
mrf$class[mrf$spcolor=='r']<-9
# popnum
mrf$class[mrf$popnum=='a']<-1
mrf$class[mrf$popnum=='c']<-3
mrf$class[mrf$popnum=='n']<-5
mrf$class[mrf$popnum=='s']<-7
mrf$class[mrf$popnum=='v']<-9
mrf$class[mrf$popnum=='y']<-11
# habitat
mrf$class[mrf$habitat=='g']<-1
mrf$class[mrf$habitat=='l']<-3
mrf$class[mrf$habitat=='m']<-5
mrf$class[mrf$habitat=='p']<-7
mrf$class[mrf$habitat=='u']<-9
mrf$class[mrf$habitat=='w']<-11
mrf$class[mrf$habitat=='d']<-13


pairs(class~cshape+csurface+ccolor, data=mr)

plot(class~sshape+sroot, data=mr)

