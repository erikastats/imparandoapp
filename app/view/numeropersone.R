#app/view/numeropersone.R

box::use(
  shiny[div, moduleServer, NS, h3
        , textOutput, sliderInput, renderText],
  shiny.fluent[Stack]

)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    class = "ms-depth-4",
    sliderInput(ns("numeropersone"), label = h3("Numero di persone nel dialogo"),
                min=1, max= 5, value = 2),
    textOutput(ns("value")))


}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){

    output$value <- renderText({ input$numeropersone |> as.character()})
  })
}
