## Histogram
turbidity <- read.csv("casestudy1/turbidity_laanecoorie.csv")
b <- max(turbidity$Result) / 0.1
png("manuscript/resources/session3/histogram.png")
hist(turbidity$Result, breaks = b, main = "Turbidity Results")
dev.off()

## Boxplot example
set.seed(1234)
d <- c(rnorm(120, 10, 2),
       rep(3, 10))
s <- boxplot(d, plot = FALSE)

png("manuscript/resources/session3/boxplot-example.png", width = 1024, height = 1024)
par(mar = rep(0, 4))
boxplot(d, axes = FALSE, col = "dodgerblue", border = "darkblue", lwd = 2)
par(cex = 2)
text(1.4, min(d), "Outlier (min)")
text(1.4, s$stats[1], "Lower IQR")
text(1.4, s$stats[5], "Upper IQR")
text(1.4, quantile(d, 0.25), "First Quartile")
text(1.4, median(d), "Median")
text(1.4, quantile(d, 0.75), "Third Quartile")
text(1.4, 14.83, "Outlier")
text(1.4, max(d), "Outlier (max)")
dev.off()

## Turbidity results
png("manuscript/resources/session3/boxplot-zones.png", width = 2400, height = 1800)
par(cex = 4)
boxplot(Result ~ Zone, data = turbidity, col = "lightblue",
        main = "Turbidity Results Laanecoorie water system",
        ylab = "Turbidity (NTU)", 
        cex = 1, pch = 19)
dev.off()
