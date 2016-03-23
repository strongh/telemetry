library(shiny)
library(maptools)
library(ggplot2)

shinyServer(function(input, output) {
  output$coordinates.plot<- renderPlot({
    ## this is just a silly visualization
    hist(10) # todo mapwith continents + marker for user location
  })
  output$coord.text <- renderText({
    lat <- input$telem$lat
    lon <- input$telem$lon

    paste(lat, lon)
  })
})
