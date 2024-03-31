#app/view/dataset.R

box::use(
  shiny[div, moduleServer, NS, renderUI, uiOutput],
  shiny.fluent[DetailsList]
)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    uiOutput(ns("datatable"))
  )
}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session) {
    dataf <- data.frame(Tema = "teste",
                       Argomento = "teste",
                       Sottoargomento = "teste",
                       Paginaweb = "teste",
                       Personachiparla = 0,
                       Linea = "teste")
    output$datatable <- renderUI({
      DetailsList(items = dataf
                    )
    })
  })
}
