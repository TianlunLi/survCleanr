#' Check required fields in ADTTE
#'
#' @param adtte A data frame of ADTTE
#' @return TRUE if all required fields are present, otherwise stop with message
#' @export
check_adtte_format <- function(adtte) {
  required_vars <- c("USUBJID", "PARAMCD", "AVAL", "CNSR")
  missing <- setdiff(required_vars, names(adtte))
  if (length(missing) > 0) {
    stop(paste("Missing required variable(s):", paste(missing, collapse = ", ")))
  }
  TRUE
}
