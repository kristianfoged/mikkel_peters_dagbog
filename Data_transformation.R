## Data transformation


##install.packages("tidytext")

library(tidyverse)
library(lubridate)
library(tidytext)

## Initial data

dagbog_raw <- read.csv2("mikkel_peters_dagbog_raw.csv")

dagbog  <- dagbog_raw %>% mutate(YEAR_ = str_sub(Key,3,6)) %>% 
                          mutate(MONTH_ = str_sub(Key,7,8)) %>%
                          mutate(DAY_ = str_sub(Key,9,10)) %>%
                          mutate(TYPE_ = str_sub(Key,11,12))

dagbog <- as_tibble(dagbog)

##adresser <- as_tibble(adresser)
##
##dagbog_un <- dagbog %>%  unnest_tokens(word, Tekst_Mikkel_Peter)
##frekvens <- dagbog_un %>%  count(word, sort = TRUE) 
##


