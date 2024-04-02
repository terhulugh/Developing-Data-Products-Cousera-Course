library(shiny)
library(datasets)

swissData <- swiss

shinyServer(function(input, output) {
        
        formulaText <- reactive({
                paste("Fertility ~", input$variable)
        })
        
        formulaTextPoint <- reactive({
                paste("Fertility ~", "as.integer(", input$variable, ")")
        })
        
        fit <- reactive({
                lm(as.formula(formulaTextPoint()), data=swissData)
        })
        
        output$caption <- renderText({
                formulaText()
        })
        

        output$fit <- renderPrint({
                summary(fit())
        })
        
        output$swissPlot <- renderPlot({
                with(swissData, {
                        plot(as.formula(formulaTextPoint()))
                        abline(fit(), col=2)
                })
        })
        
})