# libraries
library(tidyverse)
library(ggrepel)

# custom colors

## dubois colors
red = "#dc354a"
yellow = "#ecb025"
blue = "#213772"

## palette
pal = MetBrewer::met.brewer(name = "Juarez")


# custom theme
theme_nice = function() {
  theme_minimal(base_family = "Overpass Light", base_size = 14) +
    theme(panel.grid.minor = element_blank(),
          plot.title = element_text(family = "Overpass", face = "bold"),
          axis.title = element_text(family = "Overpass Medium"),
          axis.title.x = element_text(hjust = 0),
          axis.title.y = element_text(hjust = 1),
          strip.text = element_text(
            family = "Overpass ExtraBold", face = "plain",
            size = rel(1), hjust = 0),
          strip.background = element_rect(fill = "grey90", color = NA))
}

theme_set(theme_nice())


# label fonts
update_geom_defaults("label", list(family = "Fira Sans"))
update_geom_defaults("label_repel", list(family = "Fira Sans"))