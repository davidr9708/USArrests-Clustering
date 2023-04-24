# 0. Load the required libraries
library(pacman)

p_load(tidyverse, 
       cluster, 
       factoextra,
       ggrepel,
       rstatix
       )

# 1. Extract and clean
data(USArrests)
raw_data    <- USArrests[,1:4] ## Select relevant features
scaled_data <- scale(raw_data) ## Scale the data

# 2. Analysis
## 2.1 Verify extreme outliers
    for (name in colnames(scaled_data)) {
        outliers <- raw_data %>% 
            identify_outliers(name)
       
        cat('Variable ', name, ':', '\n')
        cat("   No. extreme outliers:", length(outliers$outliersExtreme), "\n")
        cat("   No. outliers:", length(outliers$outliers), "\n")
        
    }

## 2.2 Apply k-means clustering
    k_clusters <- 3 # Number of clusters
    kmeans_result <- kmeans(scaled_data                , 
                            algorithm = "Hartigan-Wong",
                            centers   = k_clusters     , 
                            nstart    = 1000
                            ) # K-means clustering  
    
    
    raw_data$cluster <- as.factor(kmeans_result$cluster) # Add the cluster label

## 2.3 Visualize clusters
    fviz_cluster(kmeans_result, 
                 data = scaled_data,
                 geom = "point",
                 ellipse.type = "norm",
                 stand = FALSE,
                 ellipse.level = 0.95, 
                 show.clust.cent = TRUE
                 ) +
    geom_text_repel(aes(color = cluster, 
                        label = row.names(scaled_data)
                        ), 
                    size = 3, 
                    show.legend = FALSE
                    ) + 
    theme(panel.background = element_blank()
    ) ## Graph Principal component analysis of the clusters

    
    aggregate(x  = USArrests, 
              by = list(cluster = kmeans_result$cluster
                        ), 
              FUN = mean
              ) ## Show the the means of each cluster

# 3. Export data
if (!file.exists("Results")) {
  # Create a new directory if it doesn't exist
  dir.create("Results")
  cat("Directory created successfully.\n")
} else {
  cat("Directory already exists.\n")
} # Verify the existence of the directory
    
save(raw_data, 
     file = 'Results/Results.Rdata'
     ) # To save as Rdata

write.csv(raw_data,
          file ='Clustering_result.csv'
          ) # Exporting the data to visualize in tableau


# Interpretation
## 3 clusters: High, medium, and low rates
## Urban variable presents a different behavior
### Medium urban pop have the highest rates, followed by the Highest and lowest urban pop

## Questions wondered
### Is there an under report about the crimes in the rural area and the crimes decrease when the urban pop increases?
### These crimes are related to urbanization but high urbanized areas has been able to overcome those ones
### but those in development still needs assistance to overcome them?