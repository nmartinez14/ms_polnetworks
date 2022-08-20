rm(list = ls())
setwd("C:/Users/na_ma/Dropbox (University of Oregon)/ms_polnetworks")
library(tidyverse)
pinones<- read_csv("data/pinones.csv")

## Flower visitor species abundance. To account for sampling effort abundance is 
## transformed as a ratio of the number of individuals of a species by the hours 
## of sampling for year. 
hours<-pinones %>% 
  group_by(year) %>% 
  summarise(hoursperday = unique(hoursperday)) %>% 
  group_by(year) %>% 
  summarise(hrsperyear = sum(hoursperday))

vspp<-pinones %>%   
group_by(year,funcgroup, pollinatorSpecies) %>% 
  summarise(n = n())

pollinators<-left_join(vspp, hours, by = "year")

pollinators<-pollinators %>% 
  group_by(year, funcgroup, pollinatorSpecies, n) %>% 
  summarise(ratio = n/hrsperyear) 
pollinators$funcgroup[pollinators$funcgroup == "ant"]<- "others"
pollinators$funcgroup[pollinators$funcgroup == "hemipteran"]<- "others"
pollinators$funcgroup[pollinators$funcgroup == "beetle"]<- "others"
pollinators$funcgroup[pollinators$funcgroup == "moth"]<- "butterfly"
  
## Graph for the abundance of species per year
library(gridExtra)
library(ggbeeswarm)
ggplot(pollinators,aes(funcgroup,ratio, fill= as.factor(funcgroup)))+
  geom_col()+
  facet_wrap(~as.factor(year))+
  theme_minimal()+
  theme(legend.position = "bottom", legend.text = element_text(size = 18), legend.title = element_text(size = 18))+
  xlab("Year")+
  ylab("Abundance of Groups")+
  scale_fill_discrete(name = "Functional Groups")+ theme(axis.text.y = element_text(size = 14))+
  theme(axis.text.x = element_text(size = 16),axis.title.y= element_text(size = 18),axis.title.x= element_text(size = 18),
        strip.text = element_text(size = 16))
  ggsave("funcGvisits.pdf", width= 8.5, height = 6)

## Plant species frequency of observations per year
  pspp<-pinones %>%   
    group_by(year, plantSpecies) %>% 
    summarise(n = sum(inflorescencesVisited)) 

  plants<-left_join(pspp, hours, by = "year")
  plants<-plants %>% 
    group_by(year, plantSpecies, n) %>% 
    summarise(ratio = n/hrsperyear) 
  
## Graph for the plants
  ggplot(plants,aes( x= reorder(plantSpecies, ratio, sum), y= ratio, fill= as.factor(year)))+
    geom_col(position = 'stack', show.legend = TRUE)+
    scale_fill_manual('year', values=c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2"))+
    theme_minimal()+
    theme(legend.position = "bottom", legend.text = element_text(size = 18), legend.title = element_text(size = 18))+
    xlab("Plant Species")+
    ylab("Frequency of Observations")+
    coord_flip()+
    theme(axis.text.y = element_text(face = "italic", size = 16))+
    theme(axis.text.x = element_text(size = 14))+
    theme(axis.title.y= element_text(size = 18))+
    theme(axis.title.x= element_text(size = 18))
  ggsave("plantspfreq.pdf", width= 8.5, height = 6)