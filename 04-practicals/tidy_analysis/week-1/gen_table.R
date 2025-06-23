library(kableExtra)
library(tidyverse)
library(knitr)

dplyr::tibble(
  Students = c("Observed Grade", "Expected Grade", "${\\chi}^2$"),
  `James` = c(72, 85, 56),
  `Nuel` = c(67,85, 76),
  `Janet` = c(88, 85, 56)
)  %>% kbl() %>% kable_classic(full_width = F) %>%
  save_kable("images/chi_table.png")
