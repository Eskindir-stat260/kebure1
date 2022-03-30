library(tidyverse)
library(dplyr)
(auto_mpg = ggplot2::mpg)
sapply(auto_mpg,class)
# auto_mpg = lapply(auto_mpg[1:11], as.numeric)
 



names(auto_mpg)
# View(auto_mpg)
auto_mpg = data.frame(auto_mpg)
auto_mpg = auto_mpg %>% select(displ,year,cyl,cty,hwy)
# sapply(auto_mpg,class)
# dates = lapply(auto_mpg[2:5], as.numeric)
auto_mpg$displ <- as.numeric(as.integer(auto_mpg$displ))
auto_mpg$year <- as.numeric(as.integer(auto_mpg$year))
auto_mpg$cyl <- as.numeric(as.integer(auto_mpg$cyl))
auto_mpg$cty <- as.numeric(as.integer(auto_mpg$cty))
auto_mpg$hwy <- as.numeric(as.integer(auto_mpg$hwy))
auto_mpg = na.omit(auto_mpg)
any(is.na(auto_mpg[]))

# (auto_mpg = as.tibble(auto_mpg))
# auto_mpg = as.numeric(as.character(auto_mpg))
# auto_mpg$displ <- as.numeric(as.double(auto_mpg$displ))
# auto_mpg
# auto_mpg = na.omit(auto_mpg)
# colSums(is.na(auto_mpg[]))

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
         
## server
         
server = function(input, output, session) {
           
# Combine the selected variables into a new data frame
selectedData <- reactive({ auto_mpg[ , input$xcol]})
           
output$plot1 <- renderPlot({ 
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
                       "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
par(mar = c(5.1, 4.1, 4.1, 3))
plot(density(selectedData()),main = input$xcol)
 })
}
         
# creating a shiny object
         
shinyApp(ui=ui, server = server)
         
         