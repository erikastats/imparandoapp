# app/main.R

box::use(
  shiny[ moduleServer, NS, span],
  shiny.fluent[fluentPage, Stack, Text]
)

box::use(app/view/tema,
         app/view/argomento,
         app/view/sottoargomento,
         app/view/paginaweb,
         app/view/numeropersone,
         app/view/dataset
         app/view/linea)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    Text("Registrazione dei dati", variant = "xxLarge"),
    Stack(
      horizontal = TRUE,
      span(class= "ms-depth-8", tema$ui(ns("tema_id"))),
      span(class= "ms-depth-8", argomento$ui(ns("argomento_id"))),
      span(class= "ms-depth-8", sottoargomento$ui(ns("sottoargomento_id")))
    ),
    Stack(
      horizontal = TRUE,
      span(class= "ms-depth-8", paginaweb$ui(ns("paginaweb_id"))),
      span(class= "ms-depth-8", numeropersone$ui(ns("numeropersone_id"))),
      span(linea$ui(ns("linead_id")))
    ),
    Stack(
      horizontal = TRUE,

    )
  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    tema$server("tema_id")
    argomento$server("argomento_id")
    sottoargomento$server("sottoargomento_id")
    paginaweb$server("paginaweb_id")
    numeropersone$server("numeropersone_id")

    linea$server("linead_id")
  })
}
