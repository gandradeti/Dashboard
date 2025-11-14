library(shiny)

ui <- fluidPage(
  titlePanel("Histograma Interativo"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Número de barras:",
                  min = 1,
                  max = 30,
                  value = 10)),
    mainPanel(
      plotOutput(outputId = "histograma")
    )
  )
)


server <- function(input, output, session){
  output$histograma <- renderPlot({
    bins_selecionados <- seq(min(mtcars$mpg), max(mtcars$mpg), length.out = input$bins + 1)
    
    hist(mtcars$mpg,
         breaks = bins_selecionados,
         col = "darkgray",
         border = "white", 
         main = paste("Histograma de MPG com", input$bins, "Bins"))
  })
}

shinyApp(ui, server)