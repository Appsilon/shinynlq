#' runExample
#'
#' Run examples from the `inst` directory
#'
#' @param example String with the name of the app to run from inst/ directory.
#' @return shiny app
#' @importFrom shiny runApp
#' @importFrom rlang arg_match
#' @export
#'
#' @examples
#' \dontrun{
#' runExample()
#' }
#'
runExample <- function() {
  appDir <- system.file("shiny_examples", package = "shinynlq")

  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `shinynlq`.", call. = FALSE)
  }

  runApp(appDir, display.mode = "normal")
}
