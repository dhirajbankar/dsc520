# Assignment: ASSIGNMENT 3
# Name: Bankar, Dhiraj
# Date: 2020-09-15

## Check your current working directory using `getwd()`
getwd()

## List the contents of the working directory with the `dir()` function
dir()

## Load the `readxl` library
library(ggplot2)

## If the current directory does not contain the `data` directory, set the
## working directory to project root folder (the folder should contain the `data` directory
## Use `setwd()` if needed
setwd("//Users/dhirajbankar/R_Laguage/dsc520")

## Read the file `data/acs-14-1yr-s0201.csv` to `american_survay_df`
## Display summary statistics using the `summary()` function
american_survay_df <- read.csv("data/acs-14-1yr-s0201.csv" , stringsAsFactors = TRUE)
summary(american_survay_df)
str(american_survay_df)
nrow(american_survay_df)
ncol(american_survay_df)

nOfBins=30

ggplot(american_survay_df, aes(HSDegree)) + geom_histogram(bins = nOfBins) + 
  xlab("HSDegree") + ylab("Frequency") + ggtitle("Histogram of the HSDegree")

ggplot(american_survay_df, aes(HSDegree)) + geom_histogram(bins = nOfBins)  + 
  xlab("HSDegree") + ylab("Frequency") + ggtitle("Histogram of the HSDegree") + 
  stat_function(fun = dnorm, args = list(0.2, 0.1)) +
  stat_function(fun = dnorm, args = list(0.7, 0.05))

## Histogram with Normal Curve
n_obs = sum(!is.na(american_survay_df$HSDegree))
ggplot(american_survay_df, aes(HSDegree)) + 
  xlim(c(60,100)) + geom_histogram(bins = nOfBins)+ 
  ggtitle('County with HSDegree') + 
  xlab('% Age of Population with HSDegree') + 
  ylab('Number of Counties') + 
  stat_function(fun = function(x) 
    dnorm(x, mean = mean(american_survay_df$HSDegree), 
                                        sd = sd(american_survay_df$HSDegree)) * (40/nOfBins) * n_obs)

## Density Plot
ggplot(american_survay_df, aes(HSDegree)) + geom_density(aes(HSDegree), colour="green") + xlim(c(60,100)) + ggtitle('County with HSDegree') + xlab('% Age of Population with HSDegree') + ylab('Density of Counties')


## Probability Plot / QQ Plot & qqplot line
ggplot(american_survay_df, aes(sample = HSDegree)) + geom_qq(col='blue') + geom_qq_line(col='red') + ggtitle("Probability - QQ Plot for HSDegree")


## stat.desc() Function
library(pastecs)
stat.desc(cbind(american_survay_df$HSDegree), basic = FALSE, norm = TRUE)





