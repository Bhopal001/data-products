library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Distance to stop a speeding car"),
  sidebarLayout(
    sidebarPanel(
      numericInput("SpeedInput","Input speed :",10,min = 5)
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Distance (ft) to stop a speeding car (mph):"),
      textOutput("pred1")
    )
  )
))

