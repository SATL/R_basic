

print(seq(32, 44))

print(mean(25:82))

print(sum(41:68))

print(sum(c(1,2,3,4,5)))


new.function <- function(a){
  for(i in 1:a){
    b<- i^2
    print(b)
  }
}


new.function(12)


new.function2 <- function(a=5, b){
  result<- a*b
  return(result);
}

new.function3 <- function(a, b=10){
  return(a*b)
}

print(new.function2(b=2))

print(new.function3(3))
