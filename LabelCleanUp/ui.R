library(shiny) 
library(DT)
library(dplyr) 
library(stringr)


shinyUI <- fluidPage(
      
      titlePanel("LabelClean Helper"),

      sidebarLayout(
            
            sidebarPanel(

                        textInput("val1", "Enter text to filter SUMMARY:"),
                        
                        hr(),
                        
                        selectInput('in6', 'Select LABEL(S) to rename:', sort(data$feature), multiple=TRUE, selectize=TRUE),
                        actionButton("pull", "From FREQ TABLE"),
                        
                        hr(),
                        
                        textInput("replace", "Enter replacement text:"),
                        actionButton("action", "Replace"),
                        
                        hr(),                        
                        
                        downloadButton('downloadData', 'Download')
                        
            ),
            
            mainPanel(
                  tabsetPanel(
                        tabPanel("FREQ TABLE", tableOutput("mytable1")),
                        tabPanel("DATA", DTOutput("mytable2"))
                  )
                  
            )
      )
)
