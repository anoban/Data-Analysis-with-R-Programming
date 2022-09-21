data <- read.csv("D:\\Data Analysis with R Programming\\Week 3\\hotel_bookings.csv")
str(data)
data <- data |> 
    transform(date = paste(arrival_date_year, arrival_date_month, arrival_date_day_of_month, sep = "-")) |>
    transform(date = strptime(date, "%Y-%B-%d"))

requireNamespace("tidyverse")              
usyt <- read_csv("D:\\DataSets\\youtube_trends\\USvideos.csv")

# separate
usyt %>%  separate(publish_time, sep = " ", into = c("pdate","ptime"))

# unite
usyt %>% unite(vidcat, c(channel_title,category_id), sep = ".") %>% .$vidcat
