# This code is from the UVic BUGS Introduction to R Workshop 
# Workshop led by Dominique Maucieri (dominiquemaucieri@gmail.com)
# 28-10-2023

# Packages ----
library(dplyr)
library(ggplot2)
library(readxl)
library(tidyr)

# Importing data ----
getwd() #where is my current working directory
setwd("~/Library/CloudStorage/Dropbox/Documents/GitHub/UVic_BUGS_RIntro")

#import from .csv
shark_data <- read.csv("data/LPD_Sharks_CPUE.csv")
#import from .xlsx
shark_data <- read_excel("data/LPD_Sharks_CPUE.xlsx")

#view the data
View(shark_data)
