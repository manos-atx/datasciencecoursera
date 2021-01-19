
cM <- matrix(rep(c(0,1), each = 200), byrow = FALSE, nrow = 40)
View(cM)
heatmap(cM)
svdCm <- svd(cM)
View(svdCm$u)
View(svdCm$d)
View(svdCm$v)

pcacM <- prcomp(cM)
View(pcacM$x)

kmcM <- kmeans(cM, centers = 2)
View(kmcM$cluster)

hclucM <- hclust(dist(cM))

# SVD <- X = UDV^T U for row analysis and V for column analysis
# D for proportion of variance explained
# dimension analysis X(rows,columns) = U(rows,rows) %*% D(rows,rows) %*% V(columns,rows)
# U <- for a column each element refers to a row
# V <- for a row each element refers to a row
