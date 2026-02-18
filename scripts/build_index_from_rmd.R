#!/usr/bin/env Rscript

suppressPackageStartupMessages({
  library(rmarkdown)
})

input_file <- "air-quality-modeling-research-2025.Rmd"
output_file <- "index.md"

rmarkdown::render(
  input = input_file,
  output_format = "github_document",
  output_file = output_file,
  output_options = list(html_preview = FALSE),
  encoding = "UTF-8",
  clean = TRUE
)

contact_section <- c(
  "## Contact",
  "Nikolai Len",
  "👤 [LinkedIn](https://www.linkedin.com/in/niklen/)"
)

lines <- readLines(output_file, warn = FALSE, encoding = "UTF-8")

if (!any(grepl("^## Contact\\s*$", lines))) {
  lines <- c(lines, "", contact_section, "")
  writeLines(lines, output_file, useBytes = TRUE)
}
