#' Editor Module
#'
#' UI and Server for editor Shiny Module
#'
#' @param id id to identify the UI
#' @param input for Shiny Module
#' @param output for Shiny Module
#' @param session for Shiny Module
#' @param path the path for a csv file
#'
#' @rdname editor
#'
#' @export
editorUI <- function(id){
  ns <- shiny::NS(id)

  shiny::div(
    shiny::fluidRow(rhandsontable::rHandsontableOutput(ns("table"))),
    shiny::fluidRow(shiny::actionButton(ns("save"), "Save", icon = shiny::icon("floppy-o")))
  )

}

#' @rdname editor
#' @export
editor <- function(input, output, session, path){

  data <- shiny::reactive({
    if(input$save == 0){
      read.csv(path())
    } else {
      aux <- shiny::eventReactive(input$save, {
        rhandsontable::hot_to_r(input$table)
      })
      aux()
    }
  })

  output$table <- rhandsontable::renderRHandsontable(rhandsontable::rhandsontable(data()))

  return(data)
}


