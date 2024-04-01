# app/main.R

box::use(
  shiny[ moduleServer, NS, span, reactiveVal],
  shiny.fluent[fluentPage, Stack, Text]
)

box::use(app/view/tema,
         app/view/argomento,
         app/view/sottoargomento,
         app/view/paginaweb,
         app/view/numeropersone,
         app/view/datatable,
         app/view/linea,
         app/view/addingdata)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    Text("Registrazione dei dati", variant = "xxLarge"),
    Stack(
      horizontal = TRUE,
      # Stack(horizontal)
      span(class= "ms-depth-8", tema$ui(ns("tema_id"))),
      span(class= "ms-depth-8", argomento$ui(ns("argomento_id"))),
      span(class= "ms-depth-8", sottoargomento$ui(ns("sottoargomento_id")))
    ),
    Stack(
      horizontal = TRUE,
      span(class= "ms-depth-8", paginaweb$ui(ns("paginaweb_id"))),
      span(class= "ms-depth-8", numeropersone$ui(ns("numeropersone_id"))),
      span(class= "ms-depth-8", linea$ui(ns("linead_id")))
    ),
    Stack(
      horizontal = TRUE,
      span(addingdata$ui(ns("addingdata_id"))),
      span(class= "ms-depth-8" ,datatable$ui(ns("datatable")))
    )
  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {


    data <- reactiveVal(addingdata$server("addingdata_id"))


    datatable$server("datatable", data())
  })
}
