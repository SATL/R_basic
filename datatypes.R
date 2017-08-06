print("Hello World")
print (23.4 + 32)

if(!require("plotrix"))install.packages("plotrix")

#define
"Another 'comment'"

myStr <- "Hello world"
print(myStr)

bool <-TRUE
print(class(bool))

number<- 23.5
integer <-2L
complex <-3+2i
character <- "Nain"
raw <- charToRaw("Raw")

vector <- c("nain", "ain", "in", "n")

lista<- list(number, integer, complex, character, raw)

print(vector)
print(lista)

matr <- matrix(c('a','b', 'c','A','B','C'), nrow=2, ncol = 3, byrow = TRUE)
print(matr)

a = array(c('green', 'yellow'), dim = c(3,3,2))
print(a)

apple_colors <- c("green", "green", "yellow", "yellow", "red", "green")
factore_apple = factor(apple_colors)

print(apple_colors)
print(factore_apple)

data_frame <- data.frame(
  gender = c("Male", "Male", "Female"),
  height = c(152, 171.5, 165),
  weight = c(81, 93, 78),
  Age = c(42, 38, 26)
)

print(data_frame)
