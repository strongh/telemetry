library(shiny)
library(telemetry)

shinyUI(fluidPage(
  # Application title
  titlePanel("Telemetry example: motion"),

  sidebarLayout(
    sidebarPanel(
       motionInput("motion")
    ),

    mainPanel(
      plotOutput("motion.plot")
    )
  )
))


