#load the data
store.df <- read.csv("http://goo.gl/QPDdMl")
summary(store.df)

#descriptives 1 
table(store.df$p1price)
prop.table(table(store.df$p1price))

#table as object
p1.table <- table(store.df$p1price)
p1.table
str(p1.table)

#plotting a table
plot(p1.table)

#two-way tables
table(store.df$p1price, store.df$p1prom)

#min max mean median var sd IQR mad

#percentile function
quantile(store.df$p1sales)

#visualization
hist(store.df$p1sales)
hist(store.df$p1sales, 
     main="Product 1 Weekly Sales Frequencies, All Stores",
     xlab="Product 1 Sales (Units)",
     ylab="Count" ) 

hist(store.df$p1sales, 
     main="Product 1 Weekly Sales Frequencies, All Stores",
     xlab="Product 1 Sales (Units)",
     ylab="Count",
     breaks=30,             # more columns 
     col="lightblue")       # color the bars

hist(store.df$p1sales, 
     main="Product 1 Weekly Sales Frequencies, All Stores",
     xlab="Product 1 Sales (Units)",
     ylab="Relative frequency", # changed
     breaks=30, 
     col="lightblue", 
     freq=FALSE )     # freq=FALSE for density

hist(store.df$p1sales, 
     main="Product 1 Weekly Sales Frequencies, All Stores",
     xlab="Product 1 Sales", ylab="Relative frequency",
     breaks=30, col="lightblue", freq=FALSE)
lines(density(store.df$p1sales, bw=10),  # bw = smoothing
      type="l", col="darkred", lwd=2)    # lwd = line width

#boxplot
boxplot(store.df$p2sales, xlab="Weekly sales", ylab="P2",
        main="Weekly sales of P2, All stores", horizontal=TRUE)
