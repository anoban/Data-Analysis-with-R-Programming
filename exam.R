data <- read.csv("D:/Data Analysis with R Programming/archive/flavors_of_cacao.csv")

str(data)
dim(data)

data |> subset(select = c(Rating, Cocoa.Percent, Bean.Type))

data |> summary()
mean(data$Rating, na.rm = TRUE)

data |> transform(Cocoa.Percent = as.numeric(gsub("%", "", Cocoa.Percent, fixed = TRUE))) |>
    subset(Rating >= 3.5 & Cocoa.Percent >= 70)

sdata <- data |> transform(Cocoa.Percent = as.numeric(gsub("%", "", Cocoa.Percent, fixed = TRUE))) |>
    subset(Rating >= 3.5 & Cocoa.Percent >= 70)

hist(sdata$Rating)

library(ggplot2)
sdata |> ggplot(aes(x = Rating)) +
    geom_bar()

sdata |> ggplot(aes(x = Company.Location, y = Rating)) +
    geom_point() +
    theme(axis.text.x = element_text(angle = 45))

sdata |> subset(!is.na(Rating) & !is.na(Company.Location)) |>
    ggplot(aes(x = Company.Location, fill = Rating)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90))

sdata |> subset(!is.na(Rating) & !is.na(Company.Location)) |>
    ggplot(aes(x = Company.Location, fill = Rating)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 90)) +
    facet_wrap(~Cocoa.Percent)
