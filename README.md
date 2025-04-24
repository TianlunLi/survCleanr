
# survCleanr

**Prepare CDISC-style survival data easily for analysis.**

## Installation

``` r
# Install development version from local
devtools::install("path_to/survCleanr")
```

``` r
library(survCleanr)

# Use built-in example data
data(adsl)
data(adtte)

df <- prepare_surv_data(adsl, adtte, paramcd = "OS")
head(df)
```

    ##   USUBJID AGE SEX      TRTP IMMFL time status
    ## 1 SUBJ001  61   F Treatment     Y 27.9      1
    ## 2 SUBJ002  80   M   Placebo     N 29.3      1
    ## 3 SUBJ003  69   M Treatment     Y  5.0      0
    ## 4 SUBJ004  78   F   Placebo     N 23.5      1
    ## 5 SUBJ005  57   M Treatment     N 13.9      0
    ## 6 SUBJ006  65   F Treatment     N 10.7      1
