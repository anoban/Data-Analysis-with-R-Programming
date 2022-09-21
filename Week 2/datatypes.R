# vectors in R are arrays that can hold elements of a singular data type
# vectors are declared in R using the combine function c()

mynumbers <- c(seq(1,100,2))
mynumbers # all numeric values

# try adding a float
mynumbers <- c(mynumbers, 67.6756)
mynumbers
# all the elements are typecasted to doubles!!!
# because all elements in a vector must be of identical data type!
# since typecasting doubles to integers will result in precision loss, all integers are
# typecasted to doubles w/o any loss in precision anywhere!

# watch this
mixedvector <- c(1,3,4.567, 'H', "String")
mixedvector # "1"      "3"      "4.567"  "H"      "String"
# all elements are type casted to strings!!

mynumbers + 4.789
# adds 4.789 to all elements of the vector!!
mynumbers / 4
mynumbers - 10
mynumbers^2.1

# every element in a vector has a label!
# by default it is a string format of the index
labels(mynumbers)

names(mynumbers) <- c("A","B","C","D","E","F")
labels(mynumbers) # NAMED THE FIRST 6 ELEMENTS

# index based naming does not work!
names(mynumbers[10:22]) <- c("A","B","C","D","E","F","H","I","J","K","L","M")
labels(mynumbers)
# elements can be named upon creation as well!
labeledvec <- c("Me"="MyName","He"="HisName","She"="HerName")
labeledvec
labels(labeledvec)


mynumbers[9] <- 100
mynumbers
# vectors are mutable

# R lists are dynamic data containers
# can contain data of different types
mylist <- list("Jimmy","Jhonny","Janice")
mylist
str(mylist)

# like vector elements, list elements can also be labeled
names(mylist) <- c("Manager","Attendent","HR")
mylist
labels(mylist)
str(mylist)
# there we go
# alternatively

ages <- list("Jessica"=40, "Janice"=33, "Jennifer"=30)
str(ages)
labels(ages)

# nested lists
nestedlist <- list("This","MyLabel"="is","haha kidding! but yeah..","a"=list(seq(0,20,2)),
                   "nested"=list("L","I","S","T"))
nestedlist
str(nestedlist)

# dates
Sys.time()
Sys.timezone()
Sys.Date()

as.Date(Sys.time())
as.Date(Sys.time())

strptime("12-02-2020 03:22:34", format = "%d-%m-%Y %H:%M:%S")
strptime("20/2/16 11:16:16.63", "%d/%m/%y %H:%M:%S")
strptime("20-2-2016 11:16:16.63", "%d-%m-%y %H:%M:%S")

# creating files in R
dir.create("myfile.txt")
dir()
file.exists("myfile.txt")
# :)

file.create("myfile.csv")
dir()
dir.create("/dummydir")
dir()
file.copy("myfile.csv", "myfilecopy.csv")

strptime("12-12-2022", format = "%d-%m-%Y")
strptime("12-01-10", format = "%d-%M-%y")
strptime("5:22:45", format = "%H:%M:%S")
strptime("5:22:45 AM", format = "%H:%M:%S")

