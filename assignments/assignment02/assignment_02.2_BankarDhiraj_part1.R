# Assignment: ASSIGNMENT 2
# Name: Lastname, Firstname
# Date: 2010-02-14

## Check your current working directory using `getwd()`
getwd()

## List the contents of the working directory with the `dir()` function
dir()

## If the current directory does not contain the `data` directory, set the
## working directory to project root folder (the folder should contain the `data` directory
## Use `setwd()` if needed
setwd("//Users/dhirajbankar/R_Laguage/dsc520")

## Read the file `data/scores.csv` to `scores_df`
## Display summary statistics using the `summary()` function
scores_df <- read.csv("data/scores.csv")
#summary(scores_df)
scores_df$Section
class(scores_df)
regulardata <- subset(scores_df, Section == "Regular",
                  select=c(Count,Score, Section) )

sportsdata <- subset(scores_df, Section == "Sports",
                  select=c(Count,Score, Section))

regulardata

## Load the `readxl` library
library(ggplot2)
library(pastecs)
library(psych)
timeLine <- c(0 , 30)
sportLine <- c(0 , 400 )
plot(x = sum(regulardata$Count) , y = sum(regulardata$Score)/sum(regulardata$Count) ,
     xlab="Student count" , ylab = "Average score" ,type="p",
     xlim=sportLine , ylim=timeLine , lty = 1, lwd = 1, col = "blue" )

lines(x = sum(sportsdata$Count) , y = sum(sportsdata$Score)/sum(sportsdata$Count) , pch = 18, col = "red", type = "p", 
      lty = 2, lwd = 1)


