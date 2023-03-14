# Read CSV

cashews <- read.csv("C:/Users/sanjulam/Brandix Lanka Pvt Ltd/Data Science Project - 1/Data Analyst/R/cashew.csv")
str(cashews)
cashews$Rank
cashews$Country
cashews$Cashew.Production.2016..metric.tonnes.
cashews$X..of.World.Total

# No headers
cashews <- read.csv("C:/Users/sanjulam/Brandix Lanka Pvt Ltd/Data Science Project - 1/Data Analyst/R/cashew.csv",
                    header = FALSE)
cashews

# read semi-colon delimited with decimals as commas CSV
cashews <- read.csv2("C:/Users/sanjulam/Brandix Lanka Pvt Ltd/Data Science Project - 1/Data Analyst/R/cashew.csv")
cashews

#read tab separated
cashews <- read.delim("C:/Users/sanjulam/Brandix Lanka Pvt Ltd/Data Science Project - 1/Data Analyst/R/cashew.csv")
cashews



# Read Excel
library('readxl')
eg <- read_excel("C:/Users/sanjulam/Brandix Lanka Pvt Ltd/Data Science Project - 1/Data Analyst/R/APL-Material Receiving Warehouse Forecast (Expected Delivery) - BIA_76 (1).xlsx")
str(eg)

edr_df <- as.data.frame(eg)
str(eg)




# Read HTML
library(rvest)
html_data <- read_html("https://en.wikipedia.org/wiki/Iris_flower_data_set")
extract_table <- html_table(html_data)
length(extract_table)

iris_table <- extract_table[1]
str(iris_table)




# Export to CSV
write.csv(iris_table, file = "iris data.csv")


# Export to excel
library(writexl)
write_xlsx(iris_table, "iris data.xlsx")

# Exporting to HTML
library(xtable)
mtcars

print(xtable(mtcars), type = "html")
sink("mtcars.html")
print(xtable(mtcars), type = "html")
sink()
