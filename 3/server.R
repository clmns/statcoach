library(shiny)

shinyServer(function(input, output) {
  
  trim <- function (x) gsub("^\\s+|\\s+$", "", x)
  getValues <- function() {
      values <- c()
      txt <- trim(input$data)
      txt <- strsplit(txt, split=' ')
      for (i in 0:length(txt[[1]])) {values <- c(values, as.numeric(txt[[1]][i]))}
      return(values)
  }
  degF <- function() {
    return(length(getValues())-1)
  }
  output$mean <- renderText({
      round(mean(getValues()), digits=3)
    })
  output$var <- renderText({
      round(var(getValues()), digits=3)
    })
  output$df <- renderText({
      paste(degF())
    })
  output$tValue <- renderText({
      paste(round(qt(1-as.numeric(input$alpha), degF()), digits=3))
    })

  output$lowerChiBound <- renderText({
      paste(round(qchisq(1-as.numeric(input$alpha), degF()), digits=3))
    })
  output$upperChiBound <- renderText({
      paste(1000)
    })

  output$lowerMBound <- renderText({
      paste(-1000)
    })

  
  output$upperMBound <- renderText({
      data <- getValues()
      degrF <- degF()
      paste(round(mean(data)+qt(1-as.numeric(input$alpha),degrF)*((sd(data/sqrt(length(data))))), digits=3))
    })

  output$lowerSigmaBound <- renderText({
      paste(round((degF())*var(getValues())/qchisq(1-as.numeric(input$alpha), df=degF()),digits=3))
    })

  output$upperSigmaBound <- renderText({
      paste(1000)
    })
})