setwd("/home/agricolamz/work/materials/2018_clearspending_hackathon/59/not_commit/TCBT_2_monthly.csv/")

library(tidyverse)

df <- read_csv("TCBT_2_I_2013_monthly.csv")
final <- df[FALSE, ]

files <- list.files()

sapply(seq_along(files), function(id){
read_csv(files[id]) %>% 
  filter(str_detect(REGION, "АДЫГЕЯ")) %>% 
  rbind(final) ->>
  final
})

final <- final[,-9:10]

write_csv(final, "../../adyghe.csv", na = "")
