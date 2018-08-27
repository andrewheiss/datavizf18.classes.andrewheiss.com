library(tidyverse)
library(gapminder)
library(viridisLite)

plasma_hex <- viridis(6, option = "plasma", end = 0.95, direction = 1) %>% 
  str_sub(1, 7)

palette <- tribble(
  ~my_name, ~text_color, ~fancy_name,
  "blue", "white", "Ultramarine",
  "purple", "white", "Purple",
  "magenta", "white", "Medium\nViolet Red",
  "pink", "white", "Mandy",
  "orange", "white", "West Side",
  "yellow", "grey30", "Turbo"
) %>% 
  mutate(hex = plasma_hex) %>% 
  mutate(row = rep(2:1, each = 3),
         column = rep(1:3, times = 2),
         fancy_name_upper = str_to_upper(fancy_name))

ggplot(palette, aes(x = column, y = row)) +
  geom_tile(aes(fill = plasma_hex), width = 0.85, height = 0.85) +
  geom_text(aes(label = fancy_name_upper, color = text_color),
            family = "Oswald SemiBold", size = 8,
            nudge_y = 0.25, vjust = "top") +
  geom_text(aes(label = hex, color = text_color),
            family = "Oswald Light", size = 5,
            nudge_y = -0.25) +
  scale_fill_identity() +
  scale_color_identity() +
  theme_void()

gm_df <- gapminder %>% 
  filter(year == 2007) %>% 
  mutate(continent = ifelse(country == "India", "India", as.character(continent)))

plot_health_wealth <- ggplot(gm_df, aes(x = gdpPercap, y = lifeExp, 
                                        fill = continent, size = pop)) +
  geom_point(pch = 21, color = "white", stroke = 2) +
  scale_x_log10() +
  scale_fill_viridis_d(option = "plasma", guide = FALSE, end = 0.95, direction = 1) +
  scale_size(range = c(0.75, 20), guide = FALSE) + 
  theme_void()
plot_health_wealth

ggsave(plot_health_wealth, filename = "~/Desktop/health_wealth.pdf", 
       width = 4, height = 3, device = cairo_pdf)
