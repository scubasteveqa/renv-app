library(shiny)
library(bslib)

ui <- page_sidebar(
  title = "Sample App with renv",
  sidebar = sidebar(
    textInput("name", "Enter your name:", ""),
    sliderInput("number", "Choose a number:", 1, 100, 50)
  ),
  card(
    card_header("Welcome"),
    card_body(
      textOutput("greeting"),
      textOutput("value")
    )
  )
)

server <- function(input, output) {
  output$greeting <- renderText({
    if (input$name == "") return("Please enter your name")
    paste("Hello,", input$name, "!")
  })
  
  output$value <- renderText({
    paste("You selected:", input$number)
  })
}

shinyApp(ui, server)
