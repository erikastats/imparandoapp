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
    dataf <- data.frame(Tema = character(),
                       Argomento = character(),
                       Sottoargomento = character(),
                       Paginaweb = character(),
                       Personachiparla = integer(),
                       Linea = character())
    output$datatable <- renderUI({
      DetailsList(items = dataf
                    )
    })
  })
}
