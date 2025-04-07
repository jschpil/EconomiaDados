# Instalar os pacotes se ainda não estiverem instalados
if (!require(WDI)) install.packages("WDI")
if (!require(tidyverse)) install.packages("tidyverse")

# Carregar os pacotes
library(WDI)
library(tidyverse)

# Buscar dados de expectativa de vida (indicator: "SP.DYN.LE00.IN") de 2000 a 2022
vida_df <- WDI(
  country = c("BR", "US", "JP", "DE", "ZA"),  # Brasil, EUA, Japão, Alemanha, África do Sul
  indicator = "SP.DYN.LE00.IN",
  start = 2000,
  end = 2022
)

# Renomear a coluna do indicador
vida_df <- vida_df %>%
  rename(expectativa_vida = SP.DYN.LE00.IN)

# Remover valores faltantes
vida_df <- vida_df %>%
  filter(!is.na(expectativa_vida))

# Visualizar a expectativa de vida ao longo do tempo
ggplot(vida_df, aes(x = year, y = expectativa_vida, color = country)) +
  geom_line(size = 1.2) +
  labs(
    title = "Expectativa de Vida ao Nascer (2000-2022)",
    x = "Ano",
    y = "Expectativa de Vida (anos)",
    color = "País"
  ) +
  theme_minimal()
