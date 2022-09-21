# ggplot2
library(tidyverse)

data <- read_csv("D:/Data Analysis with R Programming/Week 1/penguins.csv")

data %>% ggplot(aes(x = flipper_length_mm/10, y = body_mass_g/1000, col = as.factor(species))) + 
    geom_point() +
    xlab("Flipper length (in cm)") +
    ylab("Body mass (in kg)") +
    theme(legend.position = "None")

data %>% ggplot(aes(x = flipper_length_mm/10, y = body_mass_g/1000, col = as.factor(species))) + 
    geom_point(size = 2) +
    geom_smooth(method = stats::lm, formula = "y ~ x", se = FALSE, col = "black", size = 1.5) +
    xlab("Flipper length (in cm)") +
    ylab("Body mass (in kg)") +
    theme(legend.position = "None") +
    facet_wrap(~ species)

data %>% ggplot(aes(x = flipper_length_mm/10, y = body_mass_g/1000, fill = as.factor(species))) + 
    geom_point() +
    geom_boxplot(aes(alpha = 0.5)) +
    xlab("Flipper length (in cm)") +
    ylab("Body mass (in kg)") +
    theme(legend.position = "None") +
    facet_wrap(~ species)

hotel <- read_csv("D:\\Data Analysis with R Programming\\Week 3\\hotel_bookings.csv", show_col_types = FALSE)
colnames(hotel)

hotel %>% filter(!is.na(children) & !is.na(lead_time)) %>% 
    ggplot(aes(x = as.factor(children), y = lead_time)) +
    geom_boxplot(aes(fill = as.factor(children)), alpha = 0.5) + 
    theme(legend.position = "None")

hotel %>% filter(!is.na(children) & !is.na(stays_in_weekend_nights)) %>% 
    ggplot(aes(x = as.factor(children), y = stays_in_weekend_nights)) +
    geom_col(aes(fill = as.factor(children))) +
    theme(legend.position = "None")

data %>% ggplot(aes(x = flipper_length_mm/10, y = body_mass_g/1000, shape = as.factor(species))) + 
    geom_point(aes(col = as.factor(species), size = 1.5)) +
    xlab("Flipper length (in cm)") +
    ylab("Body mass (in kg)") +
    theme_bw() +
    theme(legend.position = "None")

data %>% ggplot(aes(x = flipper_length_mm/10, y = body_mass_g/1000), col = as.factor(species)) + 
    geom_point(aes(alpha = as.factor(species), size = 1.2)) +
    xlab("Flipper length (in cm)") +
    ylab("Body mass (in kg)") +
    theme_bw() +
    theme(legend.position = "None")

data %>% ggplot(aes(x = flipper_length_mm/10, y = body_mass_g/1000, fill = as.factor(species))) + 
    geom_tile(size = 2) +
    xlab("Flipper length (in cm)") +
    ylab("Body mass (in kg)") +
    theme_bw() +
    theme(legend.position = "None")

data %>% filter(!is.na(flipper_length_mm) & !is.na(body_mass_g)) %>% 
    ggplot(aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(col = "black") +
    geom_smooth(method = stats::lm, formula = y ~ x, col = "red") +
    # linear model smoothing can be misleading if we need an accurate trend in the data
    geom_smooth(method = "loess", formula = y ~ x, col = "blue") +
    geom_smooth(method = "gam", formula = y ~ s(x), col = "violet")

# loess smoothing is helpful only with data less than 100 points
# gam - generalized additive model smoothing, smoothing is best for large datasets

data %>% filter(!is.na(flipper_length_mm) & !is.na(body_mass_g)) %>% 
    ggplot(aes(x = flipper_length_mm, y = body_mass_g, col = species)) +
    geom_point() +
    geom_smooth(method = "loess", formula = y ~ x) 

data %>% filter(!is.na(flipper_length_mm) & !is.na(body_mass_g)) %>% 
    ggplot(aes(col = species)) +
    geom_density2d(aes(x = flipper_length_mm, y = body_mass_g))

data(diamonds)
diamonds %>% 
    ggplot(aes(x = cut, fill = cut)) +
    geom_bar() +
    theme(legend.position = "None")

diamonds %>% 
    ggplot(aes(x = cut, fill = cut)) +
    geom_histogram(stat = "count") +
    theme(legend.position = "None")

diamonds %>% 
    ggplot(aes(x = cut, fill = color)) +
    geom_bar() +
    theme(legend.position = "None")

diamonds %>% 
    ggplot(aes(x = cut, fill = clarity)) +
    geom_bar() +
    theme(legend.position = "None")

diamonds %>% 
    ggplot(aes(x = cut, fill = clarity)) +
    geom_bar() +
    theme(legend.position = "None") +
    facet_wrap(color ~ clarity)

hotel %>% 
    ggplot(aes(x = lead_time, y = stays_in_week_nights)) +
    geom_point() +
    facet_wrap(arrival_date_month ~ assigned_room_type)

hotel %>% ggplot(aes(x = distribution_channel, fill = distribution_channel)) +
    geom_bar()

hotel %>% ggplot(aes(x = distribution_channel, fill = deposit_type)) +
    geom_bar()

hotel %>% ggplot(aes(x = distribution_channel, fill = distribution_channel)) +
    geom_bar() +
    facet_grid(~ deposit_type)
