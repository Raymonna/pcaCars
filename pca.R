pcaCars<-princomp(mtcars,cor=TRUE)
plot(pcaCars)
require(ggplot2)
require(ggrepel)
carsHC <- hclust(dist(pcaCars$scores), method = "ward.D2")
plot(carsHC)
carsClusters <- cutree(carsHC, k = 3)
carsDf <- data.frame(pcaCars$scores, "cluster" = factor(carsClusters))
carsDf
str(carsDf)
ggplot(carsDf,aes(x=Comp.1, y=Comp.2)) +
  theme_classic() +
  geom_hline(yintercept = 0, color = "gray70") +
  geom_vline(xintercept = 0, color = "gray70") +
  geom_point(aes(color = cluster), alpha = 0.55, size = 3) +
  xlab("PC1") +
  ylab("PC2") + 
  xlim(-5, 6) + 
  ggtitle("PCA plot of Cars")+
  geom_text_repel(aes(label = rownames(carsDf))) 
