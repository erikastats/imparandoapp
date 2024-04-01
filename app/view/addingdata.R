# app/view/addingdata.R

box::use(
  shiny[div, moduleServer, NS, renderUI, uiOutput, actionButton,
        observeEvent,reactiveVal, reactive],
  shiny.fluent[DetailsList, fluentSalesDeals],
  tibble[tibble],
  dplyr[bind_rows],

)

box::use(app/view/tema,
         app/view/argomento,
         app/view/sottoargomento,
         app/view/paginaweb,
         app/view/numeropersone,
         app/view/datatable,
         app/view/linea)


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
    actionButton(ns("action"), label = "Aggiungi alla tabella")
  )
}

#' @export
server <- function(id){
  moduleServer(id, function(input, output, session) {
    ns <- NS(id)
    dataf <- data.frame(Tema = "teste",
                       Argomento = "teste",
                       Sottoargomento = "teste",
                       Paginaweb = "teste",
                       Personachiparla = 0,
                       Numerepersone = 0,
                       Linea = "teste")

    tema_value <- reactiveVal(tema$server(ns("tema_id")))
    argomento_value <- reactiveVal(argomento$server(ns("argomento_id")))
    sottoargomento_value <- reactiveVal(sottoargomento$server(ns("sottoargomento_id")))
    paginaweb_value <- reactiveVal(paginaweb$server(ns("paginaweb_id")))
    numeropersone_value <- reactiveVal(numeropersone$server(ns("numeropersone_id")))
    linea_values <- reactiveVal(linea$server(ns("linead_id")))

    update_data <- reactiveVal(dataf)

    observeEvent(input$action, {
      new_data = data.frame(Tema = tema_value(),
                          Argomento = argomento_value(),
                          Sottoargomento = sottoargomento_value(),
                          Paginaweb = paginaweb_value(),
                          Numerepersone = numeropersone_value(),
                          Linea = linea_values())
      new_df = update_data() |>
        bind_rows(new_data)
      update_data(new_df)
    })
    # output$value <- renderText({ updated_value()})

    return(update_data())


  })
}


