---
output:
  html_document:
    df_print: paged
knit: (function(inputFile, encoding) { rmarkdown::render(
    inputFile,
    encoding = encoding,
    output_dir = "docs",
    output_file='interactive.html'
  ) })
---

# Data for interactives

<img src="resources/thcic_mockup_marked.png">

The purpose of this file is to identify different data points for interactives.

> Notes: All hosp_sums_2019 values are == THCIC_ID.I could remove other years from the summary_data, if you wish.

- 1: hosp_sums_2019[PROVIDER_NAME]
- 2: hosp_sums_2019[PROVIDER_CITY]
- 3: hosp_sums_2019[ECRATE]
- 4: hosp_sums_2019[DELSPERWK] (Phrase should not display if value missing)
- 5: hosp_sums_2019[MCRATE]
- 6: summary_data[VALUE] (YR == 2019, SUMMARY == TX, CATEGORY == MEDICAID, MEASUREMENT == RATE)
- 7: ??
- 8y: lf_epi_rate_hosp_yr[EPIRATE] (Match YR, THCIC_ID). **I could remove other values?**
- 9y: ahrq_pcsec_rate_hosp_yr[PCRATE] (Match YR, THCIC_ID).  **I could remove other values?**
- 10: summary_data[VALUE] (YR == 2019, SUMMARY == TX, CATEGORY == EPISIOTOMY, MEASUREMENT == RATE)
- 11: summary_data[VALUE] (YR == 2019, SUMMARY == TX, CATEGORY == PRIMARY_CESAREAN, MEASUREMENT == RATE)
- 12: hosp_sums_2019[PROVIDER_NAME]
- 13: hosp_sums_2019[ERATE] (This is 2019 rate all deliveries)
- 14: hosp_sums_2019[CRATE] (This is 2019 rate all deliveries)
- 15: skipped
- 16: ???

<style>
  ul {
    margin-left: -25px;
    list-style-type: square;
  }
  img {
    width: 50%;
    float:right;
    margin-left:30px;
  }
</style>
