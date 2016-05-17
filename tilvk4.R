#tehtävä 1

png(filename="vk4t1.png")
p <- 0.2
plot(seq(1,5), c(p,p,p,p,p), main="Diskreetin tasaisenjakauman pistetodennäköisyysfunktio, n = 5", xlab="y", ylab="p", type="hist")
dev.off()