# Creating dplyr Tables
library("dplyr")

head(iris)
iris_tbl <- as_tibble(iris)
head(iris_tbl)
class(iris_tbl)
colnames(iris_tbl)
View(iris_tbl)

Pinapples <- tibble(
  country = c("Brazil", "Vietnam", "Sri Lanka", "Nepal", "India"),
  production = c(43.2, 24.0, 8.6, 7.6, 6.0),
  precent = c(32.4, 17.9, 6.4, 5.7, 4.5),
  increasing = c(FALSE, TRUE, TRUE, FALSE, TRUE))

head(Pinapples)
str(Pinapples)




# Selecting Subsets
coffee_select <- tibble(
  country = c("Brazil", "Vietnam", "Sri Lanka", "Nepal", "India"),
  production = c(43.2, 24.0, 8.6, 7.6, 6.0),
  precent = c(32.4, 17.9, 6.4, 5.7, 4.5),
  increasing = c(FALSE, TRUE, TRUE, FALSE, TRUE))


select(coffee_select, production, country)
select(coffee_select, starts_with("p"))
select(coffee_select, country:precent)
select(coffee_select, -'increasing', -'precent')


# Filtering Tabular Data
filter(coffee_select, production>20)
filter(coffee_select, increasing==TRUE)

sample_n(coffee_select,3)

slice(coffee_select, 2:3)


# Piping Data
library("tibble")
cars_df <- as_tibble(rownames_to_column(mtcars, var= "car"))
head(cars_df)

cars_df %>%
  top_n(10, mpg) %>%
  arrange(-mpg) %>%
  filter(hp>70)

# Mutating Data

coldst <- tibble(
  place = c("Mahabage", "Ragama", "Colombo", "Ekala", "Ja-ela"),
  temp_c = c(28, 30, 32, 27, 27)
)
coldst

coldst <- coldst %>% mutate(temp_f = (temp_c*1.8)+32)
coldst

coldst <- coldst %>% mutate(temp_ratio = temp_f- temp_c)
coldst


# Summarizing Data

head(cars_df)

cars_df %>% summarise(avg_mpg = mean(mpg))
cars_df %>% summarise(max_mpg = max(mpg))

cars_df %>% top_n(1, mpg)

cars_df %>% count(cyl)



# Combining Data

people <- tibble(
  ID = c(1,3,4,5,6,7),
  name = c("S",  "N", "J", "U", "L", "A")
)

eye_color <- tibble(
  ID = c(1,2,3,4,6,7),
  color = c("R", "B", 'Br', 'Bl', 'BL', "R")
)

left_join(people, eye_color, by= "ID")
right_join(people, eye_color, by="ID")
full_join(people, eye_color, by="ID")
inner_join(people, eye_color, by="ID")
 

# Grouping Data
str(iris)
glimpse(iris)

iris %>% group_by(Species) %>%
  summarise(max_Sepal_lenth = max(Sepal.Length)) %>%
  arrange(-max_Sepal_lenth)
)
