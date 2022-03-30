rm(list = ls())
setwd("C:/Users/na_ma/Dropbox (University of Oregon)/ms_polnetworks")
library(tidyverse)
## Load the data
red_2014 <- readxl::read_xlsx("data/BD_RedPolinizadores_2014.xlsx")
red_2015 <- readxl::read_xlsx("data/BD_RedPolinizadores_2015.xlsx")
red_2016 <- readxl::read_xlsx("data/BD_RedPolinizadores_2016.xlsx")
red_2017 <- readxl::read_xlsx("data/BD_RedPolinizadores_2017.xlsx")
red_2018 <- readxl::read_xlsx("data/BD_RedPolinizadores_2018.xlsx")
red_2019 <- readxl::read_xlsx("data/BD_RedPolinizadores_2019.xlsx")
## Fix the names 
sort(unique(red_2014$plantSpecies))
red_2014$plantSpecies[red_2014$plantSpecies == "Caesalpinia"]<- "Caesalpinia sp"
red_2014$plantSpecies[red_2014$plantSpecies == "Gossypium histurum"]<- "Gossypium hirsutum"
red_2014$plantSpecies[red_2014$plantSpecies == "Thespisia populnea"]<- "Thespesia populnea"
red_2014$plantSpecies[red_2014$plantSpecies == "Ipomea pes-caprae"]<- "Ipomoea pes-caprae"

sort(unique(red_2014$pollinatorSpecies))

red_2014$pollinatorSpecies[red_2014$pollinatorSpecies == "Agraulis vanilae insularis"]<- "Agraulis vanillae insularis"

sort(unique(red_2015$plantSpecies))
red_2015$plantSpecies[red_2015$plantSpecies == "Chrysobalanus Icaco"]<- "Chrysobalanus icaco"
red_2015$plantSpecies[red_2015$plantSpecies == "ipomea pes-caprae"]<- "Ipomoea pes-caprae"
red_2015$plantSpecies[red_2015$plantSpecies == "Ipomea pes-caprae"]<- "Ipomoea pes-caprae"
red_2015$plantSpecies[red_2015$plantSpecies == "Leucanea Leucocephala"]<- "Leucaena leucocephala"
red_2015$plantSpecies[red_2015$plantSpecies == "Scaveola taccada"]<- "Scaevola taccada"
red_2015$plantSpecies[red_2015$plantSpecies == "Scaveola Taccada"]<- "Scaevola taccada"
red_2015$plantSpecies[red_2015$plantSpecies == "Jasminum"]<- "Jasminum fluminense"

sort(unique(red_2015$pollinatorSpecies))

red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Ascia"]<- "Ascia monuste eubotea"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Campsomeris"]<- "Campsomeris sp"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Danaus plexippus"]<- "Danaus plexippus portoricencis"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Danaus plexippus"]<- "Danaus plexippus portoricencis"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Green hummingbird"]<- "Riccordia maugeaus"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Skipper marron"]<- "Hesperiidae"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Stictia Signata"]<- "Stictia signata"
red_2015$pollinatorSpecies[red_2015$pollinatorSpecies == "Wasp sp"]<- "Hymenoptera"

sort(unique(red_2016$plantSpecies))
sort(unique(red_2016$pollinatorSpecies))
red_2016$pollinatorSpecies[red_2016$pollinatorSpecies == "Agraulis vanillae"]<- "Agraulis vanillae insularis"
red_2016$pollinatorSpecies[red_2016$pollinatorSpecies == "Ascia monuste"]<- "Ascia monuste eubotea"

sort(unique(red_2017$plantSpecies))
red_2017$plantSpecies[red_2017$plantSpecies == "Ipomea pes-capre"]<- "Ipomoea pes-caprae"
red_2017$plantSpecies[red_2017$plantSpecies == "Stachytarphera jamaicensis"]<- "Stachytarpheta jamaicensis"

sort(unique(red_2017$pollinatorSpecies))

sort(unique(red_2018$plantSpecies))
red_2018$plantSpecies[red_2018$plantSpecies == "Ipomoea"]<- "Ipomoea pes-caprae"
red_2018$plantSpecies[red_2018$plantSpecies == "Ipomoea pes-capre"]<- "Ipomoea pes-caprae"
red_2018$plantSpecies[red_2018$plantSpecies == "Ipomoea spp"]<- "Ipomoea pes-caprae"
red_2018$plantSpecies[red_2018$plantSpecies == "euphorbia mesembryanthemifolia"]<- "Euphorbia mesembryanthemifolia"
red_2018$plantSpecies[red_2018$plantSpecies == "Vervain"]<- "Verbenaceae"

sort(unique(red_2018$pollinatorSpecies))
red_2018$pollinatorSpecies[red_2018$pollinatorSpecies == "Philoris spp"]<- "Philoris sp"
red_2018$pollinatorSpecies[red_2018$pollinatorSpecies == "Philoris spp."]<- "Philoris sp"
red_2018$pollinatorSpecies[red_2018$pollinatorSpecies == "Tabanus spp"]<- "Tabanus sp"
red_2018$pollinatorSpecies[red_2018$pollinatorSpecies == "no pollinator"]<- "No pollinator"

sort(unique(red_2019$plantSpecies))
red_2019$plantSpecies[red_2019$plantSpecies == "Bidens Alba"]<- "Bidens alba"
red_2019$plantSpecies[red_2019$plantSpecies == "Lantana camara hybrid"]<- "Lantana camara"
red_2019$plantSpecies[red_2019$plantSpecies == "Stachytapheta jamaicensis"]<- "Stachytarpheta jamaicensis"

sort(unique(red_2018$pollinatorSpecies))
red_2019$pollinatorSpecies[red_2019$pollinatorSpecies == "Dioprosopa"]<- "Dioprosopa sp"
red_2019$pollinatorSpecies[red_2019$pollinatorSpecies == "no pollinator"]<- "No pollinator"

## Merge all the data and create a new data

pn1<- rbind(red_2014,red_2015)
pn2<- rbind(pn1, red_2016)
pn3<- rbind(pn2, red_2017)
pn4<- rbind(pn3, red_2018)
pn<- rbind(pn4, red_2019)

## Separate the date in different columns
pn<- as.tibble(pn)
library(lubridate)

pn<-mutate(pn, date = ymd(date))
pn<-mutate(pn, year = year(date), month = month(date), day = day(date))

## Add column for treatment
pn<- mutate(pn, treatment = ifelse(date <= "2017-01-28", "before", "after"))

## Save as r file
#save(pn, file = "data/pol_net.Rdata")
