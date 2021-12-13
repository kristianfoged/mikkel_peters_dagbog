## Data transformation


##install.packages("tidytext")
##install.packages("googledrive")
library(tidyverse)
library(lubridate)
library(tidytext)
##library(googledrive)

dagbog <- read.csv2("Dagbog_MP_csv.csv")
dagbog2 <- read.csv2("mikkel_peter_almanak.csv")
db <- dagbog %>% 
  mutate(Dato = as_date(Dato_id)) 

ymd("19210912")
db2 <- db %>%
  mutate(date__year  = substr(Dato_id, 1, 4)) %>%
  mutate(date__month = substr(Dato_id, 5, 2)) %>%
  mutate(date__day   = substr(Dato_id, 7, 2)) 

dagbog <- as_tibble(dagbog)
##adresser <- read_csv("adgangsadresser_samso")
##adresser <- as_tibble(adresser)
##
##dagbog_un <- dagbog %>%  unnest_tokens(word, Tekst_Mikkel_Peter)
##frekvens <- dagbog_un %>%  count(word, sort = TRUE) 
##
##
##frekvens_add <- adresser %>%  count(ejerlavnavn, sort = TRUE) 

