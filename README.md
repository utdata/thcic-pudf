# Birth outcomes for Texas

This is an analysis of the [Texas Inpatient Public Use Data File](https://www.dshs.texas.gov/thcic/hospitals/Inpatientpudf.shtm) for a series of birth outcomes.

No data raw is made public through this project. The data is typically sold by the Texas Department of State Health Services. Details at the link above.

This analysis is by:

**CHRISTIAN MCDONALD**\
Assistant Professor of Practice\
School of Journalism\
Moody College ofCommunication\
TheUniversity of Texas at Austin

## Notebooks

### Data processing notebooks

- [01-process-loop](https://utdata.github.io/thcic-pudf/01-process-loop.html) is the method used to find all uncomplicated deliveries
- [01-t1-process-test](https://utdata.github.io/thcic-pudf/01-t1-process-test.html) shows the processing logic in more detail using test data.
- [01-t2-process-compare](https://utdata.github.io/thcic-pudf/01-t2-process-compare.html) compares the results of the loop script to the test script when both are processed using test data.

### Primary Cesareans study

- [02-analyze-pcsec](https://utdata.github.io/thcic-pudf/02-analyze-pcsec.html) is the analysis of _primary_ cesareans vs all uncomplicated births.
- [03-viz-pcrate](https://utdata.github.io/thcic-pudf/03-viz-pcrate.html) is an interactive table of the Primary Cesarean rates for a three-year period, 2016-2018.

### Episiotomy study

- [02-analyze-episiotomy](https://utdata.github.io/thcic-pudf/02-analyze-episiotomy.html)

### All Cesareans study

- [02-analyze-csec](https://utdata.github.io/thcic-pudf/02-analyze-csec.html) is the analysis of Cesareans vs all uncomplicated births.
- [03-viz-crate](https://utdata.github.io/thcic-pudf/03-viz-crate.html) is an interactive table of the Cesarean rates for a three-year period, 2016-2018.

### Other notebooks

- [99-explore-other](https://utdata.github.io/thcic-pudf/99-explore-other.html)
- [99-mutate-challenge](https://utdata.github.io/thcic-pudf/99-mutate-challenge.html)
