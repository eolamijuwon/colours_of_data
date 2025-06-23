set.seed(404)
men_data <- read.dta13("data/men.dta") %>% 
  mutate (mv191_der = rnorm(nrow(.), 0, 1)) %>% 
  mutate (mv191_der = (mv191_der - min(mv191_der))/(max(mv191_der) - min(mv191_der)))

set.seed(404)
women_data <- read.dta13("data/women.dta") %>% 
  mutate (v191_der = rnorm(nrow(.), 0, 1)) %>% 
  mutate (v191_der = (v191_der - min(v191_der))/(max(v191_der) - min(v191_der)))

readstata13::save.dta13(men_data, "data/men_ind.dta")
readstata13::save.dta13(women_data, "data/women_ind.dta")
