library(shiny)
library(maptools)
library(ggplot2)
library(cluster) # earthtones needs this to be installed?
library(earthtones)

shinyServer(function(input, output) {
  output$coord.earthtones.plot <- renderPlot({
    lat <- input$telem$lat
    lon <- input$telem$lon
    ## see https://github.com/wcornwell/earthtones for more info
    if (!is.null(lat) && !is.null(lon))
      # the if check is b/c the browser
      # seems to initialize lat/lon as null
      get_earthtones(latitude = lat, longitude=lon,
                     zoom=as.numeric(input$zoom),
                     number_of_colors=as.numeric(input$colors))
  })
})
