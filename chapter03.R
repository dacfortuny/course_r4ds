# Solutions of the "R for data science" book.
# CHAPTER 3: DATA VISUALISATION

library(tidyverse)
library(maps)

# SECTION 3.2 FIRST STEPS -------------------------------------------------

# Exercise 1

ggplot(data=mpg)
print("Nothing is plotted, no mapping indicated.")


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


# SECTION 3.3 AESTHETIC MAPPINGS ------------------------------------------


# Exercise 1

print("If we want to select the color manually, we have to indicate if outside aes")


# Exercise 2

str(mpg)
print("The categorical variables are : 'manufacturer', 'model', 'trans', 'drv', 'fl' and 'class'.")
print("The continuous variables are : 'displ', 'year', 'cyl', 'cty',and 'hwy'.")
mpg
print(paste0("Categorical variavles have a class 'chr' and continuous variables hava a class ",
             "'dbl' or 'int'."))

# Exercise 3

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, size = class))
ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, shape = class))


# Exercice 4

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, shape = class, color = class))


# Exercice 5

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, color=year), size=15)


# Exercice 6

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))


# SECTION 3.5 FACETS ------------------------------------------------------

# Exercice 1

ggplot(mpg) +
    geom_point(mapping = aes(x=drv, y=cyl)) +
    facet_wrap(~displ)


# Exercice 2

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = drv, y = cyl))


# Exercice 3

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(drv ~ .)

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(. ~ cyl)


# Exercice 4

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_wrap(~ class, nrow = 2)


# Exercice 5

?facet_wrap


# SECTION 3.6 GEOMETRIC OBJECTS -------------------------------------------

# Exercice 2

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
    geom_point() + 
    geom_smooth(se = FALSE)


# Exercice 3

ggplot(data = mpg) +
    geom_smooth(
        mapping = aes(x = displ, y = hwy, color = drv)
    )


# Exercice 4

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
    geom_point() + 
    geom_smooth(se = FALSE)


# Exercice 5

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth()

ggplot() + 
    geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))


# Exercice 6

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth(se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point() +
    geom_smooth(mapping=aes(group=drv), se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) +
    geom_point() +
    geom_smooth(se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping=aes(color=drv)) +
    geom_smooth(se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping=aes(color=drv)) +
    geom_smooth(mapping=aes(linetype=drv), se=FALSE)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping=aes(fill=drv), colour="white", shape=21, stroke = 2)


# SECTION 3.7 STATISTICAL TRANSFORMATIONS ---------------------------------

# Exercice 1

ggplot(data = diamonds) + 
    stat_summary(
        mapping = aes(x = cut, y = depth),
        fun.ymin = min,
        fun.ymax = max,
        fun.y = median
    )

# ggplot(data = diamonds) +
#     geom_pointrange(aes(x=cut, y=depth, stat='identity'))
# ???

# Exercice 2

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
    geom_col()


# Exercice 3

# Exercice 4

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
    stat_smooth(method = "auto", formula = y ~ x, se = TRUE, n = 80,
                fullrange = FALSE, level = 0.95)


# Exercice 5

ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = ..prop..))
ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))


# SECTION 3.8 POSITION ADJUSTMENTS ----------------------------------------

# Exercice 1

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter()


# Exercice 2

ggplot(mpg, aes(cty, hwy)) +
    geom_jitter(width = 0.5, height = 0.5)


# Exercice 3

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_jitter()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_count()


# Exercice 4

ggplot(data = mpg, mapping = aes(x = year, y = hwy, group=year)) + 
    geom_boxplot()


# SECTION 3.9 COORDINATE SYSTEMS ------------------------------------------

# Exercice 1

ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group=1)) +
    coord_polar()


# Exercice 2

ggplot(data = mpg, mapping = aes(x = year, y = hwy, group=year)) + 
    geom_boxplot() +
    labs(x='Year!', y='HWY!')


# Exercice 3

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
    geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
    geom_polygon(fill = "white", colour = "black") +
    coord_quickmap()


# Exercice 4

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
    geom_point() + 
    geom_abline() +
    coord_fixed()
