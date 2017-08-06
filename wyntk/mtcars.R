data("mtcars")

str(mtcars)

head(mtcars, 5)

to.factors <- function(df, variables){
  for(variable in variables){
    df[[variable]] <- as.factor(df[[variable]])
  }
  return(df)
}

head(mtcars, 5 )

categorical.vars <- c("cyl", "vs",  "am", "gear", "carb")
mtcars<- to.factors(mtcars, categorical.vars)
str(mtcars)

pairs(mtcars, panel = panel.smooth)
main = "Pair plot  form mtcars set"

dotchart(mtcars$mpg, labels = row.names(mtcars), cex = 0.7, pch = 16,
         main="Milles per galon of cargs", xlab = "mpg")

dotchart(mtcars$wt, labels = row.names(mtcars), cex = 0.7, pch = 16)

head(mtcars[order(mtcars$mpg, decreasing = TRUE),], 5)

## Plots
barplot(table(mtcars$cyl),
        col="lightblue", main ="Cyl count distribution",
        xlab = "Number of cylinders", ylab ="Total cars")


counts.vs = table(mtcars$vs);
bb <- barplot(counts.vs,
        col="blue", main ="vs count",
        xlab = "Number of vs", ylab ="Total cars")

text(x = bb , y =counts.vs+1, labels = as.character(counts.vs), xpd = TRUE)

print(table(mtcars$vs))



mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
barplot(table(mtcars$am), col ="lightblue", main="Car Transmission Type", xlab="Number of Gears", ylab = "Total Cars")

counts.am_cyl = table(mtcars$am, mtcars$cyl)
print(counts.am_cyl)

barplot( counts.am_cyl, 
          main = "Car Distribution by Cylinder and Transmission", xlab ="Nº Cylindes", ylab ="Total Cars",
          col = c("steelblue", "lightblue"),
          legend = rownames(counts.am_cyl),
         args.legend = list (x="top", title="Transmission"))


counts.gear_cyl = table(mtcars$gear, mtcars$cyl)
barplot( counts.gear_cyl, 
         main = "Car Distribution by Cylinder and Gears", xlab ="Nº Cylindes", ylab ="Total Cars",
         col = c("darkblue", "steelblue", "lightblue"),
         legend = rownames(counts.gear_cyl), beside = TRUE, horiz= TRUE,
         args.legend = list (x="bottom", y ="right", title="Gears"))


mtcars <- within(mtcars, {
  color <- ifelse( cyl == 4, "coral", ifelse(cyl==6, "cadetblue", "darkolivegreen"))
})

dotchart(mtcars$mpg, labels = row.names(mtcars),
         groups = mtcars$cyl, color = mtcars$color,
         cex = 0.7, pch = 16,
         main = "Miles per galon of Cars /by Cylinders",
         xlab = "Mpg")


dotchart(mtcars$mpg, labels = row.names(mtcars),
         groups = mtcars$am, color = mtcars$color,
         cex = 0.7, pch = 16,
         main = "Miles per galon of Cars /by AM",
         xlab = "Mpg")

mtcars <- within(mtcars, rm("color"))


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

