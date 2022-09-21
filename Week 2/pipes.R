# native R pipe |>

nums <- seq(1,800,3)
nums |> min()
nums |> max()
nums |> mean()
nums |> sd()
nums |> range()

# pipes in longer expressions!
data <- read.csv("D:\\DataSets\\Library_Usage.csv")
data |> head()
# without pipes code can get cumbersome to read!!
as.data.frame(table(subset(data, Outside.of.County == "true", select = Patron.Type.Definition)))

# implementing the above using native pipe
data |> subset(Outside.of.County == "true", select = Patron.Type.Definition) |>
    table() |> as.data.frame()
# more clear and easy to comprehend code!!

# using dplyr pipe %>%
require(dplyr)
data %>% subset(Notice.Preference.Definition == "email") %>% 
    .["Patron.Type.Definition"] %>%  table() %>% 
    as.data.frame()

data %>% .$Notice.Preference.Definition %>%  table()

# IN CONTRAST TO NATIVE R PIPE "|>", THE DPLYR PIPE ALLOWS ACCESSING COLUMNS ON THE RHS OF THE PIPE
# OPERATOR USING THE PLACEHOLDER NOTATION!!!
