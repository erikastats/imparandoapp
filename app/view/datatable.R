#app/view/datatable

box::use(
  shiny[div, moduleServer, NS, renderUI, uiOutput],
  shiny.fluent[DetailsList, fluentSalesDeals],
  tibble[tibble]
)

# dataf <- data.frame(Tema = "teste",
#                    Argomento = "teste",
#                    Sottoargomento = "teste",
#                    Paginaweb = "teste",
#                    Personachiparla = 0,
#                    Linea = "teste")

columns <- tibble(
  fieldName = c("Tema", "Argomento", "Sottoargomento", "Paginaweb",
                "Personachiparla", "Linea"),
  name = c("Tema", "Argomento", "Sottoargomento", "Paginaweb",
           "Personachiparla", "Linea")
)

#' @export
ui <- function(id){
  ns <- NS(id)
  div(
    uiOutput(ns("datatable"))
  )
}

#' @export
server <- function(id, data){
  moduleServer(id, function(input, output, session) {
    # dataf <- data.frame(Tema = "teste",
    #                    Argomento = "teste",
    #                    Sottoargomento = "teste",
    #                    Paginaweb = "teste",
    #                    Personachiparla = 0,
    #                    Linea = "teste")
    output$datatable <- renderUI({
      DetailsList(items = data(), columns = columns  )
    })
  })
}
