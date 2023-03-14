# Creating Vectors

v <- 1:10
v

10:1
-10:10

# Using c function
c(5,7,99,v)

# Using Seq
seq(from = 1.5, to= 22.5, by = 0.5)
seq(1.5, 22.5, 0.5)

seq(from= 25, to= 103, length.out = 7)


#Access elements
v[1]
v[0]
typeof(v)
length(v)

v[-2]
v[v>5]

x <- c("URL"="WWW.Study.com", "Pages"= "index.html")
x["URL"]
unname(x["URL"])
names(x)


# Manipulating Vectors
w <- 10:1
w[w<5] <- 1
w

#deleting vectors
u <- 1:5
u
u <- NULL
u

# Vector arithmetic 

# operating element-wise
v+w
v-w
v*w
v/w

#operating scalars
v+10
w+20

#combine vectors
u <- c(v,w)
u

#vector function
sum(v)
prod(w)
min(w)
max(v)

# Sorting Vectors
v <- c(10,2,4,3,5,8,6,9,1)

sort(v)
sort(v, decreasing=TRUE)

w <- c("Steve", "Bob", "Jane", "Sally", "Alice")
sort((w))

u <- c(5, NA, 1, 3, NA, 4, 2)
sort(u)
sort(u, na.last = TRUE)

# Using list

a <- list(2, "Steve", TRUE, FALSE, NA, 5.5, c(1,2))
a[1]
a[1:2]
a[[7]]
a[7]
a[[7]][1]

typeof(a[1])
typeof(a[[1]])

b <- list(a=c(1,2,3), b=c(4,5,6), c=c(7,8,9))
b

b$a
b$b

b$a <- c(3,2,1)
str(b)

length(b)

lapply(b, mean)

sapply(b, mean)

# Creating Matrix

M <- matrix(c(1,3,4,64,11,34), nrow = 3, ncol = 2, byrow = FALSE)
M

M[1,2]
M[1,]
M[,2]


N <- matrix(c(10,10,10), nrow = 3, ncol = 1)
N
cbind(M,N)


a <- c(M)
a

diag(c(1,2,3))
diag(3)

# Matrix Operation
M <- matrix(c(1,3,4,4,11,34,-1,0,5), nrow = 3, ncol = 3, byrow = FALSE)
M

det(M)
qr(M)
svd(M)
eigen(M)
solve(M)

N <- diag(c(2,2,2))
N

M*N
M %*% N

# Creating Factors
fuel <- c('petrol', 'diesel', 'electric', 'electric', 'diesel',
          'electric','petrol', 'petrol', 'diesel', 'electric',
          'electric', 'electric', 'diesel', 'diesel', 'petrol')

fuel
ff <- factor(fuel)
ff

levels(ff)
levels(ff)[1]
nlevels(ff)

str(ff)
table(ff)

as.character(ff)
as.numeric(ff)

# Creating Data Frame

coffee <- data.frame(
  country = c("Brazil", "Vietnam", "Sri Lanka", "Nepal", "India"),
  production = c(43.2, 24.0, 8.6, 7.6, 6.0),
  precent = c(32.4, 17.9, 6.4, 5.7, 4.5),
  increasing = c(FALSE, TRUE, TRUE, FALSE, TRUE)
)
coffee

coffee[2]
coffee['production']

coffee[1,]

coffee[1,2]
coffee[1:2, 1:2]

str(coffee)
names(coffee)


# Data Frame Operations
data("mtcars")
head(mtcars)
tail(mtcars)


dim(mtcars)
nrow(mtcars)
ncol(mtcars)

summary(mtcars)

coffee_simple <- coffee[,1:2]
coffee_simple

coffee_simple$production <- c(41.5, 25.0, 9.1, 8.2, 5.0)
coffee_simple

coffee_simple[1,2] <- 42

coffee_simple["new_column"] <- c(1,2,3,4,5)
coffee_simple
