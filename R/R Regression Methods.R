# Linear Data Preparation
library('dplyr')

glimpse(airquality)
help("airquality")

anyNA(airquality)
anyNA(airquality$Ozone)
anyNA(airquality$Temp)

air <- airquality %>%
  filter(is.na(Ozone)== FALSE)

anyNA(air)

summary(air$Ozone)
summary(air$Temp)



# Creating Linear Model
cor(air$Ozone , air$Temp)

plot(Ozone~Temp, air)
avg_ozn <- mean(air$Ozone)
abline(h=avg_ozn)


ozone_Temp <- lm(Ozone~Temp, air)
abline(ozone_Temp)

ozone_Temp

summary(ozone_Temp)

vcov(ozone_Temp)
confint(ozone_Temp)


# Using Linear Prediction
temp_data <- data.frame(Temp = c(7,3,10))

temp_data["ozone prediction"] <- predict(ozone_Temp, temp_data)
temp_data


# Logistic Data preparation 
library("tibble")
glimpse(mtcars)

help("mtcars")

anyNA(mtcars)

pcars<- rownames_to_column(mtcars, var = "car") %>%
  select(car, vs, hp, disp, wt)

pcars

set.seed(111)

pcars_train <- pcars %>% sample_n(25)
pcars_test <- pcars %>% setdiff(pcars_train)


pcars_model <- glm(vs~ wt + hp + disp,
                   data = pcars_train,
                   family = binomial)

pcars_test["predicted"] <- 
  ifelse(predict(pcars_model, pcars_test)> 0,1,0)

pcars_test













