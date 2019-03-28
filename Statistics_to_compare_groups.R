seg.df <- read.csv("http://goo.gl/qw303p")
summary(seg.df)

tmp.tab <- table(rep(c(1:4), times=c(25,25,25,20)))
chisq.test(tmp.tab)

table(seg.df$Segment)
chisq.test(table(seg.df$Segment))

table(seg.df$subscribe, seg.df$ownHome)
chisq.test(table(seg.df$subscribe, seg.df$ownHome))
chisq.test(table(seg.df$subscribe, seg.df$ownHome), correct=FALSE)

binom.test(12, 20, p=0.5)
binom.test(1200, 2000, p=0.5)
binom.test(120, 200, p=0.5)

# t.test(outcome variable ~ grouping variable)
t.test(income ~ ownHome, data=seg.df)
t.test(income ~ ownHome, data=subset(seg.df, Segment=="Travelers"))

seg.aov.own <- aov(income ~ ownHome, data=seg.df)
anova(seg.aov.own)
