
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Iris classifier"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    h4("Provide the plant measurment and the classifier will predict the species"),
    numericInput("s.length","Sepal Length",5.0,min=4,max=10,step=0.5),
    numericInput("s.width","Sepal Width",3.0,min=2,max=5,step=0.2),
    numericInput("p.length","Petal Length",3.5,min=1,max=8,step=0.5),
    numericInput("p.width","Petal Width",1.0,min=0,max=5,step=0.2)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    verbatimTextOutput("classification"),
    plotOutput("plot1"),
    plotOutput("plot2")
  )
))

