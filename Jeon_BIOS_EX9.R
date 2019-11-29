#. Find some data on two variables that you would expect to be related to each other. 
#These data can come from your own research, your daily life, or the internet. 
#Enter those data into a text file or Excel and then save a text file, and write a script that loads
#this text file and produces a scatter plot of those two variables that includes a trend line.
library(ggplot2)
draft <- read.csv("2012draft.csv")
ggplot(data=draft,aes(x=Height..No.Shoes.,y=Wingspan))+geom_point()+geom_smooth(method = "lm")+theme_classic() 

#2. Given the data in “data.txt”. Write a script that generates two figures that sumamrize the data. 
#First, show a barplot of the means of the four populations. Second, show a scatter plot of all of the observations. 
#You may want to “jitter” the points (geom_jitter()) to make it easier to see all of the observations within 
#a population in your scatter plot. Alternatively, you could also try setting the alpha argument in 
#geom_scatterplot() to 0.1. Do the bar and scatter plots tell you different stories? Why?

data <- read.csv("data.txt", header = T)

#boxplot
n.mean <- mean(data[data$region=="north",]$observations)
w.mean <- mean(data[data$region=="west",]$observations)
e.mean <- mean(data[data$region=="east",]$observations)
s.mean <- mean(data[data$region=="south",]$observations)
df <- data.frame(region=c("north", "west", "east", "south"),mean=c(n.mean, w.mean, e.mean, s.mean))
ggplot(data=df, aes(x=region, y=mean)) +geom_bar(stat="identity", width=0.5)

#scatterplot
ggplot(data=data, aes(x=region, y=observations))+geom_jitter(alpha=0.1) 

# Answer : bar plot only shows the exact mean value of the data, but the scatterplot also shows 
# how the data points are distributed. the bar plot suggests that the mean values are very close to each other, 
# but the scatter plot suggests that the observations from north are close together, 
# and observations in south are clustered around two different points. 
# it is because the bar plot only returns one value, while the scatterplot shows the overall trend.
       