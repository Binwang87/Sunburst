library(plotly)
library(htmltools)
library(usethis)
library(d3r)
library(sunburstR)

p <- plot_ly(
  labels = c("Industry", "4%", "14%", "9%","3%","6.0%",
             "5%", "29%", "30%","60%","17.0%","13%","10%","17%","26%","44% ","6%","7%"),
  
  parents = c( "","Industry", "Industry", "Industry","Industry","Industry",
               "Industry", "Industry", "Industry","29%","29%","29%","29%","30%","30%","30%","30%","30%"),
  #values = c(168, 49, 7, 24, 15, 13, 12, 10, 38,6,17,3,12),
  values = c(181, 7,25, 16, 4, 12, 10, 53,54,32,8,8,5,9,14,24,3,4),
  textfont = list(color = '#000000', size = 14),
  #visible = "legendonly",
  #text= ifelse(values<2,"outside","inside"),
  #values = c(58, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst',
  branchvalues = 'total'
)
p

orca(p, file = "Sunburst_industry1.png",width=500, height=500,scale=3)


