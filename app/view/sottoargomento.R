#app/view/sottoargomento.R

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
    textInput(ns("sottoargomento"), label = h3("Sotto argomento del dialogo")),
    actionButton(ns("action"), label = "Ok"),
    textOutput(ns("value")))


}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    updated_value <- reactiveVal(NULL)

    observeEvent(input$action, {
      updated_value(input$sottoargomento)
    })
    output$value <- renderText({ updated_value()})
  })
}
