# app/main.R

box::use(
  shiny[ moduleServer, NS, span],
  shiny.fluent[fluentPage, Stack, Text]
)

box::use(app/view/tema)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    Text("Registrazione dei dati", variant = "xxLarge"),
    Stack(
      horizontal = TRUE,
      span(class= "ms-depth-8", tema$ui(ns("tema_id")))
    )
  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    tema$server("tema_id")
  })
}
