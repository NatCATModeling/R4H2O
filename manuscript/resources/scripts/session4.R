## Visualisations for session 4

## Themes
library(gridExtra)
p <- ggplot(gormsey, aes(Measure)) + geom_bar()
a <- p + theme_classic(base_size = 22)+ ggtitle("theme_clasic()")
b <- a + theme_bw(base_size = 22) + ggtitle("theme_bw()")
c <- a + theme_dark(base_size = 22) + ggtitle("theme_dark()")
d <- a + theme_void(base_size = 22) + ggtitle("theme_void()")

png("manuscript/resources/session4/themes.png", width = 1024, height = 1024)
grid.arrange(a, b, c, d)
dev.off()
