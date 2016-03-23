library(shiny)
library(ggplot2)

## rotating data frame
window.size <- 50
orientations <- data.frame(alpha=rep(NA, window.size),
                           beta=rep(NA, window.size),
                           gamma=rep(NA, window.size)) # no gamma


shinyServer(function(input, output) {
  output$orientation.plot <- renderPlot({
    orientations[2:window.size, ] <- orientations[1:(window.size-1), ]
    orientations[1, ] <- c(input$orient$alpha,
                           input$orient$beta,
                           input$orient$gamma)
    orientations <<- orientations
    ## this is just a silly visualization
    ggplot(orientations, aes(alpha, beta, size=gamma)) +
      geom_path() +
      coord_polar()
  })
})
