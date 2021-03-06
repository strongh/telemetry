library(shiny)
library(ggplot2)

## rotating data frame
window.size <- 50
motion <- data.frame(x=rep(NA, window.size),
                     y=rep(NA, window.size),
                     z=rep(NA, window.size))


shinyServer(function(input, output) {
  output$motion.plot <- renderPlot({
    motion[2:window.size, ] <- motion[1:(window.size-1), ]
    print(input$motion)
    motion[1, ] <- c(input$motion$x,
                     input$motion$y,
                     input$motion$z)
    motion <<- motion
    ## this is just a silly visualization
    ggplot(motion, aes(x, y, size=z)) +
      geom_path()
  })
})
