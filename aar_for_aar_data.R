## aar for aar data


##install.packages("tidytext")
##install.packages("bookdown")
library(tidyverse)
library(lubridate)
library(tidytext)
library(bookdown)

db1 <- readRDS('mp_dagbog.rds')


aar1924 <- db1 %>% filter(YEAR_ == '1924' & TYPE_ !="01")
aar1925 <- db1 %>% filter(YEAR_ == '1925' )



