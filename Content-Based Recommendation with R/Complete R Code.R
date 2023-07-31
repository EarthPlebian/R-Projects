library(data.table)
wine.data <-fread('https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data')
head(wine.data)

table(wine.data$V1)

wine.type <- wine.data[,1]
wine.features <- wine.data[,-1]

wine.features.scaled <- data.frame(scale(wine.features))
wine.mat <- data.matrix(wine.features.scaled)

rownames(wine.mat) <- seq(1:dim(wine.features.scaled)[1])
wine.mat[1:2,]

wine.mat <- t(wine.mat)
cor.matrix <- cor(wine.mat, use = "pairwise.complete.obs", method ="pearson")
dim(cor.matrix)
cor.matrix[1:5,1:5]

user.view <- wine.features.scaled[3,]
user.view

sim.items <- cor.matrix[3,]
sim.items

sim.items.sorted <- sort(sim.items, decreasing = TRUE)
sim.items.sorted[1:5]

rbind(wine.data[3,], wine.data[52,], wine.data[51,], wine.data[85,], wine.data[15,])