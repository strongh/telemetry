

The telemetry package provides Shiny inputs which produce user data which is accessible from the browser. Examples include:

+ orientation (`orientationInput`),
+ acceleration (`motionInput`), and
+ geographical coordinates (`coordinatesInput`).

## Examples

Example usage can be found in the examples directory. These could be run by cloning this repo and then running locally, or by running something like

```r
shiny::runGitHub("telemetry", "strongh",
                 subdir="examples/orientation_example/")
```

## Shinapp.io example

Navigating to 

https://strong.shinyapps.io/motion_example/

on a mobile device should give a silly preview of the motion input. The accelerometer data is sent to the server, which plots it somehow.

## Installation

```r
devtools::install_github('strongh/telemetry')
```
