library(tidyverse)

readrs <- read_csv("D:/DataSets/Library_Usage.csv", show_col_types = FALSE)
readrs
names(readrs) <- make.names(names(readrs))

colnames(readrs)
# [1] "Patron.Type.Code"             "Patron.Type.Definition"       "Total.Checkouts"             
# [4] "Total.Renewals"               "Age.Range"                    "Home.Library.Code"           
# [7] "Home.Library.Definition"      "Circulation.Active.Month"     "Circulation.Active.Year"     
# [10] "Notice.Preference.Code"       "Notice.Preference.Definition" "Provided.Email.Address"      
# [13] "Year.Patron.Registered"       "Outside.of.County"            "Supervisor.District"     

dummy <- readrs[,c("Year.Patron.Registered","Patron.Type.Definition","Total.Checkouts")]
