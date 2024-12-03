library(pheatmap)
library(COR)
library(reshape2)
library(ggplot2)
library(tidyverse)
library(corrplot)

data <- read_csv("data/cancer_dataset_cleaned.csv")
# View(data)
dim(data)

str(data)

data$diagnosis <- as.numeric(as.factor(data$diagnosis))
# View(data)
numeric_data<-data[sapply(data,is.numeric)]
coorelation_matrix<- cor(data, use = "complete.obs")
coorelation_matrix
# corrplot(coorelation_matrix,method="circle")


pheatmap(coorelation_matrix, 
         cluster_rows = FALSE, 
         cluster_cols = FALSE,
         color = colorRampPalette(c("blue", "white", "red"))(50),
         display_numbers = TRUE)

column <- "diagnosis"
cor_values <- coorelation_matrix[,column]
cor_values <- cor_values[names(cor_values)!=column]

top_5 <- sort(cor_values,decreasing = TRUE)[1:5]
top_5

