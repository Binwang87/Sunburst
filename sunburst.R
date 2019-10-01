library(plotly)
library(htmltools)
#> Warning: package 'htmltools' was built under R version 3.4.4
library(d3r)
library(sunburstR)

dat <- data.frame(
  level1 = rep(c("a", "b"), each=3),
  level2 = paste0(rep(c("a", "b"), each=3), 1:3),
  size = c(10,5,2,3,8,6),
  stringsAsFactors = FALSE
)

tree <- d3_nest(dat, value_cols = "size")
sb1 <- sunburst(tree, width="100%", height=400)
sb1

setwd('D:/11614361/11614361/Rebecca')

p <- plot_ly(
  labels = c("Industry", "Broadacare_cropping (29%)", "Dairy (4%)", "Extensive_livestock (14%)","Fisheries (9%)","Forestry (8%)",
             "Horticulture (7%)", "Viticulture (6%)", "Biosecurity (23%)",'BC (16%)','EL (45%)','BC_EL (3%)','EL_F (3%)','F (3%)','H (32%)'),
  #parents = c("", "Eve", "Eve", "Seth", "Seth", "Eve", "Eve", "Awan", "Eve"),
  
  #text = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura",'oo','mm',"Enoch", "Azura",'oo','mm'),
  parents = c( "","Industry", "Industry", "Industry","Industry","Industry",
               "Industry", "Industry", "Industry","Biosecurity (23%)","Biosecurity (23%)","Biosecurity (23%)","Biosecurity (23%)"
               ,"Biosecurity (23%)","Biosecurity (23%)"),
  values = c(168, 49, 7, 24, 15, 13, 12, 10, 38,6,17,1,1,1,12),
  #text= ifelse(values<2,"outside","inside"),
  #values = c(58, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst',
  branchvalues = 'total'
)
p

p <- plot_ly(
  #labels = c("Industry", "Cropping (29%)", "Dairy (4%)", "Livestock (14%)","Fisheries (9%)","Forestry (8%)",
  #           "Horticulture (7%)", "Viticulture (6%)", "Biosecurity (23%)",'Cropping (16%)','Livestock (45%)','Other (9%)','Horticulture (32%)'),
  #parents = c("", "Eve", "Eve", "Seth", "Seth", "Eve", "Eve", "Awan", "Eve"),
  labels = c("Industry", "  ", "  ", "  "," "," ",
             " ", " ", "Biosecurity (23%)",' ',' ','Other (9%)','Horticulture (32%)'),
  
  #text = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura",'oo','mm',"Enoch", "Azura",'oo','mm'),
  parents = c( "","Industry", "Industry", "Industry","Industry","Industry",
               "Industry", "Industry", "Industry","Biosecurity (23%)","Biosecurity (23%)"
               ,"Biosecurity (23%)","Biosecurity (23%)"),
  values = c(168, 49, 7, 24, 15, 13, 12, 10, 38,6,17,3,12),
  #text= ifelse(values<2,"outside","inside"),
  #values = c(58, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst',
  branchvalues = 'total'
)
p

orca(p, file = "Sunburst_industry.png",width=500, height=500,scale=3)




p <- plot_ly(
  labels = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura"),
  parents = c("", "Eve", "Eve", "Eve", "Eve", "Eve", "Eve", "Eve", "Eve"),
  values = c(58, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst',
  branchvalues = 'total'
)
p


# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="sunburst-branchvalues-total")
chart_link


d1 <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/coffee-flavors.csv')
d2 <- read.csv('https://raw.githubusercontent.com/plotly/datasets/718417069ead87650b90472464c7565dc8c2cb1c/sunburst-coffee-flavors-complete.csv')
p <- plot_ly() %>%
  add_trace(
    ids = d1$ids,
    labels = d1$labels,
    parents = d1$parents,
    type = 'sunburst',
    maxdepth = 2,
    domain = list(column = 0)
  ) %>%
  add_trace(
    ids = d2$ids,
    labels = d2$labels,
    parents = d2$parents,
    type = 'sunburst',
    maxdepth = 3,
    domain = list(column = 1)
  ) %>%
  layout(
    grid = list(columns =2, rows = 1),
    margin = list(l = 0, r = 0, b = 0, t = 0),
    sunburstcolorway = c(
      "#636efa","#EF553B","#00cc96","#ab63fa","#19d3f3",
      "#e763fa", "#FECB52","#FFA15A","#FF6692","#B6E880"
    ),
    extendsunburstcolors = TRUE)
p
