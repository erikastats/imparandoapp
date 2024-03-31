#app/view/linea.R

box::use(
  shiny[div, moduleServer, NS, h3
        , textOutput, textInput, actionButton, renderText,
        reactiveVal, observeEvent],
)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    class = "ms-depth-4",
    textInput(ns("linea"), label = h3("Linea di discorso")),
    actionButton(ns("action"), label = "Ok"),
    textOutput(ns("value")))


}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    updated_value <- reactiveVal(NULL)

    observeEvent(input$action, {
      updated_value(input$linea)
    })
    output$value <- renderText({ updated_value()})
  })
}
