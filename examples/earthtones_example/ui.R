library(shiny)
library(telemetry)


shinyUI(fluidPage(
  titlePanel("Telemetry example: location coordinates for earthtones"),
  sidebarLayout(
    sidebarPanel(
      coordinatesInput("telem"), # this prompts the user to share location
      "This Shiny app is a simple demonstration of using the ",
      a("telemetry", href="https://github.com/strongh/telemetry"),
      " package to determine user location. The user location is passed to ",
      a("earthtones", href="https://github.com/wcornwell/earthtones"),
      " which then determines a color palette from the satellite imagery at
      the user's location. It usually takes a few seconds for the imagery to appear.",
      selectInput("zoom", "Zoom level (lower zoom -> larger area)", 2:20, selected=12),
      selectInput("colors", "Number of colors in palette", 2:20, selected=8)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("coord.earthtones.plot")
    )
  )
))


