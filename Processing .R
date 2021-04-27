library(readxl)
library(tidyverse)
age <- read_xls("age.xls", skip = 11)
sex <- read_xls("sex.xls", skip = 11)
ethnicity <- read_xls("ethnicity.xls", skip = 14)
religion <- read_xls("religion.xls", skip = 11)

rename(sex, community = ...2,  male = `1 Male`, female = `2 Female`, total = ...5) -> sex
sex[,2:5] -> sex

rename(ethnicity, community = ...2) -> ethnicity
ethnicity[,2:ncol(ethnicity)] -> ethnicity

rename(religion, community = ...2) -> religion
religion[,2:ncol(religion)] -> religion
view(religion)

merge(sex, ethnicity) -> ver_1
merge(ver_1, religion) -> `2010_census_tnt`
view(`2010_census_tnt`)

read_xlsx("2010_Election_results_TNT.xlsx") -> `2010_Election_results_TNT`
view(`2010_Election_results_TNT`)


read_xlsx("2000_Census_TNT.xlsx", skip = 8) -> `2000_Census_TNT`
view(`2000_Census_TNT`)


library(xlsx)

write.xlsx(`2000_Census_TNT`, file="2000_Census_TNT.xlsx", 
           sheetName="2000_Census")

write.xlsx(`2010_census_tnt`, file="2010_Census_TNT.xlsx", 
           sheetName="2010_Census")



cal_hill <- `2010_Election_results_TNT`[6:11,]
cal_hill_cen <- `2010_census_tnt`[42,]

if (!require("devtools")) install.packages("devtools")
devtools::install_github("mkuhn/dict")

