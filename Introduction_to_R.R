#c is for vector
x <- c(2,4,6,8)

xnum <- c (1, 3.1415, 5, 7)
xlog <- c(TRUE, FALSE, TRUE, TRUE)
xchar <- c("foo", "bar", "boo", "far")

xmix <- c(1, TRUE, 3, "Hello World")

x2 <- c(x, x)
x2

c(x2, 100)

c(x2, "Hello")

xmix
xmix[1]

as.numeric(xmix[1])
as.numeric(xmix[1]) + 1.5

#summary is very important step in data analysis
summary(xnum)
summary(xchar)

x2 + 1
x2 * pi
#different length vectors multiple
(x+cos(0.5)) * x2

#length
length(x)

#change vector's type to str
str(x2)
str(xchar)

#sequences
xseq <- 1:10
1:5 * 2
1:(5*2)

#indexing
xnum[2:4]
xnum[c(1,3)]
mystart <- 2
xnum[mystart: sqrt(mystart+7)]

#negative indexing
#a negative index omits elements(return everything else)
xseq
xseq[-5:-7]

#indexing with boolean
xnum
xnum[c(FALSE, TRUE, TRUE, TRUE)]
xnum > 3 
xnum[xnum > 3]

#missing and interesting values
#na.rm is much easier
my.test.score <- c(91, 93, NA, NA)
mean(my.test.score)
max(my.test.score)
mean(my.test.score, na.rm=TRUE)
max(my.test.score, na.rm=TRUE)

#Other ways to omit
na.omit(my.test.score)
mean(na.omit(my.test.score))
is.na(my.test.score)
my.test.score[!is.na(my.test.score)]

#data frame
x.df <- data.frame(xnum, xlog, xchar)
x.df[2,1]
x.df[1,3]
x.df2 <- data.frame(xnum, xlog, xchar, stringsAsFactors=FALSE)
x.df[2,]
x.df[,3]
x.df[2:3,]
x.df[,1:2]

#negative index in data frame
x.df[-3,]
x.df[,-2]

#stroe data
store.num <- factor(c(3, 14, 21, 32, 54))
store.rev <- c(543, 654, 345, 678, 234)
store.visits <- c(45, 78, 32, 56, 34)     # visits, 1000s
store.manager <- c("Annie", "Bert", "Carla", "Dave", "Ella")
(store.df <- data.frame(store.num, store.rev, store.visits,
                        store.manager, stringsAsFactors=F))

#data checks
summary(store.df) # always recommended
store.df$store.manager
mean(store.df$store.rev)

#read and write csv
store.df
write.csv(store.df, row.names=FALSE)
write.csv(store.df, file='store-df.csv', row.names=FALSE)
read.csv('store-df.csv')  # "file=" is optional

#writing basic functions
se <- function(x) { sd(x) / sqrt(length(x)) }
se(store.df$store.visits)
mean(store.df$store.visits) + 1.96 * se(store.df$store.visits)

#document your functions inline
se <- function(x) {
  # computes standard error of the mean
  tmp.sd <- sd(x)      # standard deviation
  tmp.N  <- length(x)  # sample size
  tmp.se <- tmp.sd / sqrt(tmp.N)   # std error of the mean
  return(tmp.se)       # return() is optional but clear
}

se(store.df$store.visits)

#better version
se
function(x) {
  # computes standard error of the mean
  tmp.sd <- sd(x)      # standard deviation
  tmp.N  <- length(x)  # sample size
  tmp.se <- tmp.sd / sqrt(tmp.N)   # std error of the mean
  return(tmp.se)       # return() is optional but clear
}

#other ways to make sequences
seq(from=-5, to=28, by=4)
seq(from=-5, to=28, length=6)

#rep()
rep(c(1,2,3), each=3)
rep(seq(from=-3, to=13, by=4), c(1, 2, 3, 2, 1))

#loading and saving 
save(store.df, file="store-df-backup.RData")
rm(store.df)        
mean(store.df$store.rev)     # error

load("store-df-backup.RData")
mean(store.df$store.rev)     # works now