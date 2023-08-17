# shinynlq

Natural language queries for shiny as a `bslib` [custom component](https://rstudio.github.io/bslib/articles/custom-components/index.html). 

- Needs bootstrap v5.

Install:

```r
remotes::install_github("alexverse/shinynlq")
```

Example:

```r
library(shiny)
library(shinynlq)

ui <- bslib::page(
  nlq_container(
    "My name is",
    nlq_input("nlq_1", c("Max", "Elizabeth")),
    "and picked",
    nlq_input("nlq_2", letters)
  ),
  textOutput("text")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  bslib::bs_themer()
  output$text <- renderText({
    paste(input$nlq_1, "picked", input$nlq_2)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
```
