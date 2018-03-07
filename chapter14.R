# Solutions of the "R for data science" book.
# CHAPTER 11: STRINGS

library(tidyverse)
library(stringr)

x <- c("apple",	"banana",	"pear")
str_view(x,	"an")

str_view(fruit,	"(..)\\1", match = TRUE)
str_view(fruit,	"(.)\1\1", match = TRUE)
str_view(fruit,	"(.)(.)\2\1", match = TRUE)
str_view(fruit,	"(..)\1", match = TRUE)
str_view(fruit,	"(.).\\1.\\1", match = TRUE)
str_view(fruit,	"(.)(.)(.).*\\3\\2\\1" , match = TRUE)

fruit[str_detect(fruit, "^b")]
fruit[str_detect(fruit, "^[aeiou]![aeiou$]")]

str_subset(fruit, "^b")

colors <- c("red", "orange", "yellow", "green", "blue", "purple" )
color_match <- str_c(colors, collapse = "|")

more <- sentences[str_count(sentences, color_match) > 1]
str_view_all(more,	color_match)
has_color <- str_subset(sentences, color_match)
matches <- str_extract(has_color, color_match)
head(matches)