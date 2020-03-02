# Birth outcomes for Texas

This is an analysis of the [Texas Inpatient Public Use Data File](https://www.dshs.texas.gov/thcic/hospitals/Inpatientpudf.shtm) for a series of birth outcomes.

No raw data is made public through this project. The data is typically sold by the Texas Department of State Health Services. Details at the link above.

This analysis is by:

**CHRISTIAN MCDONALD**\
Assistant Professor of Practice\
School of Journalism\
Moody College ofCommunication\
TheUniversity of Texas at Austin

## Notebooks

### Data processing notebooks

- [00-process-lists](https://utdata.github.io/thcic-pudf/00-process-lists.html) defines various lists of codes and columns used within other notebooks.
- [01-process-ahrq-del-loop](https://utdata.github.io/thcic-pudf/01-process-ahrq-del-loop.html) is the method used to find all uncomplicated deliveries from the raw THCIC files.
- [01-process-ahrq-del-test](https://utdata.github.io/thcic-pudf/01-process-ahrq-del-test.html) shows the processing logic in more detail using test data.
- [01-process-ahrq-del-compare](https://utdata.github.io/thcic-pudf/01-process-ahrq-del-compare.html) compares the results of the loop script to the test script when both are processed using test data.

### Primary Cesareans study

- [02-analyze-pcsec](https://utdata.github.io/thcic-pudf/02-analyze-pcsec.html) is an analysis of Primary Cesarean rates vs all uncomplicated births statewide and for Laredo hospitals.

### Episiotomy study

- [02-analyze-episiotomy](https://utdata.github.io/thcic-pudf/02-analyze-episiotomy.html) is an analysis of episiotomy procedures statewide and for Laredo hospitals.


