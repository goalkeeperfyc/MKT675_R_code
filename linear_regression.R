sat.df <- read.csv("http://goo.gl/HKnl74")
summary(sat.df)

# plotting the data
library(gpairs)
gpairs(sat.df)

# response function
# y = ax1 + bx2 + cx3 + number
# y could be sell, market share, satisfication

# fitting a model with one predictor
m1 <- lm(overall ~ rides, data=sat.df)
str(m1)
summary(m1)

# a plot of the model
plot(overall ~ rides, data=sat.df,
     xlab="Satisfaction with Rides", ylab="Overall Satisfaction")
abline(m1, col='blue')
par(mfrow=c(2,2))
plot(m1)

# fitting a model with multiple predictors
m2 <- lm(overall ~ rides + games + wait + clean, data=sat.df)
summary(m2)

# same range of X

# plot
plot(sat.df$overall, fitted(m1), col='red',
     xlim=c(0,100), ylim=c(0,100),
     xlab="Actual Overall Satisfaction", ylab="Fitted Overall Satisfaction")
points(sat.df$overall, fitted(m2), col='blue')
legend("topleft", legend=c("model 1", "model 2"), 
       col=c("red", "blue"), pch=1)

# difference in R-square
anova(m1, m2)
