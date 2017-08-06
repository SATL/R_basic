

v<- c("Hello", "world")
cnt <- 2
repeat{
  print(v)
  cnt<-cnt+1
  
  if(cnt>5)
    break
}

cnt<-0

while(cnt<5){
  print(v)
  cnt=cnt+1
}

v<- LETTERS[1:10]
for(i in v)
  print(i)