# Load R packages
library(shiny)
library(shinythemes)


# Define UI
ui <- fluidPage(theme = shinytheme("darkly"),
                
                navbarPage(
                  "BMI Calculator",
                  
                  # Calculate Tab
                  tabPanel(
                    "Calculate",
                    
                    # input side
                    sidebarPanel(
                      h3("Input:"),
                      numericInput("weight", "Weight (kg): ", 0, step=5),
                      numericInput("height", "Height (m): ", 0, step=0.2),
                      actionButton("calcButton", "Calculate")
                    ),
                    
                    # output & info
                    mainPanel(
                      h3("Your Body Mass Index (BMI) is:"),
                      
                      #BMI result
                      verbatimTextOutput('result')
                      
                    )
                    
                  ),
                  
                  
                  # Graph Tab
                  tabPanel("BMI Distribution", "Not Ready Yet")
                  
                ))


# Define server
server <- function(input, output) {
  # Calculate Adult BMI
  output$result <- renderPrint({
    if (input$calcButton > 0) {
      bmi <- input$weight / (input$height ^ 2)
      return(bmi)
    }
  })
  
}


# Create shiny app
shinyApp(ui = ui, server = server)
