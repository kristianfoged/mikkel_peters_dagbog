## Data transformation



# Package names
packages <- c("tidyverse", "knitr", "lubridate", "here")
# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}
# Packages loading
lapply(packages, library, character.only = TRUE) %>%   invisible()


##install.packages("tidytext")
##install.packages("bookdown")
library(tidyverse)
library(lubridate)
library(tidytext)
library(bookdown)

## Formattering

##https://r-coder.com/calendar-plot-r/

ugedage_DK <- data.frame (ugedag_nr  = c(1:7),
   ugedag_navn = c("Søndag", "Mandag","Tirsdag","Onsdag","Torsdag",
                   "Fredag","Lørdag"))   
## Initial data
dagbog_raw <- read.csv2("mikkel_peters_dagbog_raw.csv")

dagbog  <- dagbog_raw %>% 
 mutate(YEAR_ = str_sub(Key,3,6)) %>% 
  mutate(MONTH_ = str_sub(Key,7,8)) %>%
  mutate(DAY_ = str_sub(Key,9,10)) %>%
                          mutate(TYPE_ = str_sub(Key,11,12)) %>%
  mutate(DATO = str_c( str_sub(Key,3,6),str_sub(Key,7,8), str_sub(Key,9,10), sep = "-"))%>%
  mutate(DATO = as_date(DATO)) %>%
  mutate(ugedag_nr =wday(DATO)) %>%

  dagbog  <- left_join(
    dagbog,    ugedage_DK,    ugedag_nr = NULL,
    copy = FALSE,    suffix = c(".x", ".y"),    keep = FALSE  )


ugedage <- gl(1,2,3, labels = c("Mandag", "Tirsdag", "Onsdag"))

saveRDS(dagbog, file = "mp_dagbog.rds")


aar1924 <- dagbog %>% filter(YEAR_ == '1924' & TYPE_ !="01")%>%
arrange(DATO)

aar1925 <- dagbog %>% filter(YEAR_ == '1925' & TYPE_ !="01")%>%
  arrange(DATO)

##adresser <- as_tibble(adresser)
##
##dagbog_un <- dagbog %>%  unnest_tokens(word, Tekst_Mikkel_Peter)
##frekvens <- dagbog_un %>%  count(word, sort = TRUE) 
##


