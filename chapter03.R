# Solutions of the "R for data science" book.
# CHAPTER 3: DATA VISUALISATION

library(tidyverse)

# SECTION 3.2 FIRST STEPS -------------------------------------------------

# Exercise 1

ggplot(data=mpg)
print("Nothing is plotted, no aesthetics indicated.")


# Exercise 2

print(paste0("There are ", nrow(mpg), " rows."))
print(paste0("There are ", ncol(mpg), " columns."))


# Exercise 3

?mpg
print("drv: f = front-wheel drive, r = rear wheel drive, 4 = 4wd")


# Exercise 4

ggplot(mpg) +
    geom_point(mapping = aes(x = hwy, y = cyl))


# Exercise 5

ggplot(mpg) +
    geom_point(mapping = aes(x = class, y = drv))
print(paste0("The plot is not useful beacuse all points are together and we cannot see ",
             "how many of them are in each grid point."))
