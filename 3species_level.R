rm(list = ls())
setwd("C:/Users/na_ma/Dropbox (University of Oregon)/ms_polnetworks")
library(tidyverse)
library(bipartite)
#pinones<- read_csv("data/pinones.csv")
pinones<- read.csv("data/pinones.csv", stringsAsFactors = TRUE)
pol_sp<-read_csv("data/pol_sp.csv") 
plant_sp<- read_csv("data/plant_sp.csv")


## Create matrix
nets<- frame2webs(pinones,type.out ="list", varnames= c("plantSpecies", 
                                                        "pollinatorSpecies", 
                                                        "year","visitsperhr"))
## Use specieslevel function for the species level metrics. 
## Create dataframes for each year and add a column with the year. 

SP<-specieslevel(nets$`2014`,level = "higher",  index = c("degree", "species strength", 
                                                          "closeness",
                                                            "d"))
SP <- tibble::rownames_to_column(SP, "pollinatorSpecies") 
SP<- mutate(SP, year = "2014")

SP2<-specieslevel(nets$`2015`,level = "higher",  index = c("degree", "species strength", 
                                                          "closeness",
                                                          "d"))
SP2 <- tibble::rownames_to_column(SP2, "pollinatorSpecies") 
SP2<- mutate(SP2, year = "2015")

SP3<-specieslevel(nets$`2016`,level = "higher",  index = c("degree", "species strength", 
                                                          "closeness",
                                                          "d"))
SP3 <- tibble::rownames_to_column(SP3, "pollinatorSpecies") 
SP3<- mutate(SP3, year = "2016")

SP4<-specieslevel(nets$`2018`,level = "higher",  index = c("degree", "species strength", 
                                                          "closeness",
                                                          "d"))
SP4 <- tibble::rownames_to_column(SP4, "pollinatorSpecies") 
SP4<- mutate(SP4, year = "2018")

SP5<-specieslevel(nets$`2019`,level = "higher",  index = c("degree", "species strength", 
                                                          "closeness",
                                                          "d"))
SP5 <- tibble::rownames_to_column(SP5, "pollinatorSpecies") 
SP5<- mutate(SP5, year = "2019")

## Merge all the dataframes

SP<-rbind(SP, SP2)
SP<-rbind(SP, SP3)
SP<-rbind(SP, SP4)
SP<-rbind(SP, SP5)

## Add the functional group information by using the pol_sp dataframe. Save as csv

pol_level<-inner_join(SP, pol_sp, by= "pollinatorSpecies")
pol_level$...1<- NULL
#write.csv(pol_level, file = "data/pol_level.csv")

## Repeat the process but for the plant species.

P<-specieslevel(nets$`2014`,level = "lower",  index = c("degree", "species strength", 
                                                          "closeness",
                                                          "d"))
P <- tibble::rownames_to_column(P, "plantSpecies") 
P<- mutate(P, year = "2014")

P2<-specieslevel(nets$`2015`,level = "lower",  index = c("degree", "species strength", 
                                                           "closeness",
                                                           "d"))
P2 <- tibble::rownames_to_column(P2, "plantSpecies") 
P2<- mutate(P2, year = "2015")

P3<-specieslevel(nets$`2016`,level = "lower",  index = c("degree", "species strength", 
                                                           "closeness",
                                                           "d"))
P3 <- tibble::rownames_to_column(P3, "plantSpecies") 
P3<- mutate(P3, year = "2016")

P4<-specieslevel(nets$`2018`,level = "lower",  index = c("degree", "species strength", 
                                                           "closeness",
                                                           "d"))
P4 <- tibble::rownames_to_column(P4, "plantSpecies") 
P4<- mutate(P4, year = "2018")

P5<-specieslevel(nets$`2019`,level = "lower",  index = c("degree", "species strength", 
                                                           "closeness",
                                                           "d"))
P5 <- tibble::rownames_to_column(P5, "plantSpecies") 
P5<- mutate(P5, year = "2019")

P<-rbind(P, P2)
P<-rbind(P, P3)
P<-rbind(P, P4)
P<-rbind(P, P5)

plant_level<-inner_join(P, plant_sp, by= "plantSpecies")
plant_level$...1<- NULL
#write.csv(plant_level, file = "data/plant_level.csv")
