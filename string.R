a <- "Hello"
b <- "World"

print(paste(a, b))

print(paste(a, b, sep="...", collapse = "_"))

print(format(pi, digits = 4))

print(format(pi, scientific = TRUE))

print(format(pi, nsmall=15))

strNum <- format(15)

cat(strNum, typeof(strNum))


print(format(13.7, width = 5))

print(format("Hello",  width = 8, justify='c'))

print( nchar("Lorem ipsum"))

print(toupper("Hello World"))


print(substr("_Hello World", 2, 6))
