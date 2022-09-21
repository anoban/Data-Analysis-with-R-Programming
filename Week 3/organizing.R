requireNamespace("tidyverse")
data <- readr::read_csv("D:\\DataSets\\San Francisco - Arrests_Presented_and_Prosecutions.csv")

range(data$`Arrest Date`, na.rm = TRUE)
names(data) <- make.names(colnames(data))

data %>% arrange(Case.Filed)

data %>% filter(Case.Filed == "Y" & Case.Type == "Felony") %>% group_by(Arrest.Date) 

data %>% filter(str_detect(Suspect.Charge.List,"11350") == TRUE)

libdata <- read.csv("D:\\DataSets\\Library_Usage.csv")
libdata %>%  filter(Patron.Type.Definition %in% c("ADULT","SENIOR")) %>%  .$Patron.Type.Definition %>% 
    unique()
# :)

libdata %>%  filter(!Patron.Type.Definition %in% c("ADULT","SENIOR")) %>% .$Patron.Type.Definition %>% 
    unique()

libdata %>% .[,c("Total.Checkouts","Total.Renewals")] %>%  apply(MARGIN = 2, FUN = as.numeric) 
libdata %>%  transform(Total.Checkouts = as.numeric(Total.Checkouts),
                       Total.Renewals = as.numeric(Total.Renewals)) %>% 
    summarise(sums = sum(Total.Checkouts, na.rm = TRUE), average = mean(Total.Checkouts, na.rm = TRUE))

# grouping data
libdata %>%  transform(Total.Checkouts = as.numeric(Total.Checkouts),
                       Total.Renewals = as.numeric(Total.Renewals)) %>% 
    group_by(Patron.Type.Definition) %>% 
    summarise(sums = sum(Total.Checkouts, na.rm = TRUE), average = mean(Total.Checkouts, na.rm = TRUE))

libdata %>%  transform(Total.Checkouts = as.numeric(Total.Checkouts),
                       Total.Renewals = as.numeric(Total.Renewals)) %>% 
    group_by(Patron.Type.Definition, Home.Library.Definition) %>% 
    summarise(sums = sum(Total.Checkouts, na.rm = TRUE), average = mean(Total.Checkouts, na.rm = TRUE))

apply(libdata[,c("Total.Checkouts","Total.Renewals")], MARGIN = 2, FUN = as.numeric)

hotels <- read_csv("D:\\Data Analysis with R Programming\\Week 3\\hotel_bookings.csv")
hotel <- hotels[,c('hotel', 'is_canceled', 'lead_time')]
names(hotel) <- c("hotel.type", "is.cancelled","lead.time")

hotels %>% unite(date, c(arrival_date_year, arrival_date_month, arrival_date_day_of_month), sep = "-") %>% 
    mutate(date = strptime(.$date, format = "%Y-%B-%d"))

guests <-  hotels[,c("adults", "children", "babies")] |> 
    apply(MARGIN = 1, FUN = sum)

mydata <- cbind(hotels, guests)   

for (i in 1:119390){
    if(is.na(mydata$guests[i]) == FALSE) {
        if(mydata$guests[i] == sum(mydata$adults[i], mydata$children[i], mydata$babies[i], na.rm = TRUE)){
            mydata[i,"eval.stat"] = TRUE
        }else {
            mydata[i,"eval.stat"] = FALSE
        }
    }else if (is.na(mydata$guests[i]) == TRUE){
        next
    }
}

table(mydata$eval.stat)
# good!

hotels |> transform(guests = adults + children + babies)

sum(hotels$is_canceled)
mean(hotels$lead_time)
