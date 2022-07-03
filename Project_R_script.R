#Set the working directory
setwd("/Users/AYANO TEMITOPE/Downloads/HackBio_Project")
getwd()

#Read the eigenvec(coordinate) file as pca1
pca1 <- read.table("plink.eigenvec.txt",sep=" ",header=F)

#Read the 1000 genome sample list 
sample_list <- read.table("complete_1000_genomes_sample_list_.tsv.txt", sep = "\t", header = T)

#merge the pca1 data with the sample list on V2 and sample.namerespectively
merged_data <- merge(x = pca1, y = sample_list, by.x = "V2", by.y = "Sample.name", all = F)

#View the merged_data1.
head(merged_data)


#Plot the PCs
#Load the plot package(ggplot2)
library(ggplot2)

#PC1 and PC2
ggplot(data=merged_data, aes(V3, V4, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 1") + theme_light() + xlab(paste0("PC1 (", signif(pve$V1[1], 3), "%)")) + ylab(paste0("PC2 (", signif(pve$V1[2], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold"))
#Saving the plot
ggsave("PCA1_1.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

#PC2 and PC3
ggplot(data=merged_data, aes(V4, V5, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 2") + theme_light() + xlab(paste0("PC2 (", signif(pve$V1[2], 3), "%)")) + ylab(paste0("PC3 (", signif(pve$V1[3], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold"))
#Saving the plot
ggsave("PCA1_2.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

#PC3 and PC4
ggplot(data=merged_data, aes(V5, V6, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 3") + theme_light() + xlab(paste0("PC3 (", signif(pve$V1[3], 3), "%)")) + ylab(paste0("PC4 (", signif(pve$V1[4], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold"))
#Saving the plot
ggsave("PCA1_3.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

#PC4 and PC5
ggplot(data=merged_data, aes(V6, V7, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 4") + theme_light() + xlab(paste0("PC4 (", signif(pve$V1[4], 3), "%)")) + ylab(paste0("PC5 (", signif(pve$V1[5], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold"))
#Saving the plot
ggsave("PCA1_4.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

#PC5 and PC6
ggplot(data=merged_data, aes(V7, V8, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 5") + theme_light() + xlab(paste0("PC5 (", signif(pve$V1[5], 3), "%)")) + ylab(paste0("PC6 (", signif(pve$V1[6], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold"))
#Saving the plot
ggsave("PCA1_5.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)
#PC6 and PC7

ggplot(data=merged_data, aes(V8, V9, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 6")+ theme_light() + xlab(paste0("PC6 (", signif(pve$V1[6], 3), "%)")) + ylab(paste0("PC7 (", signif(pve$V1[7], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold"))
#Saving the plot
ggsave("PCA1_6.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

#PC7 and PC8
ggplot(data=merged_data, aes(V9, V10, color = Superpopulation.code, shape = Sex)) + geom_point(size = 3.0) + labs(title = "Principal Component Analysis 7") + theme_light() + xlab(paste0("PC7 (", signif(pve$V1[7], 3), "%)")) + ylab(paste0("PC8 (", signif(pve$V1[8], 3), "%)")) + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold")) 
#Saving the plot
ggsave("PCA1_7.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

#Read the eigenval as pca2
pca2 <- read.table("plink.eigenval.txt",sep=" ",header=F)
head(pca2)


#Calculation
pve <- data.frame(PC = 1:20, pve = pca2/sum(pca2)*100)
pve
ggplot(pve, aes(x = PC, y = V1)) + geom_bar(stat = "identity") + xlab("Principal Component") + ylab("Percentage Variance Explained") + theme_light() + theme(plot.title = element_text(color="red3", size=15, face="bold.italic"), axis.title.x = element_text(color="blue", size=14, face="bold"), axis.title.y = element_text(color="blue", size=14, face="bold")) + labs(title = "Percentage Variance Explained")
ggsave("PVE.png", path = "/Users/AYANO TEMITOPE/Downloads/HackBio_Project", width = 10, height = 10, units = "in", limitsize = FALSE, dpi = 300)

# calculate the cumulative sum of the percentage variance explained
cumsum(pve$V1)


