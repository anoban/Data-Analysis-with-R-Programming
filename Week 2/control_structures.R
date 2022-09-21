rep(c(TRUE,FALSE), each=4)
rep(c(TRUE,FALSE),3)
rep(c("Hey","You!"), c(3,2))
rep(c("Hey","You!"), c(3,8))

data <- read.csv("D:\\Covid\\covid-data.csv")
data |> head()

colnames(data)

data$new_cases |> is.na() |> sum()
data$new_cases |> is.na() |> mean()

data[is.na(data$new_cases) == FALSE,]
data |> subset(new_cases > 100) |> dim()
data |> subset(new_cases > 150 & continent == "Asia") |> dim()
data |> subset(new_cases > 1000 & continent == "Asia") |> dim()

data$location |> unique()

data |> subset(new_cases > 1000 & location == "China") |> dim()
subset(data, new_cases > 1000 & location == "China")$new_cases

data$continent |> unique()
data |> subset(continent != c("Asia","Europe","Africa","North America"))

data.frame(installed.packages())[c("Package","Priority")]

myseq <- seq(0,10000)
ntypes <- c()

# for loop in R
for (i in myseq){
    if(i %% 2 == 1){
        ntypes <- c(ntypes,i^2)
    }else if(i %% 2 == 0){
        ntypes <- c(ntypes,i^3)
    }
}
ntypes

# while loop in R
x <- 0
dummyvec <- c()
while(x < 300){
    dummyvec <- c(dummyvec, x^2)
    x <- x+1
}
dummyvec

# Repeat loop in R
repeat_list <- list()
y <- 0
repeat {
    repeat_list <- append(repeat_list, y^2)
    y <- y+1
    if(y >= 100){
        break # exits the loop once the condition is satisfied!
    }
}
repeat_list

next_seq <- seq(0,100,5)
break_vec <- c()
for (i in next_seq){
    if(i < 79){
        break_vec <- c(break_vec, as.character(i))
    }else if(i == 80){
        next # skip this iteration!
    }else if(i > 80){
        break_vec <- c(break_vec, as.character(i+1))
    }
}
break_vec
