ans <- read.csv("D:/Data Analysis with R Programming/Week 3/anscombes.csv")

# there are 4 cohorts!
# separated into 4 different data frames by dataset
I <- ans |> subset(dataset == "I")
II <- ans |> subset(dataset == "II")
III <- ans |> subset(dataset == "III")
IV <- ans |> subset(dataset == "IV")

summary(I)
summary(II)
summary(III)
summary(IV)

# roughly identical summary stats

library(lattice)
xyplot(y ~ x | dataset, data = ans, col = "red", pch = 19, cex = 1.2, type = c("p"))

# data points are rather radically different
