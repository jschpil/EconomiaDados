# Pacotes
library(WDI)
library(tidyverse)

# Buscar o PIB per capita em 2022 (indicator: "NY.GDP.PCAP.CD")
pib_df <- WDI(
  country = c("BR", "US", "JP", "DE", "ZA", "CN", "RU", "IN", "MX", "FR"),
  indicator = "NY.GDP.PCAP.CD",
  start = 2022,
  end = 2022
)

# Renomear a coluna
pib_df <- pib_df %>%
  rename(pib_per_capita = NY.GDP.PCAP.CD)

# Gráfico de barras
ggplot(pib_df, aes(x = reorder(country, pib_per_capita), y = pib_per_capita, fill = country)) +
  geom_col(show.legend = FALSE) +
  coord_flip() +
  labs(
    title = "PIB per Capita (USD) - 2022",
    x = "País",
    y = "PIB per Capita"
  ) +
  theme_minimal()

    
    