library(shiny)
library(DT)
library(readr)


files_check <- list(0, 0, 0, 0)
# length(x[x==1]) == 4

shinyServer(
  function(input, output){
    output$fts <- renderDataTable({
      
      fts_file_path <- input$fts_file_info$datapath

      if(is.null(fts_file_path)){
        files_check[1] <- 0
        return(NULL)
      }
      else{
        files_check[1] <- 1
      }
      
      print(files_check)
      read_csv(fts_file_path)
    })
    
    output$stf <- renderDataTable({
      
      stf_file_path <- input$stf_file_info$datapath
      
      if(is.null(stf_file_path))
        return(NULL)
      
      read_csv(stf_file_path)
    })
    
    output$count <- renderDataTable({
      
      count_file_path <- input$count_file_info$datapath
      
      if(is.null(count_file_path))
        return(NULL)
      
      read_csv(count_file_path)
    })
    
    output$sheet <- renderDataTable({
      
      sheet_file_path <- input$sheet_file_info$datapath
      
      if(is.null(sheet_file_path))
        return(NULL)
      
      read_csv(sheet_file_path)
    })
  }
)