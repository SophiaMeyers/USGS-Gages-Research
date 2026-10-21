
data <- readRDS("C:/Users/sophi/Documents/GitHub/USGS-Gages-Research/data/raw/active_flow_gages_summary_wy.rds")

collapse_list <- function(x) {
  if (is.null(x) || length(x) == 0 || all(is.na(x))) {
    return(NA_character_)
  }
  paste(x[!is.na(x)], collapse = ";")
}

data$which_years_active <- vapply(
  data$which_years_active, collapse_list, character(1)
)

data$gap_years <- vapply(
  data$gap_years, collapse_list, character(1)
)

write.csv(data, "C:/Users/sophi/Documents/GitHub/USGS-Gages-Research/data/intermediate/active_flow_gages_summary_wy.csv", row.names = FALSE)
cat("Exported rows:", nrow(data), "\\n")
cat("Exported columns:", ncol(data), "\\n")
