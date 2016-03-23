#' @export
coordinatesInput <- function(inputId) {

  shiny::registerInputHandler("telemetry.coordinatesWidget",
                              function(data, ...) {
                                data
                              }, force = TRUE)
  require(htmltools)
  deps <- htmlDependency("telemetry", "0.0.1",
                 src=system.file(package = "telemetry"),
                 script="js/coordinates_inputs.js")
  tgs <- tagList(
    tag("input", list(type="hidden", class="coordinates", id=inputId))
  )
  attachDependencies(tgs, deps)
}


#' @export
motionInput <- function(inputId) {
  shiny::registerInputHandler("telemetry.motionWidget",
                              function(data, ...) {
                                data
                              }, force = TRUE)
  require(htmltools)
  deps <- htmlDependency("telemetry.motion", "0.0.1",
                         src=system.file(package = "telemetry"),
                         script="js/motion_inputs.js")
  tgs <- tagList(
    tag("input", list(type="hidden", class="motion", id=inputId))
  )
  attachDependencies(tgs, deps)
}


#' @export
orientationInput <- function(inputId) {
  shiny::registerInputHandler("telemetry.orientationWidget",
                              function(data, ...) {
                                data
                              }, force = TRUE)
  require(htmltools)
  deps <- htmlDependency("telemetry.orientation", "0.0.1",
                         src=system.file(package = "telemetry"),
                         script="js/orientation_inputs.js")
  tgs <- tagList(
    tag("input", list(type="hidden", class="orientation", id=inputId))
  )
  attachDependencies(tgs, deps)
}
