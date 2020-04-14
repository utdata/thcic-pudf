---
output:
  html_document:
    df_print: paged
knit: (function(inputFile, encoding) { rmarkdown::render(
    inputFile,
    encoding = encoding,
    output_dir = "docs",
    output_file='methodology.html'
  ) })
---

# Methology for THCIC analysis

To accomplish the analysis behind these articles, University of Texas at Austin Assistant Professor of Practice Christian McDonald used the [Texas Inpatient Public Use Data File](https://www.dshs.texas.gov/thcic/hospitals/Inpatientpudf.shtm) provided by the [Texas Department of State Health Services](https://www.dshs.texas.gov/). The data was not shared with the Express News as per the agency's governing rules. No patients or doctors are identified in the analysis.

The primary Cesarean delivery rates referenced were calculated per the [Agency for Healthcare Research and Quality](https://www.qualityindicators.ahrq.gov/) Inpatient Quality Indicator [IQI 33 Primary Cesarean Delivery Rate, Uncomplicated](https://www.qualityindicators.ahrq.gov/Downloads/Modules/IQI/V2019/TechSpecs/IQI_33_Primary_Cesarean_Delivery_Rate_Uncomplicated.pdf). AHRQ is one of several organizations that work with the U.S. Department of Health and Human Services to ensure health care quality across the country.

Episiotomy rates referenced were calculated using [The Leapfrog Group's](https://www.leapfroggroup.org/) 2019 measure specifications for their [Leapfrog Hospital Survey](https://www.leapfroggroup.org/sites/default/files/Files/2019HospitalSurvey_20190529_v8.0%20%28version%203%29.pdf). The measure for episiotomies can be found on page 103.

In addition to the exclusions provided by each group for their measures, records that had missing data were excluded. At the advice of researchers at the UT System Population Health Office, we also excluded women outside typical child-bearing ages from our analysis.

All of the analysis was performed using the open-source statistical software package [R](https://cran.r-project.org/) and the code is available on [Github](https://github.com/utdata/thcic-pudf), a popular platform for sharing data and code. The RNotebooks there fully explain the methods used for each calculation used in the articles. The data is not published as per agency rules.



