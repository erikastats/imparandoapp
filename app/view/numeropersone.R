#app/view/numeropersone.R

box::use(
  shiny[div, moduleServer, NS, h3
        , textOutput, sliderInput, renderText],
  shiny.fluent[Stack, Slider.shinyInput]

)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    class = "ms-depth-4",
    Slider.shinyInput(ns("numeropersone"), min=1, max= 5, value = 2,
                      label = h3("Numero di persone nel dialogo")),

    # sliderInput(ns("numeropersone"), label = h3("Numero di persone nel dialogo"),
    #             min=1, max= 5, value = 2),
    textOutput(ns("value")))


}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session){

    output$value <- renderText({ paste0("Value: ",input$numeropersone) })
  })
}
