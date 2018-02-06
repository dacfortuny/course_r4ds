# Solutions of the "R for data science" book.
# CHAPTER 5: DATA TRANSFORMATION

library(nycflights13)
library(tidyverse)


# SECTION 5.2 FILTER ROWS WITH filter() -----------------------------------

# Exercice 1

filter(flights, dep_delay>=120)
filter(flights, dest %in% c('IAH', 'HOU'))
filter(flights, carrier %in% c('UA', 'AA', 'DL'))
filter(flights, month %in% 7:9)
filter(flights, dep_delay>120 & arr_delay <=0)
filter(flights, dep_delay>=60 & arr_delay <30)
filter(flights, hour(time_hour) >= 0 & hour(time_hour) <= 6)


# EXERCISE 2

filter(flights, between(month, 7, 9))
filter(flights, between(hour(time_hour), 0, 6))


# EXERCICE 3

nrow(filter(flights, is.na(dep_time)))
# Variables also missing: dep_delay, arr_time, arr_delay, air_time.
# These rows may correspond to cancelled flights.


# EXERCICE 4

NA^0
NA | TRUE
FALSE & NA
NA * 0
# My guess: If anything that can be assigned to NA gives the same result, the output is not NA.