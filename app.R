library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "number1",
                   label = "Number 1",
                   value = 0),
      numericInput(inputId = "number2",
                   label = "Number 2",
                   value = 0),
      actionButton("multiply", "Multiply")
    ),
    mainPanel(
      h2("The sum of the two numbers is:"),
      textOutput("sum"),
      h2("The product of the two numbers is:"),
      textOutput("product")
    )
  )
)

server <- function(input, output) {
  output$sum <- renderText({
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    x1 + x2
  })
  
  output$product <- renderText({
    input$multiply
    isolate({
      x1 <- as.numeric(input$number1)
      x2 <- as.numeric(input$number2)
      x1 * x2
    })
  })
}

shinyApp(ui = ui, server = server)

