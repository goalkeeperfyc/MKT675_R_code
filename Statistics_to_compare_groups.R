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

aggregate(income ~ Segment, mean, data=seg.df)
seg.aov.own <- aov(income ~ ownHome, data=seg.df)
anova(seg.aov.own)

#model comparsion
anova(aov(income ~ Segment,           data=seg.df),
      aov(income ~ Segment + ownHome, data=seg.df))

library(multcomp)
seg.aov <- aov(income ~ -1 + Segment, data=seg.df)   # model w/o int.
by.seg  <- glht(seg.aov)                             # means and CIs
plot(by.seg, xlab="Income", main="Mean Ilibrary(multcomp)ncome by Segment (95% CI)")

# stepwise ANOVA
seg.aov.step <- step(aov(income ~ ., data=seg.df))
anova(seg.aov.step)

# install.packages("BayesFactor")   # if needed
library(BayesFactor)
set.seed(96761)                     # optional, for replication
seg.bf1 <- lmBF(income ~ Segment,           data=seg.df)
seg.bf2 <- lmBF(income ~ Segment + ownHome, data=seg.df)
