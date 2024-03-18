here::i_am("code/makefigure.R")

library(readxl)

data <-read_excel("~/data550/cptcodes.xlsx")


library(ggplot2)

scatterplot <- 
  ggplot(data, aes(x = medicaid, y = medicare)) +
  geom_point() +
  geom_smooth(method = lm) +
  theme_bw()

ggsave(
  here::here("output/scatterplot.png"),
  plot = scatterplot,
  device = "png"
)
