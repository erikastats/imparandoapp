#app/view/tema.R

box::use(
  shiny[div, moduleServer, NS, h3
        , textOutput, textInput, actionButton, renderText,
        reactiveVal, observeEvent],
  shiny.fluent[Stack]

)

#' @export
ui <- function(id){
  ns <- NS(id)
  Stack(
    horizontal = TRUE,
    textInput(ns("tema"), label = h3("Tema del dialogo")),
    actionButton(ns("action"), label = "Ok"),
    # textOutput(ns("value")))
  )

}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    updated_value <- reactiveVal(NULL)

    observeEvent(input$action, {
      updated_value(input$tema)
    })
    # output$value <- renderText({ updated_value()})

    return(updated_value())
  })
}
