#app/view/paginaweb.R

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
    textInput(ns("paginaweb"), label = h3("Pagina web del dialogo")),
    actionButton(ns("action"), label = "Ok"),
    # textOutput(ns("value"))
    )
}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){
    updated_value <- reactiveVal(NULL)

    observeEvent(input$action, {
      updated_value(input$paginaweb)
    })
    # output$value <- renderText({ updated_value()})

    return(updated_value())
  })
}
