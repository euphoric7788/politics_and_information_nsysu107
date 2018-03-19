library(httr)

url <- "https://api.kivaws.org/v1/lenders/jeremy/teams.json"
res = GET(url)
res_json = content(res)
do.call(rbind,res_json$teams)
View(data.frame(do.call(rbind,res_json$teams)))
