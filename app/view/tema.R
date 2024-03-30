#app/view/tema.R

box::use(
  shiny[div, moduleServer, NS, h3
        , verbatimTextOutput, textInput, actionButton, renderPrint],
  shiny.fluent[Stack]

)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    class = "ms-depth-4",
    textInput(ns("tema"), label = h3("Tema del dialogo")),
    actionButton(ns("action"), label = "Ok"),
    verbatimTextOutput(ns("value")))


}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    output$value <- renderPrint({input$tema})
  })
}
