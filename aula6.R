install.packages("WDI")
library(WDI)# CARREGAR A BIBLIOTECA/PACOTE

options(scipen = 999) # AJUSTA A NOT. CIENT.

# DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')
# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD',
                    start = 2023, end = 2023)
# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')
#FAZER GRÁFICOS
# GGPLOT2
install.packages("tidyverse")
library(tidyverse)

#DADOS EM PAINEL

grafpainel <- ggplot(dadospib,
                     mapping = aes(x=year,
                                   y= NY.GDP.MKTP.CD))+
  geom_point()

print(grafpainel)

grafcorte <- ggplot(dadospib2023,
                     mapping = aes(x=year,
                                   y= NY.GDP.MKTP.CD))+
  geom_point()

print(grafcorte)

grafserie <- ggplot(dadospibbr,
                    mapping = aes(x=year,
                                  y= NY.GDP.MKTP.CD))+
  geom_point()

print(grafserie)

dadosmortes <- WDI(country = 'all',
                   indicator = 'SH.DTH.INJR.ZS',
                   start = 2018, end = 2019)


grafmortes <- ggplot(dadosmortes,
                     mapping = aes(x=	year,
                                   y= SH.DTH.INJR.ZS))+

  geom_point()

print(grafmortes)   

