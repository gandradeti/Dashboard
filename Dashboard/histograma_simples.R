library(shiny)

ui <- fluidPage("Utilizando Shiny!!!",
                plotOutput(outputId = "histograma")
                )

server <- function(input, output, session){
  
  output$histograma <- renderPlot({
    hist(mtcars$mpg)
  })
}

shinyApp(ui, server, options = list(launch.browser = FALSE, port = 3000))

