#app/view/tema.R

box::use(
  shiny[h3, moduleServer, NS]
)

#' @export
ui <- function(id){
  ns <- NS(id)
  
  h3("Registrazione dei dati")
}

#' @export
server <- function(id){
  moduleServer(id, fucntion(input, output, session){
    print("Chart module server part works!")
  })
}