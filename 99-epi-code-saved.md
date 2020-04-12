# Saved code from episiotomy

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

