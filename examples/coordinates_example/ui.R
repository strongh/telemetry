library(shiny)
library(telemetry)


shinyUI(fluidPage(
  titlePanel("Telemetry example: coordinates"),
  sidebarLayout(
    sidebarPanel(
      coordinatesInput("telem")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      textOutput("coord.text"),
      plotOutput("coordinates.plot")
    )
  )
))


