library(shiny)
library(telemetry)

shinyUI(fluidPage(
  titlePanel("Telemetry example: orientation"),
  sidebarLayout(
    sidebarPanel(
       orientationInput("orient")
    ),
    mainPanel(
      plotOutput("orientation.plot")
    )
  )
))


