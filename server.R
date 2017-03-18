# server.R

library(shiny)
data("cars")
shinyServer(function(input, output) {
  model <- lm(dist ~ speed, data = cars)

  modelpred <- reactive({
      predict(model, newdata = data.frame(speed = input$SpeedInput))
  })
  

  output$plot1 <- renderPlot({
    
    plot(cars$speed, cars$dist, xlab = "Speed in mph", 
         ylab = "Distance in ft", bty = "n", pch = 16)
    
          abline(model, col = "red", lwd = 2)
          points(input$SpeedInput, modelpred(), col = "red", pch = 16, cex = 2)
  
      output$pred1 <- renderText({
    modelpred()
  })
  
  })
})
