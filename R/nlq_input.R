#' @importFrom htmltools htmlDependency attachDependencies
#' @importFrom purrr map
#' @importFrom digest digest
#' @importFrom bslib bs_dependency_defer bs_dependency is_bs_theme
#' @importFrom sass sass_file
#' @importFrom shiny div tags tagAppendAttributes
#'
#' @export
nlq_input <- function(inputId, choices) {
  check_string(inputId)
  check_character(choices)

  selected <- choices[1]

  input <-  tags$span(
    id = inputId,
    class = "nlq-dropdown-button p-0 pe-auto",
    type = "button",
    `data-bs-toggle` = "dropdown",
    `aria-expanded` = "false",
    `data-state` = selected,
    selected
  )

  form <- tags$span(
    class = "nlq-dropdown",
    input,
    tags$ul(
      `aria-labelledby` = inputId,
      class = "dropdown-menu",
      map(choices, function(choice) {
        tags$li(
          tags$a(
            class = "dropdown-item",
            class = if (choice == selected) "item_selected",
            type = "button",
            `data-state` = choice,
            choice
          )
        )
      })
    ),
    bs_dependency_defer(nlq_style_dependeny)
  )

  deps <- htmlDependency(
    name = "nlqInput.js",
    version = "0.0.1",
    src = c(file = system.file(package = "shinynlq")),
    script = "nlq_bindings.js"
  )

  attachDependencies(form, deps)
}

nlq_style_dependeny <- function(theme) {
  name <- "nlqInput.css"
  version <- "0.0.1"

  if (is_bs_theme(theme)) {
    scss <- system.file(package = "shinynlq", "nlq.scss")
    bs_dependency(
      input = sass_file(scss),
      theme = theme,
      name = name,
      version = version
    )
  } else {
    htmlDependency(
      name = name,
      version = version,
      src = c(file = system.file(package = "shinynlq")),
      stylesheet = "nlq.css"
    )
  }
}
