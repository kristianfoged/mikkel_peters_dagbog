## Data transformation


##install.packages("tidytext")
##install.packages("bookdown")
library(tidyverse)
library(lubridate)
library(tidytext)
library(bookdown)
## Initial data

dagbog_raw <- read.csv2("mikkel_peters_dagbog_raw.csv")

dagbog  <- dagbog_raw %>% 
 mutate(YEAR_ = str_sub(Key,3,6)) %>% 
  mutate(MONTH_ = str_sub(Key,7,8)) %>%
  mutate(DAY_ = str_sub(Key,9,10)) %>%
                          mutate(TYPE_ = str_sub(Key,11,12)) %>%
  mutate(DATO = str_c( str_sub(Key,3,6),str_sub(Key,7,8), str_sub(Key,9,10), sep = "-"))%>%
  mutate(DATO = as_date(DATO))

saveRDS(dagbog, file = "mp_dagbog.rds")


##adresser <- as_tibble(adresser)
##
##dagbog_un <- dagbog %>%  unnest_tokens(word, Tekst_Mikkel_Peter)
##frekvens <- dagbog_un %>%  count(word, sort = TRUE) 
##


