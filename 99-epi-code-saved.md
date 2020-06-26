# Saved code from episiotomy

This was pulled from 02-analysis-episiotomy.Rmd

the thought is why look at doctors for just vaginal deliveries? I should be looking again all deliveries, which I can do in the 02-analysis-deliveries workbook.


## A look at doctors

These views are all of vaginal deliveries only. See 02-analysis-deliveries for a look against all deliveries.

Before looking at individual doctor counts, I need to ensure anonymity for them. The challenge is to provide useful information while staying within the allowances of data use.

### Doctor suppression

Before looking at these rates it should be known that in some cases the ATTENDING_PHYSICIAN was suppressed in the data. This means multiple unknown physicians could be grouped as a single doctor in a given quarter. The number of records affected is small, but so is the actual number of physicians at these hospitals.

These suppression rates are just for this data set of **vaginal deliveries in Laredo**.

```{r docs_supp_laredo}
suppressed = c("9999999998", "9999999999")

lf_epi %>% 
  filter(str_detect(PROVIDER_NAME, "Laredo")) %>%
  mutate(
    DOC_SUPPRESSED = if_else(ATTENDING_PHYSICIAN_UNIF_ID %in% suppressed, T, F)
  ) %>% 
  tabyl(DOC_SUPPRESSED, PROVIDER_NAME) %>% 
  adorn_percentages("col") %>%
  adorn_pct_formatting(digits = 2) %>%
  adorn_ns()
```

## Doctors performing vaginal deliveries in Laredo

Includes doctors who IDs were suppressed and therefore combined.

```{r deliveries_docs_laredo}
lf_epi %>% 
  filter(str_detect(PROVIDER_NAME, "Laredo")) %>%
  group_by(PROVIDER_NAME) %>% 
  summarize(
    DELIVERIES = n(),
    PHYSICIANS = n_distinct(ATTENDING_PHYSICIAN_UNIF_ID)
    ) %>% 
  mutate(
    RATE = round(DELIVERIES/PHYSICIANS, 1)
  ) %>% 
  arrange(RATE %>% desc())
```

### Chart: Count of doctors performing vaginal deliveries at each hospital, by year

```{r deliveries_docs_laredo_yr_plot}
lf_epi %>% 
  filter(str_detect(PROVIDER_NAME, "Laredo")) %>%
  distinct(YR,PROVIDER_NAME, ATTENDING_PHYSICIAN_UNIF_ID) %>% 
  count(YR, PROVIDER_NAME) %>% 
  rename(
    ATTEND_DOCS = n
    ) %>% 
  ggplot(aes(YR, ATTEND_DOCS)) +
  geom_line(aes(group = PROVIDER_NAME, color = PROVIDER_NAME)) +
  expand_limits(y = c(0,30)) +
  theme(legend.position="bottom", legend.box = "vertical") +
  labs(title = "Count of doctors attending deliveries, Laredo hospitals", x = "Year", y = "# of doctors")
```

### Table: Count of doctors performing vaginal deliveries at each hospital

```{r deliveries_docs_laredo_yr}
lf_epi %>% 
  filter(str_detect(PROVIDER_NAME, "Laredo")) %>%
  distinct(YR,PROVIDER_NAME, ATTENDING_PHYSICIAN_UNIF_ID) %>% 
  count(YR, PROVIDER_NAME) %>% 
  rename(
    ATTEND_DOCS = n
  ) %>% 
  pivot_wider(names_from = YR, values_from = ATTEND_DOCS)
```



--------------

from before

Need to make sure that displaying doctor IDs won't make them identifiable.


### Episiotomy rates doctor in Laredo

Vaginal deliveries vs episiotomies for all years combined, with rate. Doctors with fewer than 10 vaginal deliveries over the full time period are excluded. Some doctors have delivered at both hospitals.

```{r}
del_epi_lar %>% 
  group_by(ATTENDING_PHYSICIAN_UNIF_ID, EPI) %>%
  summarise(CNT = n()) %>%
  pivot_wider(names_from = EPI, values_from = CNT) %>%
  rename(
    EPIF = "FALSE",
    EPIT = "TRUE"
  ) %>%
  mutate(
    TOTAL = EPIF + EPIT,
    EPIRATE = round((EPIT / TOTAL) * 100,1)
  ) %>% 
  filter(TOTAL > 10) %>% 
  arrange(EPIRATE %>% desc()) %>% 
  datatable()
```



### Procedures totals by doctor by year

Not the best way to look at this, but this is a list of Laredo doctors and the number of vaginal deliveries and episiotomies by year.

```{r}
del_epi_lar_doc_yr <- del_epi_lar %>% 
  group_by(YR, ATTENDING_PHYSICIAN_UNIF_ID, EPI) %>%
  summarise(CNT = n()) %>%
  pivot_wider(names_from = EPI, values_from = CNT) %>%
  rename(
    EPIF = "FALSE",
    EPIT = "TRUE"
  ) %>%
  mutate(
    TOTAL = EPIF + EPIT,
    EPIRATE = round((EPIT / TOTAL) * 100,1)
  ) %>% 
  arrange(ATTENDING_PHYSICIAN_UNIF_ID, YR)

del_epi_lar_doc_yr %>% datatable()
```

