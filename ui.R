
library(shiny)

shinyUI(fluidPage(
 
  # Application title
  titlePanel("Is my expert going to leave?!"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    fluidPage(
      
      fluidRow(
        column(width=3,
               
      sliderInput("satisfaction_level",
                  "Satisfaction Level:",
                  min = 0,
                  max = 1,
                  value = 0.1),
      
      sliderInput("last_evaluation",
                  "Last Evaluation:",
                  min = 0,
                  max = 1,
                  value = 0.1),
      
      sliderInput("number_project",
                  "Number of Projects:",
                  min = 1,
                  max = 10,
                  value = 1)
        ),
      
      column(width=3,
      
      sliderInput("average_montly_hours",
                  "Average Montly Hours:",
                  min = min(hr$average_montly_hours),
                  max = max(hr$average_montly_hours),
                  value = 1),
      
      sliderInput("time_spend_company",
                  "Time Spend Company:",
                  min = 1,
                  max = 10,
                  value = 1),
      
      radioButtons("accident", "Did your expert have a work accident?",
                   c("yes"=1, "no"=0))
      ),
      
      column(width=3,
      
      radioButtons("promote", "Did you promote your expert in the last 5 years?",
                   c("yes"=1, "no"=0)),
                   
      selectInput("sales", "In which field is your expert specialized?",
                   c("Accounting"="accounting", "Human Resources"="hr","IT"="IT","Management"="management",
                     "Marketing"="marketing", "Product Management"= "product_mng", "RandD"="RandD","Sales"="sales",
                     "Support"="support", "Technical"="technical" )
      ),
      
      selectInput("salary", "Salary",
                  c("High"="high", "Low"="low", "Medium"="medium"))
      )            
                   
      
    
      
      
    )),

    
    # Show a plot of the generated distribution
    mainPanel(
      h3(textOutput("caption")),
      
      plotOutput(outputId = "distPlot",  width = "40%")
    )
  )
))
