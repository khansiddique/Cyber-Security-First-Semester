v=c(1,10,15,20)
v>10|v<5

any(v,v>5)
all(v,v>5)

v=v+1
v

rep(1,4)

seq(1,10,2)

v[1:3]

length(v)

y<-c(1,'test')

typeof(y)

y

sum(v)

sum(v[-1])

v[v>10]

v[v<10]=20
v

v[which((v<20))]


x<- c(88, NA, 12,168,13)
x
mean(x)

mean(x,na.rm = TRUE)

y<-c(88,NULL,12,168,13)
mean(y)

a=matrix(data =NA, nrow = 3, ncol = 2)
b=matrix(data =0, nrow = 3, ncol = 2)
b
a=a+1

a

b=b+1

b
a=matrix(data =NA, nrow = 3, ncol = 2)
b=matrix(data =c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)
b%*%b

b=matrix(data =c(1,2,3,4,5,6,7,8,9), nrow = 3, byrow = TRUE)

apply(b,1, mean)# mean for row

apply(b,2, mean) # mean for col

attributes(b)

dim(b)

colnames(b)

rownames(b)

rownames(b)<-c('r1','r2','r3')

dimnames(b)

fmatrix=matrix(c(46,30,21,25,50,50), nrow = 3,ncol = 2)

fmatrix

l=list(q=1,w='2',5500, TRUE)
l
l$q
l['q']
l[['q']]
l[1]
l[-2]

#names()

#Data Frame

#read.table(header = ,sep = ,na.strings = )

#read.csv()

#read.dialm()

df<- data.frame(height=c(150,160), weight=c(65,72))
df$weight
df[,2]
df
df[1,]
str(df)

df<- rbind(df,list(165,67))
df

df[df$height>160,]

states=c('CA','US','BD')
df2

summary(df)

# Data Logical Expresion

l=c(3,2,2,3,1,2,3,3)

ifelse(l>=3,l/2,l*2)

if(any(l>=3)){
  l/2
}else{
  l*2
}


if(all(l>=3)){
  l/2
}else{
  l*2
}

for(n in 1:10) {
  print(n^2)
}

r<-1
repeat{
  
  r=r+4;
  
  if(r>10) {
    break
  }
  print(r)
}
r
if(r>10) {
    break
  }
w<-1
while(w<=10){
  
  w=w+4;
  
  
  print(w)
}
w



w<-1
while(TRUE){
  
  w=w+4;
  if(w<10) {
    break
  }
  
  print(w)
}
w

oddcount=function(x){
  k<-0
  for(n in x){
    if(n%%2==1)k=k+1
  }
  
  return(k)
}

oddcount(c(1,2,3,7,9))

args(oddcount)
#stopinnot
#match.arg

#other Command

ls()
rm(w)
ls()
rm(list = ls())
ls()

#getwd(path) 
#setwd(path)

#save(filename)
#load(filename)

#setwd("C:\\Users\\HP\\Documents\\R Lecture\\")

#data()

#name & desc

# CO2
mean(CO2$uptake)
