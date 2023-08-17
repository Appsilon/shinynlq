#' @importFrom rlang list2
#' @importFrom purrr imap
#' @importFrom shiny tags
#' @export
nlq_container <- function(...) {
  tags$text(..., class = "human-readable-filters")
}
