
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

# Function to calculate euclidean distance
eucd <- function(x1, x2) sqrt(sum((as.numeric(x1) - as.numeric(x2)) ^ 2))

shinyServer(function(input, output) {
  output$classification <- reactive({
    # Simple nearest neigbour classifier with euclidean distance
    point <- c(input$s.length,input$s.width,input$p.length,input$p.width)
    euc.distance <- apply(iris,1,function(x) eucd(x[1:4],point))
    paste("Predicted species: ",iris[which.min(euc.distance),"Species"])
  })
  
  output$plot1 <- renderPlot({
     plot(iris[,1],iris[,2],col=iris$Species,ylab="Sepal Width",xlab="Sepal Length")
     abline(h=input$s.width,col=4)
     abline(v=input$s.length,col=4)
  })
  
  output$plot2 <- renderPlot({
    plot(iris[,3],iris[,4],col=iris$Species,ylab="Petal Width",xlab="Petal Length")
    abline(h=input$p.width,col=4)
    abline(v=input$p.length,col=4)  
  })
           
})
