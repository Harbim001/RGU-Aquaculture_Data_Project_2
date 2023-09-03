#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
modelLDA = readRDS("modelLDA.rds")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Escapes App"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("Season","Select Season", c("Autumn", "Spring", "Summer", "Winter")),
            sliderInput("Age", "Enter age:", min = 1, max = 100, value = 30),
            sliderInput("Average.Weight", "Enter Weight", min = 1, max = 10000, value = 40, step = 0.5),
            selectInput("Producing", "Are they producing?", c("Yes","No")),
            sliderInput("Number","Select Number:", min = 1, max = 500,  value = 100, step = 10),
            actionButton("prediction", "predict")
        ),

        # Show a plot of the generated result
        mainPanel(
           tags$h3("Prediction for cause:"),
           
           tags$p("Prediction for cause based on the LDA model is:"),
           textOutput("modelCalcLDA"),
           
           tags$br(), # tags$br creates line break
           tags$br(), # tags$br creates line break
           
           tags$p("The data and predictions gotten from this shiny app are not reproduced, duplicated, copied, or resold for commercial gain or any other unlawful purpose. Additionally, 
                  it is not being used for any fraudulent purpose or effect, and it does not contain any unlawful or fraudulent intent."),
           
           tags$br(),
           
           tags$p("LESP issues: A moratorium on expansion of the Scottish salmon industry is urgently needed. Sea lice treatments that do not harm fish or the environment are still to be found. Ultimately, farming essentially wild migratory carnivorous fish  is being challenged, 
                  if they have any place in a compassionate and sustainable food system."),
           tags$br(),
           tags$p("Onekind, 2022. Underwater Cages, Parasites and Dead Fishes: Why A Moratorium on Scottish Salmon Farming Expansion is imperative. 
                  [online]. Available from: https://www.ciwf.org.uk/media/7444572/ciwf_rethink-salmon_21_lr_singles_web.pdf [Accessed 29 Apr 2022]."),
           
           tags$a(href = "http://aquaculture.scotland.gov.uk/site_pages/legal.aspx", "Data Source")
         
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$modelCalcLDA <- renderText({
        # generate bins based on input$bins from ui.R
         a = input$Season
         b = input$Age
         c = input$Average.Weight
         g = input$Producing
         s = input$Number
         newData = data.frame(Season = a, Age = b, Average.Weight = c, Producing = g, Number = s)
         
         prediction = as.character.default(predict(modelLDA, newData))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
