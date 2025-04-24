#' Simulate ADSL dataset (mock CDISC)
#'
#' @param n Number of subjects
#' @return A data frame with simulated ADSL variables
#' @export
simulate_adsl <- function(n = 10) {
  data.frame(
    USUBJID = paste0("SUBJ", sprintf("%03d", 1:n)),
    AGE = sample(50:80, n, replace = TRUE),
    SEX = sample(c("M", "F"), n, replace = TRUE),
    TRTP = sample(c("Treatment", "Placebo"), n, replace = TRUE),
    IMMFL = sample(c("Y", "N"), n, replace = TRUE),
    stringsAsFactors = FALSE
  )
}

#' Simulate ADTTE dataset (mock CDISC)
#'
#' @param n Number of rows
#' @param paramcd PARAMCD value (e.g., "OS")
#' @return A data frame with simulated ADTTE variables
#' @export
simulate_adtte <- function(n = 10, paramcd = "OS") {
  data.frame(
    USUBJID = paste0("SUBJ", sprintf("%03d", 1:n)),
    PARAMCD = paramcd,
    PARAM = ifelse(paramcd == "OS", "Overall Survival", "Other Endpoint"),
    AVAL = round(runif(n, 5, 30), 1),  # Time to event or censoring
    CNSR = sample(0:1, n, replace = TRUE, prob = c(0.7, 0.3)),  # 0 = event
    EVNTDESC = sample(c("Death", "Lost to Follow-up", "Progression"), n, replace = TRUE),
    stringsAsFactors = FALSE
  )
}

