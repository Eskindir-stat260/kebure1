
library(tidyverse)
library(dplyr)
(auto_mpg = ggplot2::mpg)
sapply(auto_mpg,class)
names(auto_mpg)
auto_mpg = data.frame(auto_mpg)
auto_mpg = auto_mpg %>% select(displ,year,cyl,cty,hwy)
auto_mpg$displ <- as.numeric(as.integer(auto_mpg$displ))
auto_mpg$year <- as.numeric(as.integer(auto_mpg$year))
auto_mpg$cyl <- as.numeric(as.integer(auto_mpg$cyl))
auto_mpg$cty <- as.numeric(as.integer(auto_mpg$cty))
auto_mpg$hwy <- as.numeric(as.integer(auto_mpg$hwy))
auto_mpg = na.omit(auto_mpg)
any(is.na(auto_mpg[]))


attrs = names(auto_mpg)

library(shiny)
library(dplyr)
library(shinythemes)

## ui 
ui = fluidPage(theme = shinytheme("slate"),
               pageWithSidebar(
                 headerPanel(h2('Density of auto_mpg atrributes')),
                 sidebarPanel(
                   HTML("<h3> Input parameters<h4>"),
                   selectInput('xcol', 'attribute', attrs)),
                 mainPanel(tags$label(h4("Density plot of")),
                           plotOutput('plot1')# output is plot1
                 )
               )
)