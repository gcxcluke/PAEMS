
library(shiny)
library(ggplot2)



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Title Goes Here!!"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput("x",
                         "Input your own Value for X!",
                         value=1),
            sliderInput("y", "Use a Slide to tell me your age!", min=1, max=100, 
                        value=1, step=1),
            selectInput("grade", "What Grade are you?", choices=c("Freshman", "Sophomore", "Junior", "Senior")) 
        ),

        # Show a plot of the generated distribution
        mainPanel(
           htmlOutput("xval")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$xval <- renderText({
      HTML(paste("X is: ", input$x, "<br/> Your Age is: ",input$y, "<br/> You are a ",input$grade))
    })
}  


# Run the application 
shinyApp(ui = ui, server = server)
