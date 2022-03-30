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