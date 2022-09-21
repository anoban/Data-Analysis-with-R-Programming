data <- read.csv("D:/Data Analysis with R Programming/Week 3/hotel_bookings.csv")
library(ggplot2)

colnames(data)
dim(data)

data |> ggplot(aes(x = (adults + children + babies), y = lead_time, fill = customer_type)) +
    geom_boxplot() + 
    theme_bw() + 
    ggtitle("Lead time vs package size") +
    labs(subtitle = "Lead time distributions for different client cohorts",
         caption = "Air BnB Rentals - NYC, New York") +
    xlab("Package size") +
    ylab("Lead time") +
    geom_text(x = 20, y = 400,
              label = "Contract clients have the largest interquartile distance",
              angle = 90, col = "red", size = 10)

# saving plots
getwd()
setwd("D:/Data Analysis with R Programming/Week 4/")
ggsave("dummy.png", width = 10, height = 5, units = "in")
