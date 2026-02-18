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

header_block <- c(
  "Data ScienceTech Institute, 2025",
  "Author: Nikolai Len"
)

contact_section <- c(
  "## Contact",
  "Nikolai Len",
  "👤 [LinkedIn](https://www.linkedin.com/in/niklen/)"
)

lines <- readLines(output_file, warn = FALSE, encoding = "UTF-8")

# Ensure the report header contains institute + author lines under the title.
if (length(lines) >= 2 && grepl("^=+$", trimws(lines[2]))) {
  cursor <- 3
  while (cursor <= length(lines) && nzchar(trimws(lines[cursor]))) {
    cursor <- cursor + 1
  }
  while (cursor <= length(lines) && !nzchar(trimws(lines[cursor]))) {
    cursor <- cursor + 1
  }
  remainder <- if (cursor <= length(lines)) lines[cursor:length(lines)] else character()
  lines <- c(lines[1:2], header_block, "", remainder)
}

# Normalize contact block: keep exactly one at the end.
contact_index <- grep("^## Contact\\s*$", lines)
if (length(contact_index) > 0) {
  if (contact_index[1] > 1) {
    lines <- lines[1:(contact_index[1] - 1)]
  } else {
    lines <- character()
  }
}

while (length(lines) > 0 && !nzchar(trimws(lines[length(lines)]))) {
  lines <- lines[-length(lines)]
}

lines <- c(lines, "", contact_section, "")
writeLines(lines, output_file, useBytes = TRUE)
