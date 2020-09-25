---
output:
  html_document:
    df_print: paged
knit: (function(inputFile, encoding) { rmarkdown::render(
    inputFile,
    encoding = encoding,
    output_dir = "docs",
    output_file='index.html'
  ) })
---

# Birth outcomes for Texas

> This repo is not yet public though some knitted workbooks are. I'll make public once we are all ready.

This is an analysis for a series of birth outcomes. The data used is the [Texas Hospital Inpatient Discharge Public Use Data File](https://www.dshs.texas.gov/thcic/hospitals/Inpatientpudf.shtm), [1q2016 - 4q2019]. Texas Department of State Health Services, Center for Health Statistics, Austin, Texas.

No raw data is made public through this project. The data is typically sold by the Texas Department of State Health Services. Details at the link above. This analysis uses files for discharges from 2016 to 2019, though some discharges for the fourth quarter of 2019 may not be included because of allowed reporting delays.

No patients or doctors have been revealed in the data or analysis. Suppressions have been applied for smaller aggregations to protect privacy.

This analysis is by:

**CHRISTIAN MCDONALD**, Assistant Professor of Practice\
School of Journalism, Moody College ofCommunication\
The University of Texas at Austin

## Methodology

- [The methodology](https://utdata.github.io/thcic-pudf/methodology.html) of the measures and calculations used in the analysis.

## Notebooks

### Primary Cesareans study

- [02-analysis-pcsec](https://utdata.github.io/thcic-pudf/02-analysis-pcsec.html) is an analysis of Primary Cesarean rates vs all uncomplicated births statewide and for Laredo hospitals.

### Vaginal Births after Cesarean study

- [02-analysis-vbac](https://utdata.github.io/thcic-pudf/02-analysis-vbac.html) is an analysis of Vaginal births after Ceseareans by hospital.

### Episiotomy study

- [02-analysis-episiotomy](https://utdata.github.io/thcic-pudf/02-analysis-episiotomy.html) is an analysis of episiotomy procedures statewide and for Laredo hospitals.

### Deliveries study

- [02-analysis-deliveries](https://utdata.github.io/thcic-pudf/02-analysis-deliveries.html) looks at overall delivery rates at hospitals, including simple rates for Cesarean and episiotomies.

### Summaries

- [03-analysis-summaries](https://utdata.github.io/thcic-pudf/03-analysis-summaries.html) gives statewide rates and by-hospital averages by year for our key measures.


## Data processing notebooks

- [00-process-lists](https://utdata.github.io/thcic-pudf/00-process-lists.html) defines various lists of codes and columns used within other notebooks.
- [0101-process-ahrq-del-loop](https://utdata.github.io/thcic-pudf/0101-process-ahrq-del-loop.html) is the method used to find all deliveries from the raw THCIC files.
- [0101-process-ahrq-del-test](https://utdata.github.io/thcic-pudf/0101-process-ahrq-del-test.html) shows the processing logic in more detail using test data.
- [0102-process-ahrq-del-compare](https://utdata.github.io/thcic-pudf/0102-process-ahrq-del-compare.html) compares the results of the loop script to the test script when both are processed using test data.
- [0101-process-lf-epi-loop](https://utdata.github.io/thcic-pudf/0101-process-lf-epi-loop.html) is the method used to capture vaginal births using Leapfrog's methods.
- [0101-process-lf-epi-test](https://utdata.github.io/thcic-pudf/0101-process-lf-epi-test.html) shows the processing logic in more detail using test data.
- [0102-process-providers](https://utdata.github.io/thcic-pudf/0102-process-providers.html) creates a list of the most recent names for hospitals to assist analysis. Can't be run until the deliveries data is generated.

## Exports

A series of aggregated data that may prove useful. In the `exports/` folder:

- [Interactive Data Matrix](https://utdata.github.io/thcic-pudf/interactive.html) maps specific files/data to the mockup.

### From 02-analysis-pcsec

- ahrq_pcsec_rate_county_yr: (Primary cesarean rates for uncomplicated deliveries by patient county.) Grouped by PAT_COUNTY, COUNTY. Aggregations are NPCSEC_CNT (Count not primary Cesarean), PCSEC_CNT (Count primary Cesarean), TOTAL, PCRATE (Primary Cesarean rate).

### From 02-analysis-episiotomy

- lf_epi_rate_county_yr: (Episiotomy rates for uncomplicated deliveries by patient county.) Grouped by YR, PAT_COUNTY, COUNTY. Aggregations are EPIF (Count Epi False), EPIT (Count Epi True), TOTAL (Count of all vaginal deliveries), EPIRATE.

### From 02-analysis-deliveries

- blurbs_2019.json: Data: Hospital, birth per doc rate (weekly), Medicaid percentage, Maternal level.

### From 03-analysis-summaries

- table_2019.csv: Data: Hospital, location, episiotomy and primary cesarean rates for 2019 (or more the most up-to-date data available)
- chart_date.json: Data: Year, ID, Hospital, episiotomy and primary cesarean rates.
- summary_data: Summary data for the major categories.

### From 0102-process-providers

- providers_export: Names and addresses of hospitals in the analysis.

## Notes

There was a data correction sent out 2020-08-14 to replace some fields for some records in the `PUDF_base1_3Q2019_tab.txt` data file. The replacement file is in data-raw, but not yet applied because we are not using the fields noted, `TOTAL_CHARGES` and `TOTAL_CHARGES_ACCOMM`. If that changes, I'll need to update them.

## Music to get you through it

A good portion of this project was made possible through [Iron Maiden Radio](https://www.pandora.com/station/play/847050113183194133) on Pandora.
