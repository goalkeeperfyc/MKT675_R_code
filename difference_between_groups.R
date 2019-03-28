seg.df <- read.csv("http://goo.gl/qw303p")
summary(seg.df)
mean(seg.df$income[seg.df$Segment == "Moving up"])
mean(seg.df$income[seg.df$Segment == "Moving up" &
                     seg.df$subscribe == "subNo"])
mean(seg.df$income[seg.df$Segment == "Moving up"])

# by(variable, grouping, function)
by(seg.df$income, seg.df$Segment, mean)
by(seg.df$income, list(seg.df$Segment, seg.df$subscribe), mean)

aggregate(income ~ Segment, data=seg.df, mean)
aggregate(income ~ Segment + ownHome, data=seg.df, mean)

agg.data <- aggregate(income ~ Segment + ownHome, 
                      data = seg.df, mean)
table(seg.df$Segment, seg.df$ownHome)
with(seg.df, table(Segment, ownHome))

with(seg.df, prop.table((table(Segment, ownHome))))
with(seg.df, prop.table(table(Segment, ownHome), margin=1))

aggregate(kids ~ Segment, data=seg.df, sum)

library(lattice)
histogram(~subscribe | Segment, data=seg.df)
histogram(~subscribe | Segment, data=seg.df, type="count", 
          layout=c(4,1), col=c("burlywood", "darkolivegreen"))
histogram(~subscribe | Segment + ownHome, data=seg.df)
# histogram 直方图

seg.mean <- aggregate(income ~ Segment, 
                      data = seg.df, mean)
barchart(income ~ Segment, data=seg.mean, col="grey")

seg.mean <- aggregate(income ~ Segment, data=seg.df, mean)
library(lattice)
barchart(income ~ Segment, data=seg.mean, col="grey")

seg.agg <- aggregate(income ~ Segment + ownHome, data=seg.df, mean)
barchart(income ~ Segment, data=seg.agg, 
         groups=ownHome, auto.key=TRUE,
         par.settings = simpleTheme(col=c("gray90", "gray60")) )

bwplot(Segment ~ income, data = seg.df, horizontal = TRUE,
       xlab = "Income")
bwplot(Segment ~ income | ownHome, data = seg.df,
       horizontal = TRUE, xlab = "Income")

for (i in 1:10) {print(i)}

i.seq <- seq(from=2.1, to=6.2, by=0.65)
for (i in i.seq) { print(i) }


