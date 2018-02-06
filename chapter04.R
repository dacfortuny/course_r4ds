# Solutions of the "R for data science" book.
# CHAPTER 4: WORKFLOW: BASICS

library(tidyverse)


# SECTION 4.4 PRACTICE ----------------------------------------------------

# Exercise 1

my_variable <- 10
my_varıable

# The code actually works, even though the in the second command is weird.


# Exercise 2

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)


# Exercice 3

# With Alt + Shift + K the keyboard shortcut quick reference appears.