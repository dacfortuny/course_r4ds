# Solutions of the "R for data science" book.
# CHAPTER 10: TIBBLES

library(tidyverse)


# Exercice 1

mtcars


# Exercice 2

df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]

df <- tibble(abc = 1, xyz = "a")


# Exercice 3

var <- "mpg"
#????


# Exercice 4

annoying <- tibble(
    `1` = 1:10,
    `2` = `1` * 2 + rnorm(length(`1`))
)

annoying$`1`

ggplot(annoying, aes(x = `1`, y = `2`)) +
    geom_point()

annoying <- annoying %>% mutate(`3` = `2`/`1`) 

annoying %>% select(one = `1`, two = `2`, three = `3`) 


# Exercice 5

tibble::enframe(1:8)


# Exercice 6

nycflights13::flights %>% 
    print(n = 10, width = 3)


nycflights13::flights
