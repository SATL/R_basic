c.1 <- 1:10
print(c.1)

c.2 <- 3.2:7.3
print(c.2)

print(seq(5,9, by=0.2))

print(c("Nain", "Foo", 4, FALSE))

print(c.1[3])


t <- c("Sun","Mon","Tue","Wed","Thurs","Fri","Sat")
u <- t[c(2, 3, 6)]
print(u)

v<- t[c(TRUE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE)]
print(v)

x<- t[c(-1, -5)]
print(x)

y <- t[c(0,0,0,0,0,0,1)]
print(y)

# Create two vectors.
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11,0,8,1,2)

# Vector addition.
add.result <- v1+v2
print(add.result)

# Vector substraction.
sub.result <- v1-v2
print(sub.result)

# Vector multiplication.
multi.result <- v1*v2
print(multi.result)

# Vector division.
divi.result <- v1/v2
print(divi.result)


v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)
# V2 becomes c(4,11,4,11,4,11)

add.result <- v1+v2
print(add.result)

sub.result <- v1-v2
print(sub.result)



v.sorted <- c(4,234,-12, -1, 3,45,7,8,4)

print(sort(v.sorted))
print(sort(v.sorted, decreasing = TRUE))
