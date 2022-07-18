par(mfrow = c(2,2))

?rpois

graph1 <- rpois(n = 1000, lambda = 1)
graph2 <- rpois(n = 10000, lambda = 10)
graph3 <- rpois(n = 100000, lambda = 100)
graph4 <- rpois(n = 1000000, lambda = 500)

hist(graph1)
hist(graph2)
hist(graph3)
hist(graph4)