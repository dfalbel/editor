
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(editor)

f <- tempfile()
write.csv(mtcars, f)

shinyServer(function(input, output, session) {

  a <- callModule(editor, "tabela", reactive(f))

  output$x <- renderTable({
    a()
  })

})
