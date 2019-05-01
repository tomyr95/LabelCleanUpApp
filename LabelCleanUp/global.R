library(shiny) 
library(DT)
library(dplyr) 
library(stringr)


#Specify FileName/Feature
      FileName <- "StormDataSubset.csv"
      Feature  <- "EVTYPE" 

#Load CSV File/Feature Only
      data <- read.csv(FileName, stringsAsFactors=FALSE)
      data <- data %>% select(Feature)
      colnames(data) <- "feature"

#Setup Other Global Vars
      lab     <- NULL
      rep     <- NULL
      CHOICES <- NULL