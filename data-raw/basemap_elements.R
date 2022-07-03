## code to prepare `DATASET` dataset goes here

library(readr)

basemap_elements <- read.csv("data-raw/basemap_elements.csv")

usethis::use_data(basemap_elements, overwrite = TRUE)
