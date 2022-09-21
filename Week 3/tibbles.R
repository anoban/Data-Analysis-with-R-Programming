# how tibbles differ from standard R data frames?

# tibbles never change the data types of columns
# tibbles never change the names of columns
# tibbles never create row names
# make printing easier!
require(tidyverse)
df <- read_csv("D:\\DataSets\\youtube_trends\\CAvideos.csv", show_col_types = FALSE)

df
# readr::read_csv() reads in data as tibbles, by default

colnames(df)

length(df$video_id) == length(unique(df$channel_title))
length(unique(df$channel_title))

# lets try changing data types
# trending date is interpreted as character by default

df <- df %>% mutate(trending_date = strptime(trending_date, format = "%y.%d.%m"))
# works ;(

df$trending_date
df
# views more than 10,000,000
df %>% filter(views > 4e7) %>%
    ggplot(aes(x = channel_title, y = views, fill = channel_title)) +
    geom_col() +
    theme(legend.position = "None")

hotels <- read_csv("D:\\Data Analysis with R Programming\\Week 3\\hotel_bookings.csv", show_col_types = FALSE)
hotels

colnames(hotels)
cbind(hotels[,c("arrival_date_year", "arrival_date_month","arrival_date_day_of_month")])

hotels %>% mutate(date = paste(arrival_date_year, arrival_date_month, arrival_date_day_of_month, sep = "-")) %>% 
    mutate(date = strptime(date, "%Y-%B-%d")) %>% .$date

# worked :)

install.packages("readxl")
     
installed.packages() |> as.data.frame() |> 
    subset(Priority != "base" | is.na(Priority) == TRUE, select = c(Package, Version, Priority))   

remove.packages(c("MicrosoftR","RevoIOQ","RevoIOQ","RevoMods","RevoUtils","RevoUtilsMath","tissuesGeneExpression",
                  "titanic"))
