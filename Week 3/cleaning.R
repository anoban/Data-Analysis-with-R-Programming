install.packages(c("here","janitor","skimr"))
# packages helpful in data cleaning

require(here)
require(janitor)
require(tidyverse)

hotel <- read.csv("D:\\Data Analysis with R Programming\\Week 3\\hotel_bookings.csv")

# previewing data in R

skimr::skim_without_charts(hotel)
dplyr::glimpse(hotel)
str(hotel)
dim(hotel)
colnames(hotel)
head(hotel,2)


# wrangling

make.names(colnames(hotel), unique = TRUE)
dplyr::rename(hotel, "name" = "hotel",
              "status" = "is_canceled",
              "interval" = "lead_time",
              "yoarrival" = "arrival_date_year")

names(hotel) <- c(rep("A", 32))
hotel              
# its that easy!

# undo it :(
names(hotel) <- c("hotel","is_canceled","lead_time","arrival_date_year","arrival_date_month","arrival_date_week_number",
                  "arrival_date_day_of_month","stays_in_weekend_nights","stays_in_week_nights","adults",
                  "children","babies","meal","country","market_segment","distribution_channel","is_repeated_guest","previous_cancellations",        
                  "previous_bookings_not_canceled","reserved_room_type","assigned_room_type","booking_changes","deposit_type","agent",                         
                  "company","days_in_waiting_list","customer_type","adr","required_car_parking_spaces","total_of_special_requests",     
                  "reservation_status","reservation_status_date")

colnames(hotel)
# good :)

dplyr::rename_with(hotel, toupper)
dplyr::rename_with(hotel, tolower)

janitor::clean_names(hotel)

df <- data.frame(`first#col` = seq(1,10), `char#col` = rep("a", 10))
colnames(df)
# R automatically changes the column names!

janitor::clean_names(df)
make.names(names(df))

# I prefer base R's functions!
