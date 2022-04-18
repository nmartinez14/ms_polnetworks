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

## Create a relational data file for the locality information
sort(unique(pn$locality))
locality<- c(1:9)
beach<- c("Dos Palmas", "La Princesa", "Escondida", "Sucia", "Tortuguero", "Media Luna", "Punta Arenas", "Bahia La Chiva", "Navio")
plots<- data.frame(locality, beach)
plots<-mutate(plots, city = c("Loiza",  "Isabela","Fajardo", "Cabo Rojo", "Manati", "Vieques", "Vieques", "Vieques", "Vieques"))
plots<- mutate(plots, latitude = c("N18°26.670", "N18°30.509", "N18°22.478", "N17°56.160", "N18°28.205", "N18°05.472", "N18°05.886","N18°06.769", "N18°05.551"))
plots<- mutate(plots, longitude = c("W65°55.100", "W67°00.850", "W65°38.885", "W67°11.301", "W66°27.096", "W65°27.066", "W65°34.378","W65°23.458", "W65°26.653"))

#write.csv(plots, file = "data/plots.csv") 

#Give the locality an id number
pn$locality[pn$locality == "Isabela, Puerto Rico"]<- 2
pn$locality[pn$locality == "PR: Isabela"]<- 2
pn$locality[pn$locality == "Playa Escondida, Fajardo, N18°22.476' W065°38.897'" ]<- 3
pn$locality[pn$locality == "PR: Fajardo, Playa Escondida" ]<- 3
pn$locality[pn$locality == "PR: Fajardo, Playa Escondida" ]<- 3
pn$locality[pn$locality == "PR: Loiza, Piñones, Dos palmas" ]<- 1
pn$locality[pn$locality == "PR: Loiza, Piñones/Coast Trails" ]<- 1
pn$locality[pn$locality == "PR:Loiza, Pinñones, Dos palmas" ]<- 1
pn$locality[pn$locality == "Piñones, Mediana Baja, Dos Palmas N18°26.828' W65°56.452'" ]<- 1
pn$locality[pn$locality == "PR: Loiza, Piñones, Dos Palma, N18°26.831' W65°56.452'"  ]<- 1
pn$locality[pn$locality == "PR: Loíza, Piñones, Dos Palmas" ]<- 1
pn$locality[pn$locality == "PR:Loiza, Piñones, Coast trails" ]<- 1
pn$locality[pn$locality == "PR: Manatí, Playa Tortuguerro" ]<- 5
pn$locality[pn$locality == "Playa Tortuguero, Manati, N18°28.205' W066°27.096'" ]<- 5
pn$locality[pn$locality == "PR: Manatí, Playa Tortuguero" ]<- 5
pn$locality[pn$locality == "PR:Manati,Tortuguero" ]<- 5
pn$locality[pn$locality == "PR:Cabo Rojo, Playa Sucia, N17°56.160'W67°11.301'" ]<- 4
pn$locality[pn$locality == "PR: Vieques, Playa Media Luna" ]<- 6
pn$locality[pn$locality == "Vieques, Puerto Ferro, Media Luna N18°05.472' W065°27.066'8:46" ]<- 6
pn$locality[pn$locality == "Vieques, Puerto Ferro, Media Luna N18°05.472' W065°27.066'"  ]<- 6
pn$locality[pn$locality == "PR: Vieques, Playa Punta Arena"]<- 7
pn$locality[pn$locality == "Vieques, Puerto Rico, Punta Arenas 18°06'53.2\"N 65°34'22.7\"W"]<- 7
pn$locality[pn$locality == "Vieques, Puerto Ferro, Bahia La Chiva N18°06.769' W065°23.458'"]<- 8
pn$locality[pn$locality == "Vieques, Puerto Ferro, Navio Beach N18°05.551' W065°26.653'"]<- 9

## Fix species names that are not written correctly
sort(unique(pn$pollinatorSpecies))
pn$pollinatorSpecies[pn$pollinatorSpecies == "Aphrissa satira cubana"]<- "Aphrissa statira cubana"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Aphrissa statina cubana"]<- "Aphrissa statira cubana"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Aphrissa statira cabuna"]<- "Aphrissa statira cubana"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Ascia monuste"]<- "Ascia monuste eubotea"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Battus polydamas"]<- "Battus polydamas thyamus"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Campsomeris dorasata"]<- "Campsomeris dorsata"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Campsomeris epipphium"]<- "Campsomeris ephippium"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Danaus plexippus"]<- "Danaus plexippus portoricensis"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Danaus plexippus portoricencis"]<- "Danaus plexippus portoricensis"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Dioprosopa sp"]<- "Dioprosopa clavata"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Glutophrissa drusilla poeyi"]<- "Glutophrissa drusilla boydi"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Glutophrissia drusilla boydi"]<- "Glutophrissa drusilla boydi"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Hylephila phyleus"]<- "Hylephila phyleus phyleus"
pn$pollinatorSpecies[pn$pollinatorSpecies == "No pollinator"]<- "no pollinator"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Panoquina panoquinoide"]<- "Panoquina panoquinoides panoquinoides"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Phoebis agarithe antilla"]<- "Phoebis agarithe antillia"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Pseudochrysops bornoi ecoboi"]<- "Pseudochrysops bornoi escobioi"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Scarabeidae"]<- "Scarabaeidae"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Eristalis vinetorum"]<- "Palpada vinetorum"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Philornis"]<- "Philoris sp"
pn$pollinatorSpecies[pn$pollinatorSpecies == "Bembix oculata"]<- "Bembix sp"
sort(unique(pn$plantSpecies))
pn$plantSpecies[pn$plantSpecies == "Citharexylum"]<- "Citharexylum sp"
pn$plantSpecies[pn$plantSpecies == "Citharexylum pendular"]<- "Citharexylum sp"
pn$plantSpecies[pn$plantSpecies == "Macroptillum atropurpureum"]<- "Macroptilium atropurpureum"

## Create relational data for the species
pol_sp <- sort(unique(pn$pollinatorSpecies))
func_group <- c("butterfly", "butterfly", "wasp", "bird", "butterfly", "bee", "butterfly",
                "butterfly", "butterfly", "wasp", "fly", "wasp", "wasp", "wasp", "wasp",
                "wasp", "bee", "bee", "bee", "beetle","fly", "butterfly", "butterfly",
                "beetle","fly", "fly", "butterfly", "butterfly", "fly", "fly", "fly", 
                "butterfly", "butterfly", "butterfly", "butterfly", "butterfly",
                "butterfly", "hemipteran", "butterfly", "butterfly", "wasp", 
                "butterfly", "butterfly", "wasp", "hemipteran", "fly","no pollinator",
                "fly", "fly", "fly", "fly","butterfly", "butterfly", "butterfly",
                "ant", "wasp","fly", "butterfly", "butterfly", "butterfly", "wasp",
                "fly", "butterfly", "bird", "beetle", "wasp", "fly", "fly", "fly", 
                "fly", "butterfly", "moth", "fly","butterfly", "bee")
pol_sp<- data.frame(pol_sp, func_group)
names(pol_sp)<- c("pollinatorSpecies", "funcgroup")
pol_sp<- as_tibble(pol_sp)
pol_sp<- filter(pol_sp, pollinatorSpecies != "no pollinator", funcgroup != "no pollinator")
#write.csv(pol_sp, file = "data/pol_sp.csv") 

## Save the plant species 
plant_sp <- sort(unique(pn$plantSpecies))
plant_sp<- data.frame(plant_sp)
#write.csv(plant_sp, file = "data/plant_sp.csv") 

## Save as r file
#save(pn, file = "data/pol_net.Rdata")
#write.csv(pn, file = "data/pol_net.csv") 
