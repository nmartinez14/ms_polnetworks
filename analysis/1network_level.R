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

pinones_web<-frame2webs(pinones,type.out ="list", varnames= c("plantSpecies", 
                                "pollinatorSpecies", "treatment","visitsperhr"))

nets<- frame2webs(pinones,type.out ="list", varnames= c("plantSpecies", 
                                    "pollinatorSpecies", "year","visitsperhr"))

## Use network level function for the network metrics

networklevel(pinones_web$after, index = c("connectance", "modularity", "weighted NODF",
                                           "interaction evenness", "H2", "robustness"))
networklevel(pinones_web$after, index = c("connectance", "modularity", "weighted NODF", 
                                          "interaction evenness", "H2", "robustness"))

networklevel(nets$`2014`, index = c("connectance", "modularity", "weighted NODF", 
                                    "interaction evenness", "H2", "robustness"))
networklevel(nets$`2015`, index = c("connectance", "modularity", "weighted NODF",
                                    "interaction evenness", "H2", "robustness"))
networklevel(nets$`2016`, index = c("connectance", "modularity", "weighted NODF", 
                                    "interaction evenness", "H2", "robustness"))
networklevel(nets$`2018`, index = c("connectance", "modularity", "weighted NODF", 
                                    "interaction evenness", "H2", "robustness"))
networklevel(nets$`2019`, index = c("connectance", "modularity", "weighted NODF", 
                                    "interaction evenness", "H2", "robustness"))

## NODF comparing values to the null model

obs.2014 <- unlist(networklevel(nets$`2014`, index="weighted NODF"))


nulls.2014 <- nullmodel(nets$`2014`, N=10000, method=3)
null.2014 <- unlist(sapply(nulls.2014, networklevel, index="weighted NODF"))

null.2014<-as.data.frame(null.2014)
mn.2014<- mean(null.2014$null.2014)
sen.2014<- sd(null.2014$null.2014)/sqrt(length(null.2014$null.2014))

z.2014<- (mn.2014-obs.2014)/sen.2014
z.2014

ggplot(null.2014,aes(null.2014))+
  geom_histogram(color= "white", aes(y=..density..))+
  geom_vline(xintercept = obs.2014, color = "red")

## Using the treatment as comparison instead of per year.
obs.before <- unlist(networklevel(pinones_web$before, index="weighted NODF"))


nulls.before <- nullmodel(pinones_web$before, N=10000, method=3)
null.before <- unlist(sapply(nulls.before, networklevel, index="weighted NODF"))

null.before<-as.data.frame(null.before)
mn.before<- mean(null.before$null.before)
sen.before<- sd(null.before$null.before)/sqrt(length(null.before$null.before))

z.before<- (mn.before-obs.before)/sen.before
z.before

ggplot(null.before,aes(null.before))+
  geom_histogram(color= "white", aes(y=..density..))+
  geom_vline(xintercept = obs.before, color = "red")

obs.after <- unlist(networklevel(pinones_web$after, index="weighted NODF"))


nulls.after <- nullmodel(pinones_web$after, N=10000, method=3)
null.after <- unlist(sapply(nulls.after, networklevel, index="weighted NODF"))

null.after<-as.data.frame(null.after)
mn.after<- mean(null.after$null.after)
sen.after<- sd(null.after$null.after)/sqrt(length(null.after$null.after))

z.after<- (mn.after-obs.after)/sen.after
z.after

ggplot(null.after,aes(null.after))+
  geom_histogram(color= "white", aes(y=..density..))+
  geom_vline(xintercept = obs.after, color = "red")