library(plotly)
library(htmltools)
library(usethis)
library(d3r)
library(sunburstR)

p <- plot_ly(
  labels = c("Industry", "29%", "4%", "14%","9%","8%",
             "7%", "6%", "23%","16%","45%","7% ","32%"),
  
  parents = c( "","Industry", "Industry", "Industry","Industry","Industry",
               "Industry", "Industry", "Industry","23%","23%","23%","23%"),
  values = c(168, 49, 7, 24, 15, 13, 12, 10, 38,6,17,3,12),
  #text= ifelse(values<2,"outside","inside"),
  #values = c(58, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst',
  branchvalues = 'total'
)
p

orca(p, file = "Sunburst_industry.png",width=500, height=500,scale=3)


