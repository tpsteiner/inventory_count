library(shiny)
library(DT)


shinyUI(
  fluidPage(
    titlePanel("Proof of concept: Inventory testing GAAP"),
    
    navlistPanel(widths = c(2, 4),
      
      "Files needed",
      tabPanel(
        "Floor-to-Sheet",
        fileInput("fts_file_info", accept = c(".csv"), label = NULL),
        mainPanel(
          dataTableOutput("fts")
        )
      ),
      
      tabPanel(
        "Sheet-to-Floor",
        fileInput("stf_file_info", accept = c(".csv"), label = NULL),
        mainPanel(
          dataTableOutput("stf")
        )
      ),
      
      tabPanel(
        "Count",
        fileInput("count_file_info", accept = c(".csv"), label = NULL),
        mainPanel(
          dataTableOutput("count")
        )
      ),
      
      tabPanel(
        "Sheet",
        fileInput("sheet_file_info", accept = c(".csv"), label = NULL),
        mainPanel(
          dataTableOutput("sheet")
        )
      ),
      
      "Results",
      tabPanel(
        "Output data"
      )
    )
  )
)