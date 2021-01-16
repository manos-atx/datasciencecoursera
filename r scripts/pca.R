
rm(list = ls())
par(mfrow = c(1,1))

set.seed(12345)
dataMatrix <- matrix(rnorm(400), nrow = 40) # a random normal 40-by-10 data matrix

heatmap(dataMatrix)

set.seed(678910)

#for each row
for (i in 1:40) {
  #flip a coin
  coinFlip <- rbinom(1, size = 1, prob = 0.5)
  #if coin is heads add a common pattern to that row
  if (coinFlip) {
    dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3), each = 5)
  }
}

heatmap(dataMatrix)

par(mar = rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])

hh <- hclust(dist(dataMatrix)) # dist() computes the distances between the rows of a data matrix (observations)
dataMatrixOrdered <- dataMatrix[hh$order,] # order the rows according to hierarchical clustering
heatmap(dataMatrixOrdered)

par(mfrow = c(1, 3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)

svd1 <- svd(scale(dataMatrixOrdered)) # a list of three matrices
par(mfrow = c(1,3))
image(t(dataMatrixOrdered)[,nrow(dataMatrixOrdered):1])
plot(svd1$u[,1], 40:1, xlab = "Row", ylab = "First left singular vector", pch = 19)
plot(svd1$v[,1], xlab = "Column", ylab = "First right singular vector", pch = 19)

par(mar = c(5.1, 4.1, 4.1, 2.1))
par(mfrow = c(1,2))
plot(svd1$d, xlab = "Column", ylab = "Singular value", pch = 19)
plot(svd1$d^2/sum(svd1$d^2), xlab = "Column", ylab = "Proportion of variance explained", pch = 19)

svd1 <- svd(scale(dataMatrixOrdered)) # a list of three matrices
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE) # a list of three matrices
par(mfrow = c(1,1))
plot(pca1$rotation[,1], svd1$v[,1], xlab = "Principal component 1", ylab = "Singular vector 1", pch = 19)
abline(c(0,1))


