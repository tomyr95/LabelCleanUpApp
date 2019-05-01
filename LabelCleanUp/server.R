library(shiny) 
library(DT)
library(dplyr) 
library(stringr)


shinyServer <- function(input, output, session) {
      
      mydata <- reactive({data})
      
      output$mytable1 <- renderTable({
            data2 <- as.data.frame(table(data))
            data3 <- data2 %>% filter(str_detect(data, input$val1)) %>% arrange(desc(Freq))
            data3 <- data3 %>% rename(LABEL = data)
            CHOICES <<- as.character(data3$LABEL)
            data3
      }, options = list(pageLength = 50))
      
      output$mytable2 <- renderDT({
            data2 <- data
            colnames(data2) <- Feature
            data2
      }, options = list(pageLength = 100))
      
      
      observeEvent(input$action, {
            data[data$feature %in% lab, ] <<- rep
            session$reload()
            return()
      })
      
      observeEvent(input$in6, {lab <<- input$in6})
      
      observeEvent(input$replace, {rep <<- input$replace})
      
      observeEvent(input$pull, {
            updateSelectInput(session, "in6",
                              label = "Select LABEL(S) to rename:",
                              choices = sort(CHOICES))
      })      
      
      observe({
            updateSelectInput(session, "in6",
                              label = "Select LABEL(S) to rename:",
                              choices = sort(mydata()$feature))
      })
      
      output$downloadData <- 
            downloadHandler(
                  filename = function() {paste("dataset-", Sys.Date(), ".csv", sep="")},
                  content = function(file) {write.csv(mydata(), file)}
            ) 
}