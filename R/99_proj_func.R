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

plot_bar <- function(data, x_var, title) {
  
  x_var <- rlang::enquo(x_var)
  
  ggplot(data, aes(x = !!x_var, fill = !!x_var)) +
    geom_bar(stat = "count", color = "black") +
    labs(
      y = "Count",
      title = title
    ) +
    theme(
      plot.title = element_text(hjust = 0.5, size = 16),
      axis.text.x = element_text(hjust = 1, size = 10),
      axis.title.x = element_blank(),
      axis.title.y = element_text(size = 14),
      legend.position = "none"
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