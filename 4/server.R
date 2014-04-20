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
  output$sd <- renderText({
      round(sd(getValues()), digits=3)
    })
  output$df <- renderText({
      paste(degF())
    })
  output$tValue <- renderText({
      paste(round((mean(getValues())-as.numeric(input$althypo))/(sd(getValues())/sqrt(length(getValues()))), digits=3))
    })

  output$lok_cu <- renderText({
      paste(-1000)
    })
  output$lok_co <- renderText({
      paste(round(qt(1-as.numeric(input$alpha1), degF()), digits=3))
    })

  output$tValueVar <- renderText({
      paste(round((degF()*var(getValues()))/(as.numeric(input$nulhypo)^2), digits=3))
    })

  
  output$var_cu <- renderText({
      
      paste(round(qchisq(as.numeric(input$alpha2)/2, degF()), digits=3))
    })

  output$var_co <- renderText({
      
      paste(round(qchisq(1-(as.numeric(input$alpha2)/2), degF()), digits=3))
    })
})