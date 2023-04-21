# Load the required libraries
library(tidyverse)
library(cluster) # For k-means clustering
library(factoextra) # For visualizations
library(ggrepel)

# Extract and clean
data(USArrests)
raw_data    <- USArrests[,c(1,2,4)] ## Select relevant features
scaled_data <- scale(raw_data) ## Scale the data

# Verify extreme outliers
raw_data %>% 
  identify_outliers(c(Rape, Assault))
# Apply k-means clustering
k_clusters <- 3 # Number of clusters
kmeans_result <- kmeans(scaled_data                , 
                        algorithm = "Hartigan-Wong",
                        centers   = k_clusters     , 
                        nstart    = 1000
                        ) # K-means clustering  


raw_data$cluster <- as.factor(kmeans_result$cluster) # Add the cluster label

# Visualize clusters
## Graph
fviz_cluster(kmeans_result, 
             data = scaled_data,
             geom = "point",
             ellipse.type = "norm",
             stand = FALSE,
             ellipse.level = 0.95, 
             show.clust.cent = TRUE
             ) + 
  theme(panel.background = element_blank()
        ) +
  geom_text_repel(aes(color = cluster, 
                      label = row.names(scaled_data)), 
                  size = 3, 
                  show.legend = FALSE)

## Dataset
aggregate(x  = USArrests, 
          by = list(cluster = kmeans_result$cluster
                    ), 
          FUN = mean
          ) 

# Export data
save(raw_data, file = 'Results/Results.Rdata')

# Exporting the data to visualize in tableau
write.csv(file ='Clustering_result.csv',  raw_data)



# Interpretation
## 3 clusters: High, medium, and low rates
## Urban variable presents a different behavior
### Medium urban pop have the highest rates, followed by the Highest and lowest urban pop

## Questions wondered
### Is there an under report about the crimes in the rural area and the crimes decrease when the urban pop increases?
### These crimes are related to urbanization but high urbanized areas has been able to overcome those ones
### but those in development still needs assistance to overcome them?