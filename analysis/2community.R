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
  
## Graph for the abundace of species per year
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




