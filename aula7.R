# Carregar pacotes
library(WDI)
library(tidyverse)

# Baixar os dados de 2022 para 10 países
df_cross <- WDI(
  country = c("BR", "US", "JP", "DE", "ZA", "CN", "IN", "RU", "FR", "MX"),
  indicator = c("NY.GDP.PCAP.CD", "SP.DYN.LE00.IN"),
  start = 2022,
  end = 2022
)

# Renomear colunas
df_cross <- df_cross %>%
  rename(
    pib_per_capita = NY.GDP.PCAP.CD,
    expectativa_vida = SP.DYN.LE00.IN
  )

# Remover valores faltantes
df_cross <- df_cross %>%
  filter(!is.na(pib_per_capita), !is.na(expectativa_vida))

# Gráfico de dispersão corrigido
ggplot(df_cross, aes(x = pib_per_capita, y = expectativa_vida)) +
  geom_point(color = "steelblue", size = 3) +
  geom_text(aes(label = country), 
            vjust = -0.7, hjust = 0.5, size = 3.5, check_overlap = TRUE) +
  scale_x_log10(labels = scales::comma_format()) +
  labs(
    title = "PIB per Capita vs Expectativa de Vida (2022)",
    subtitle = "10 países selecionados",
    x = "PIB per Capita (escala log, USD)",
    y = "Expectativa de Vida (anos)"
  ) +
  theme_minimal()

  
