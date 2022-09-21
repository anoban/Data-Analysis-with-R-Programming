require(tidyverse)
require(RColorBrewer)
setwd("D:/Data Analysis with R Programming")
penguins <- read_csv("penguins-raw.csv", col_names = TRUE)

# relationship between body mass & flipper length
plot(penguins$`Body Mass (g)`,penguins$`Flipper Length (mm)`, col="red", pch=19,
     xlab = "Body mass of Palmer Island penguins (grams)",
     ylab = "Flipper length of Palmer Island penguins (in millimeters)",
     main = "Flipper length vs body mass of Palmer Island penguins")

plot(penguins$`Body Mass (g)`,penguins$`Flipper Length (mm)`, col=factor(penguins$Species), pch=19,
     xlab = "Body mass of Palmer Island penguins (grams)",
     ylab = "Flipper length of Palmer Island penguins (in millimeters)",
     main = "Flipper length vs body mass of Palmer Island penguins")

cols <- c()
for(i in penguins$Species){
    if(i == "Adelie Penguin (Pygoscelis adeliae)"){
        cols <- c(cols, "#00C7FF")
    }else if(i == "Gentoo penguin (Pygoscelis papua)"){
        cols <- c(cols, "#FF6D25")
    }else if(i == "Chinstrap penguin (Pygoscelis antarctica)"){
        cols <- c(cols, "#01FF25")
    }
}

plot(penguins$`Body Mass (g)`,penguins$`Flipper Length (mm)`, col=cols, pch=19,
     xlab = "Body mass of Palmer Island penguins (grams)", cex=1.5,
     ylab = "Flipper length of Palmer Island penguins (in millimeters)",
     main = "Flipper length vs body mass of Palmer Island penguins")

par(mar=c(4,4,2,2), oma=c(2,2,1,1), mfrow=c(1,2))
plot(penguins$`Body Mass (g)`,penguins$`Flipper Length (mm)`, col="violet", pch=19,
     xlab = "Body mass of Palmer Island penguins (grams)",
     ylab = "Flipper length of Palmer Island penguins (in millimeters)",
     main = "Flipper length vs body mass of Palmer Island penguins")
plot(penguins$`Body Mass (g)`,penguins$`Flipper Length (mm)`, col=cols, pch=19,
     xlab = "Body mass of Palmer Island penguins (grams)", cex=1.5,
     ylab = "Flipper length of Palmer Island penguins (in millimeters)",
     main = "Flipper length vs body mass of Palmer Island penguins")
