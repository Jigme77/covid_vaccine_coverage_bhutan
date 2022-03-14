library(tidyverse)
library(showtext)

d <- read.table("vaccines.txt", header = TRUE)
str(d)

g <- ggplot(d, aes(x = days, y = cum_percent))
g + geom_point(color = "firebrick", shape = "diamond", size = 3) + 
  geom_line(color = "firebrick", linetype = "dotted", size = .6) +
  labs(x = "Duration (days)", y = "Coverage (%)",
       title = "Covid-19 Vaccination Coverage in Bhutan", 
       subtitle = "Children (5 to 11 years)",
       caption = "Data: Ministry of Health (MoH)") + 
  theme_bw() +
  theme(axis.title.x = element_text(vjust = 0, size = 15, face = "bold"),
        axis.title.y = element_text(vjust = 1, size = 15, face = "bold"),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 14, face = "italic"),
        plot.caption = element_text(hjust = 0),
        panel.grid.minor = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()) +
  geom_text(aes(label = cum_percent), hjust = .5, vjust = -.5, color = "deepskyblue4", fontface = "bold") +
  geom_text(aes(x = 2.5, y = 82,
                label = "More than 80 % of the children were \nvacinnated by Day 4")) +
  geom_curve(aes(x = 3, y = 85, xend = 4, yend = 88),
             curvature = -0.9, angle = 50,
             color = "darkgoldenrod1", size = 1,
             arrow = arrow(length = unit(0.03, "npc"),
                           type = "closed")) +
  geom_text(aes(x = 5, y = 50,
                label = "Bhutan is among few countries in the world to have \n vaccinated more than 97% of its eligible population "),
            family = "lobster")


