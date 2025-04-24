#' Prepare survival analysis data from ADSL and ADTTE
#'
#' @param adsl A data frame containing ADSL data
#' @param adtte A data frame containing ADTTE data
#' @param paramcd Parameter code to filter in ADTTE (default: "OS")
#'
#' @return A merged data frame ready for survival::Surv()
#' @export
prepare_surv_data <- function(adsl, adtte, paramcd = "OS") {
  check_adtte_format(adtte)

  adtte_filt <- adtte[adtte$PARAMCD == paramcd, ]
  if (nrow(adtte_filt) == 0) stop("No records found for PARAMCD = ", paramcd)

  # Create time and status
  adtte_filt$time <- adtte_filt$AVAL
  adtte_filt$status <- 1 - adtte_filt$CNSR  # convert: 0=censor, 1=event

  # Merge
  df <- merge(adsl, adtte_filt[, c("USUBJID", "time", "status")], by = "USUBJID")
  return(df)
}
