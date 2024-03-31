#app/view/argomento.R

box::use(
  shiny[div, moduleServer, NS, h3
        , textOutput, textInput, actionButton, renderText,
        reactiveVal, observeEvent],
  shiny.fluent[Stack]

)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    class = "ms-depth-4",
    textInput(ns("argomento"), label = h3("Argomento del dialogo")),
    actionButton(ns("action"), label = "Ok"),
    textOutput(ns("value")))


}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    updated_value <- reactiveVal(NULL)

    observeEvent(input$action, {
      updated_value(input$argomento)
    })
    output$value <- renderText({ updated_value()})
  })
}
