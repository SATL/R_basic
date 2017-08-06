rm(list = ls())

data("mtcars")
library(ggplot2)

theme <- theme_set(theme_minimal())

ggplot(
  mtcars,
  mapping = aes_string( y ="mpg", x="cyl"))+
  
  xlab("Number of Cylinders")+
  ylab("Miler per Gallon")+
  ggtitle("Distr mpg per gallon / cylinders")+
  
  geom_boxplot(outlier.colour = NULL,
              aes_string(colour="cyl", fill = "cyl"), alpha = 0.8)+
  
  stat_summary(geom = "crossbar", 
               width = 0.7, 
               fatten = 0.5, 
               color="white",
               fun.data = function(x){
                 return(c( y = median(x),
                           ymin=median(x),
                           ymax=median(x)))
               })+
  stat_summary(fun.data = function(x){
    return(c(y = median(x)*1.03, 
             label = round(median(x), 2)))
  },
  geom = "text",
  fun.y = mean,
  colour="white")



aggregate(list(mpg = mtcars$mpg),
          list(cyliders = mtcars$cyl),
          FUN = function(mpg){
            c(avg = mean(mpg),
              median = median(mpg))
          })

ggplot(mtcars,
       mapping = aes(y = "mpg", x = "am"))+
  xlab("Transmission")+
  ylab("Mpg")+
  ggtitle("Distribution mpg / transmision")+
  
  geom_boxplot(outlier.colour = NULL,
               aes_string(colour="am",
                          fill="am" ), alpha = 0.8)+
  stat_summary(geom = "crossbar", 
               width = 0.7,
               fatten = 0.5,
               color="white",
               fun.data = function(x){
                 return(c(y=median(x), ymin=median(x), ymax=median(x)))
               }
               )+
  stat_summary(fun.data = function(x){
    return(c(y=median(x)*1.03, label = round(median(x), 2)))
  },
  geom="text",
  fun.y=mean,
  colour="white")

to.factors <- function(df, variables){
  for(variable in variables){
    df[[variable]] <- as.factor(df[[variable]])
  }
  return(df)
}

categorical.vars <- c("cyl", "vs",  "am", "gear", "carb")
mtcars<- to.factors(mtcars, categorical.vars)
mtcars$am <- factor(mtcars$am, labels=c("Automatic", "Manual"))

ggplot(mtcars, aes(x=mpg))+
  geom_density(colour="steelblue",
               fill="lightblue", alpha=0.8)+
  expand_limits(x=0, y =0)


t.test(mpg ~am, data=mtcars)

aggr <- aggregate(list(mpg=mtcars$mpg),
                  list(transmission=mtcars$am),
                  FUN = function(mpg){
                    c(avg = mean(mpg))
                  })

print(aggr)


ggplot(mtcars, aes(x=mpg))+
  geom_density(aes(group=am, colour=am, fill=am), alpha=0.6)+
  geom_vline(data = aggr, aes(xintercept = mpg, color=transmission), linetype="dashed", size = 1)
  
