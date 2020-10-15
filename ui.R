#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Actual vs Expected Baseball Statistics"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("realstats", label = h3("Select Statistic"), 
                        choices = list("Batting Average", "Slugging Percentage", "Weighted On-base Average"), 
                        selected = "Batting Average"),
 
            selectInput("expectedstats", label = h3("Select Expected Statistic"), 
                        choices = list("Expected Batting Average", "Expected Slugging Percentage", " Expected Weighted On-base Average"), 
                        selected = "Expected Batting Average"),
            selectInput("year", label = h3("Select Year"), 
                        choices = list("2019", "2018", "2017"), 
                        selected = "2019")
            
            
            

                ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))

