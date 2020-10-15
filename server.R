#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
temp2019<-read.table(file="/Users/justinkoehn/Documents/BaseballFinalProjectDNSC/expected_stats2019.csv",sep=',', header = TRUE)
temp2018<-read.table(file="/Users/justinkoehn/Documents/BaseballFinalProjectDNSC/expected_stats2018.csv",sep=',', header = TRUE)
temp2017<-read.table(file="/Users/justinkoehn/Documents/BaseballFinalProjectDNSC/expected_stats2017.csv",sep=',', header = TRUE)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
    output$distPlot <- renderPlot({ 
        mydata<-switch(input$year,
            "2019"=temp2019,
            "2018"=temp2018,
            "2017"=temp2017)
        
        
        
        ActualStats <- switch(input$realstats, 
                       "Batting Average" = mydata$ba,
                       "Slugging Percentage" = mydata$slg,
                       "Weighted On-base Average" = mydata$woba)
        ExpectedStats <- switch(input$expectedstats, 
                    "Expected Batting Average" = mydata$est_ba,
                    "Expected Slugging Percentage" = mydata$est_slg,
                    "Expected Weighted On-base Average" = mydata$est_woba)
        
        
        
        plot(ActualStats,ExpectedStats,
        main ="Expected vs Real Batting Statistics")
        
       

        
        

    })

})
