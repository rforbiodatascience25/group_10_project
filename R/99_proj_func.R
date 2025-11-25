get_unique_counts <- function(data, column_name) {
  data |>
    count(.data[[column_name]])
}


fix_resistance <- function(x) {
  case_when(
    x == "r" ~ "R",
    x == "s" ~ "S",
    x %in% c("i", "Intermediate") ~ "I",
    TRUE ~ x
  )
}


count_resistance <- function(x) {
  case_when(
    x == "R" ~ 1,
    x == "I" ~ 0.5,
    x == "S" ~ 0
  )
}

save_png <- function(plot, filename, width = 10, height = 8, dpi = 300) {
  ggsave(
    filename = filename,
    plot     = plot,
    width    = width,
    height   = height,
    dpi      = dpi
  )
}