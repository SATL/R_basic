var_name. <- "nain"

var.1 = c(0,1,2,3)
var.2 <- c("learn", "R")

var.3
c(TRUE, 1) -> var.3


print(var.1)
cat("var.1 is", var.1, "\n")
cat("var.2 is", var.2, "\n")
cat("var.3 is", var.3, "\n")
var.4 = "Nain"
cat("var.4 is", var.4, "\n")

print(ls())

print(ls(pattern = "var", sorted=FALSE))


rm(var.4)
print(ls(pattern = "var.4"))


rm(list = ls())
print(ls())