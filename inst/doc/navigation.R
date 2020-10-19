## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(keys)
library(shiny)

## ----ui definition------------------------------------------------------------
ui <- fluidPage(
  useKeys(),
  keysInput("keys", c("1", "2", "3")),
  tabsetPanel(
    id = "tabs",
    tabPanel("Tab 1", "We're on tab 1"),
    tabPanel("Tab 2", "We're on tab 2"),
    tabPanel("Tab 3", "We're on tab 3")
  )
)

## ----server logic-------------------------------------------------------------
server <- function(input, output, session) {
  observeEvent(input$keys, {
    switch (input$keys,
      "1" = updateTabsetPanel(session, "tabs", "Tab 1"),
      "2" = updateTabsetPanel(session, "tabs", "Tab 2"),
      "3" = updateTabsetPanel(session, "tabs", "Tab 3")
    )
  })
}

## ----ui definition with tab values, eval=FALSE--------------------------------
#  tabPanel("Tab 1", "We're on tab 1", value = "1")
#  tabPanel("Tab 2", "We're on tab 2", value = "2")
#  tabPanel("Tab 3", "We're on tab 3", value = "3")

## ----simplified server, eval=FALSE--------------------------------------------
#  observeEvent(input$keys, {
#    updateTabsetPanel(session, "tabs", input$keys)
#  })

## ----full scripts, eval=FALSE-------------------------------------------------
#  # without tab values assigned
#  library(keys)
#  library(shiny)
#  
#  ui <- fluidPage(
#    useKeys(),
#    keysInput("keys", c("1", "2", "3")),
#    tabsetPanel(
#      id = "tabs",
#      tabPanel("Tab 1", "We're on tab 1"),
#      tabPanel("Tab 2", "We're on tab 2"),
#      tabPanel("Tab 3", "We're on tab 3")
#    )
#  )
#  
#  server <- function(input, output, session) {
#    observeEvent(input$keys, {
#      switch (input$keys,
#        "1" = updateTabsetPanel(session, "tabs", "Tab 1"),
#        "2" = updateTabsetPanel(session, "tabs", "Tab 2"),
#        "3" = updateTabsetPanel(session, "tabs", "Tab 3")
#      )
#    })
#  }
#  
#  shinyApp(ui, server)
#  
#  # with tab values assigned
#  library(keys)
#  library(shiny)
#  
#  ui <- fluidPage(
#    useKeys(),
#    keysInput("keys", c("1", "2", "3")),
#    tabsetPanel(
#      id = "tabs",
#      tabPanel("Tab 1", "We're on tab 1", value = "1"),
#      tabPanel("Tab 2", "We're on tab 2", value = "2"),
#      tabPanel("Tab 3", "We're on tab 3", value = "3")
#    )
#  )
#  
#  server <- function(input, output, session) {
#    observeEvent(input$keys, {
#      updateTabsetPanel(session, "tabs", input$keys)
#    })
#  }
#  
#  shinyApp(ui, server)

