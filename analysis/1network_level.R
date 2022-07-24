rm(list = ls())
setwd("C:/Users/na_ma/Dropbox (University of Oregon)/ms_polnetworks")
library(tidyverse)
library(bipartite)
pn<- read_csv("data/pol_net.csv")
plots<- read_csv("data/plots.csv")
pol_sp<-read_csv("data/pol_sp.csv") 
plant_sp<- read_csv("data/plant_sp.csv")
pn$locality<- as.factor(pn$locality)
plots$locality<- as.factor(plots$locality)
pol_sp$...1<- NULL
plant_sp$...1<- NULL
plots$...1<- NULL
## Check how many visits a year were done in Pinones
pn %>% 
  select(date, locality, year) %>% 
  filter(locality == "1") %>% 
  group_by(locality, year) %>% 
  summarize(n = n_distinct(date))
  
## Merge data
pn<- inner_join(pn, plots, by = "locality")
pn <- inner_join(pn, pol_sp, by = "pollinatorSpecies")
pn <- inner_join(pn, plant_sp, by = "plantSpecies")
pn


## Filter the city to just Loiza and create a new column with the hrs per day
## and transform the visit frequency to the ratio per hr. 
pinones<- pn %>% 
  filter(city == "Loiza") %>% 
  mutate(hoursperday = endTime - startTime) %>% 
  mutate(hoursperday = hoursperday/60)
 
pinones$hoursperday<- as.numeric(pinones$hoursperday)
pinones$inflorescencesVisited<- as.numeric(pinones$inflorescencesVisited)

pinones<- pinones %>%  
  mutate(visitsperhr = inflorescencesVisited/hoursperday)
## Bipartite doesn't work well with tibbles. I saved a new csv file with the transformed data.
## Then I uploaded using the R base function for uploading csv instead of the readr function.

#write.csv(pinones, file = "data/pinones.csv")
pinones<- read.csv("data/pinones.csv", stringsAsFactors = TRUE)

## Create matrix

pinones_web<-frame2webs(pinones,type.out ="list", varnames= c("plantSpecies", "pollinatorSpecies", "treatment","visitsperhr"))
