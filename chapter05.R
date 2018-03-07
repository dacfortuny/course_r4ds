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



# SECTION 5.3 ARRANGE ROWS WITH arrange() ---------------------------------

# Exercice 1

arrange(flights, !is.na(arr_delay), desc(arr_delay))


# Exercice 2

arrange(flights, desc(dep_delay)) 
arrange(flights, dep_time) 


# Exercice 3

arrange(flights, distance/air_time)


# Exercice 4

arrange(flights, desc(distance))
arrange(flights, distance)



# SECTION 5.4 SELECT COLUMNS WITH select() --------------------------------

# Exercice 1

select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, starts_with("dep"), starts_with("arr"))


# Exercice 2

select(flights, dep_time, dep_time)


# Exercice 3

vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))


# Exercice 4

select(flights,	contains("TIME"))



# SECTION 5.5 ADD NEW VARIABLES WITH mutate() -----------------------------

# Exercice 1

flights_ddc <- mutate(flights, dep_time_minutes = (dep_time %/% 100) * 60 + (dep_time %% 100),
                               sched_dep_time_minutes = (dep_time %/% 100) * 60 + (dep_time %% 100))


# Exercice 4

flights_ddc <- mutate(flights, more_delayed = min_rank(dep_delay))


# Exercice 5

1:3 + 1:10



# SECTION 5.6 GROUPED SUMMARIES WITH summarise() --------------------------

# Exercice 1
