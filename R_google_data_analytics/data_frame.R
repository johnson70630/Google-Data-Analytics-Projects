install.packages("tidyverse")
library(tidyverse)

names <- c("Jack", "Jenny", "Jason", "John")
age <- c(13, 25, 67, 34)
people <- data.frame(names, age)

head(people)
str(people)
glimpse(people)
colnames(people)

mutate(people, age_in_20 = age + 20)

fruit <- c("banana", "apple", "grape", "watermelon", "lemon")
rank <- c(1, 3, 2, 5, 4)
fruit_ranks <- data.frame(fruit, rank)