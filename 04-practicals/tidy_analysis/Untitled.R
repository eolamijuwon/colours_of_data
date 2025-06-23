library(shiny)

ui <- fluidPage(
  titlePanel("Shiny App with Quarto Reveal.js Slides"),
  
  tags$a(href = "week-1/tidy_data_analysis.html", target = "_blank", 
         "Open Slides (Reveal.js Quarto)", style = "font-size: 18px;")
)

server <- function(input, output, session) {}

shinyApp(ui, server)