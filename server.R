#Required packages

library(shiny)
library(png)

hr <- read.csv("HR.csv")

shinyServer(function(input, output) {
  
  
  output$caption <- renderPrint({

    attach(hr)
    model<-glm(left~satisfaction_level+last_evaluation+number_project+average_montly_hours+time_spend_company+
                 Work_accident+promotion_last_5years+sales+salary, family=binomial(link='logit'))
   
    
    satisfaction_level=input$satisfaction_level
    last_evaluation=input$last_evaluation
    number_project=input$number_project
    average_montly_hours=input$average_montly_hours
    time_spend_company=input$time_spend_company
    Work_accident=as.integer(input$accident)
    promotion_last_5years=as.integer(input$promote)
    sales=input$sales
    salary=input$salary
    
    prediction<-predict(model, data.frame(satisfaction_level, 
                                          last_evaluation,
                                          number_project,
                                          average_montly_hours,
                                          time_spend_company,
                                          Work_accident,
                                          promotion_last_5years,
                                          sales,
                                          salary),type='response')
    
    
  cat("The probability that your expert will give up is",round(prediction*100,1),"%")
  
  })
  

  output$distPlot <- renderPlot({
    
    
    hr <- read.csv("HR.csv")
    
    
    attach(hr)
    model<-glm(left~satisfaction_level+last_evaluation+number_project+average_montly_hours+time_spend_company+
                 Work_accident+promotion_last_5years+sales+salary, family=binomial(link='logit'))
    
    
    satisfaction_level=input$satisfaction_level
    last_evaluation=input$last_evaluation
    number_project=input$number_project
    average_montly_hours=input$average_montly_hours
    time_spend_company=input$time_spend_company
    Work_accident=as.integer(input$accident)
    promotion_last_5years=as.integer(input$promote)
    sales=input$sales
    salary=input$salary
    
    prediction<-predict(model, data.frame(satisfaction_level, 
                                          last_evaluation,
                                          number_project,
                                          average_montly_hours,
                                          time_spend_company,
                                          Work_accident,
                                          promotion_last_5years,
                                          sales,
                                          salary),type='response')
    
    
    imA<-readPNG("A.png", native = T, info = FALSE)
    imB<-readPNG("B.png", native = T, info = FALSE)
    imC<-readPNG("C.png", native = T, info = FALSE)
    imD<-readPNG("D.png", native = T, info = FALSE)
    imE<-readPNG("E.png", native = T, info = FALSE)
    imF<-readPNG("F.png", native = T, info = FALSE)
    imG<-readPNG("G.png", native = T, info = FALSE)
    imH<-readPNG("H.png", native = T, info = FALSE)
    imI<-readPNG("I.png", native = T, info = FALSE)
    imJ<-readPNG("J.png", native = T, info = FALSE)
    imK<-readPNG("K.png", native = T, info = FALSE)

    par(mar=c(2,2,2,2))
    
    par(xpd=NA)
    
    plot(input$satisfaction_level~prediction, col="red", cex=3, xlab="Sentimental meme output", axes=F)
    
    
    
   if(prediction<0.1){
      
      lim <- par()
      rasterImage(imC, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
      
      
    }else{
      if(prediction<0.20){
        
        lim <- par()
        rasterImage(imI, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
        
        
      }else{
        if(prediction<0.3){
          lim <- par()
          rasterImage(imE, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
          
        }else{
          if(prediction<0.4){
            lim <- par()
            rasterImage(imB, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
          }else{
            if(prediction<0.5){
              lim <- par()
              rasterImage(imK, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
            }else{
              if(prediction<0.6){
                lim <- par()
                rasterImage(imJ, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
              }else{
                if(prediction<0.7){
                  lim <- par()
                  rasterImage(imF, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
                }else{
                  if(prediction<0.8){
                    lim <- par()
                    rasterImage(imH, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
                  }else{
                    if(prediction<0.9){
                      lim <- par()
                      rasterImage(imD, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
                    }else{
                      if(prediction<=1){
                        lim <- par()
                        rasterImage(imG, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
            
            }}}
      }}}}}}} 


    
  })

})
