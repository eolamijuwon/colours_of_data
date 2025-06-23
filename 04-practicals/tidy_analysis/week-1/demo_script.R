cases_death <- read.csv("https://covid19.who.int/WHO-COVID-19-global-data.csv", header=T) %>% 
  mutate(date = as.Date(Date_reported, format = "%Y-%m-%d")) %>% 
  arrange (Country, desc(date)) %>% 
  group_by(Country) %>% 
  mutate (code = 1:n()) %>% 
  filter (code == 1) %>% 
  janitor::clean_names() %>% 
  select (-c(new_deaths, new_cases, code)) %>% 
  filter (cumulative_cases != 0) %>% 
  mutate (fatality_rate = round(cumulative_deaths/cumulative_cases, 4) * 1000)


library(wbstats)
gdp_data <- wb_data("NY.GDP.PCAP.PP.CD", start_date = 2021, end_date = 2021)
pop15_data <- wb_data("SP.POP.0014.TO.ZS", start_date = 2021, end_date = 2021)
pop65_data <- wb_data("SP.POP.65UP.TO.ZS", start_date = 2021, end_date = 2021)

pop_data <- wb_data("SP.POP.TOTL", start_date = 2021, end_date = 2021)


full_arch <- gdp_data %>% 
              select (country_code = iso2c, 
                      gdp = `NY.GDP.PCAP.PP.CD`) %>% 
              left_join(.,
                        pop15_data %>% select (country_code = iso2c, 
                                             pop_15 = `SP.POP.0014.TO.ZS`)) %>% 
              left_join(.,
                        pop65_data %>% select (country_code = iso2c, 
                                             pop = `SP.POP.65UP.TO.ZS`)) %>% 
  
              left_join(.,
                        cases_death %>% select (country_code, cumulative_deaths,
                                                fatality_rate, who_region)) %>% 
              ungroup () %>% 
              filter(!is.na(gdp) & !is.na(pop) & !is.na(fatality_rate)) %>% 
              # mutate (pop_frac = round((pop_15/pop),3)*100) %>%
              select (who_region, country, country_code, pop,
                      gdp, pop_15, fatality_rate) 

library("scales")
##### FONTS ##
library (showtext)
showtext_auto()

font_add_google("Barlow Condensed","barlow")

font_add_google("Special Elite", family = "special")

# font_add_google("Wingdings", family = "cambria")

font_add_google("Roboto", regular.wt = 300, family = "roboto")
font_add_google("Prata", family = "prata")

theme <-   theme_minimal(base_family = "roboto",
                         base_size = 50) +
        theme (plot.title = element_text(family = "barlow",
                                   size = 80,
                                   margin = unit(c(0, 0, 0.5, 0), "cm")),
         legend.title = element_text(family = "special", vjust = 0.5,
                                     margin = unit(c(-1.5, 0, 0, 0), "cm"),
                                     lineheight = 0.5),
         plot.subtitle = element_text(family = "barlow",
                                      size = 65,
                                      color = "#003f5c",
                                      lineheight = unit(0.25, "cm")),
         panel.grid = element_line(linewidth = 0.5),
         plot.caption = element_text(family = "special",
                                     face = "italic",
                                     size = 50),
         legend.position = "bottom")


corr_pos_cor <- cor.test(full_arch$pop, full_arch$gdp)
full_arch %>% 
ggplot (aes(x = pop,y = gdp)) +
  geom_point (aes(color = who_region), 
              size = 4, alpha = 0.4) +
  scale_y_continuous(labels = comma) +
  scale_color_manual(values = c("#003f5c",
                                "#424b80",
                                "#8b4c8c",
                                "#cb4b77",
                                "#ec644b",
                                "#e49500"),
                      guide = guide_legend(direction = "horizontal",
                                             title.position = "top",
                                             title.hjust = 0.5)) +
  labs (x = "% of population aged 65+ years",
        y = "GDP per Capita",
        color = "World Health Organization (WHO) Regional Classification",
        title = "Correlation between GDP/capita and % of Population 65+ years",
        subtitle = "As the share of population aged 65+ years increase in a country, 
        \nso also does the gross domestic product (GDP) per capita in the country",
        caption = "Data source: WorldBank (https://data.worldbank.org/)") +
  
  theme + theme (plot.subtitle = element_text(size = 60))


ggsave("images/pos_corr_plain.jpg", width = 13,
       height = 13, dpi = 250)



full_arch %>% 
  ggplot (aes(x = pop,y = gdp)) +
  geom_point (aes(color = who_region), 
              size = 4, alpha = 0.4) +
  geom_smooth(method='lm', formula= y~x, alpha = 0.2) +
  scale_y_continuous(labels = comma) +
  scale_color_manual(values = c("#003f5c",
                                "#424b80",
                                "#8b4c8c",
                                "#cb4b77",
                                "#ec644b",
                                "#e49500"),
                     guide = guide_legend(direction = "horizontal",
                                          title.position = "top",
                                          title.hjust = 0.5)) +
  labs (x = "% of population aged 65+ years",
        y = "GDP per Capita",
        color = "World Health Organization (WHO) Regional Classification",
        title = "Correlation between GDP/capita and % of Population 65+ years",
        subtitle = "As the share of population aged 65+ years increase in a country, 
        \nso also does the gross domestic product (GDP) per capita in the country",
        caption = "Data source: WorldBank (https://data.worldbank.org/)") +
  
  theme + theme (plot.subtitle = element_text(size = 60))


ggsave("images/pos_corr_line.jpg", width = 13,
       height = 13, dpi = 250)


full_arch %>% 
  ggplot (aes(x = pop,y = gdp)) +
  geom_point (aes(color = who_region), 
              size = 4, alpha = 0.4) +
  geom_text(x = 25, y = 100000, label = paste0("r=", round(corr_pos_cor$estimate, 2),
                                               "; p< .001"),
            family = "special", fontface = "italic", size = 15) +
  geom_smooth(method='lm', formula= y~x, alpha = 0.2) +
  scale_y_continuous(labels = comma) +
  scale_color_manual(values = c("#003f5c",
                                "#424b80",
                                "#8b4c8c",
                                "#cb4b77",
                                "#ec644b",
                                "#e49500"),
                     guide = guide_legend(direction = "horizontal",
                                          title.position = "top",
                                          title.hjust = 0.5)) +
  labs (x = "% of population aged 65+ years",
        y = "GDP per Capita",
        color = "World Health Organization (WHO) Regional Classification",
        title = "Correlation between GDP/capita and % of Population 65+ years",
        subtitle = "As the share of population aged 65+ years increase in a country, 
        \nso also does the gross domestic product (GDP) per capita in the country",
        caption = "Data source: WorldBank (https://data.worldbank.org/)") +
  
  theme + theme (plot.subtitle = element_text(size = 60))


ggsave("images/pos_corr_text.jpg", width = 13,
       height = 13, dpi = 250)

