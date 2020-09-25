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

# Methology used for Texas Inpatient data analysis

To accomplish the analysis behind these articles, University of Texas at Austin Assistant Professor of Practice [Christian McDonald](https://journalism.utexas.edu/faculty/christian-mcdonald) used the [Texas Inpatient Public Use Data File](https://www.dshs.texas.gov/thcic/hospitals/Inpatientpudf.shtm) provided by the [Texas Department of State Health Services](https://www.dshs.texas.gov/). The raw data was not published nor shared per the agency's rules. No patients or doctors are identified in the analysis. Only non-identifying aggregate data has been published.

The primary cesarean delivery rates referenced were calculated per the [Agency for Healthcare Research and Quality](https://www.qualityindicators.ahrq.gov/) Inpatient Quality Indicator [IQI 33 Primary Cesarean Delivery Rate, Uncomplicated](https://www.qualityindicators.ahrq.gov/Downloads/Modules/IQI/V2020/TechSpecs/IQI_33_Primary_Cesarean_Delivery_Rate_Uncomplicated.pdf). AHRQ is one of several organizations that work with the U.S. Department of Health and Human Services to ensure health care quality across the country.

Episiotomy rates referenced were calculated using [The Leapfrog Group's](https://www.leapfroggroup.org/) measure specifications from their [2020 Leapfrog Hospital Survey](https://www.leapfroggroup.org/sites/default/files/Files/2020HospitalSurvey_20200413_8.1%20%28version%201%29.pdf). The measure for episiotomies can be found on page 118.

In addition to the exclusions provided by each group for their measures, records that had missing data were excluded. At the advice of researchers at the UT System Population Health Office, we also excluded women outside typical child-bearing ages from our analysis.

All of the analysis was performed using the open-source statistical software package [R](https://cran.r-project.org/) and the code is available on [Github](https://github.com/utdata/thcic-pudf), a popular platform for sharing data and code. The RNotebooks there fully explain the methods used for each calculation used in the articles.
