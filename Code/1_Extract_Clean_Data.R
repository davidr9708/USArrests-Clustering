# 0. Load the required libraries
library(tidyverse)
library(rstatix)

# 1. Extract and clean
data(USArrests)
raw_data    <- USArrests[,1:4] ## Select relevant features
scaled_data <- scale(raw_data) ## Scale the data

## 1.1 Verify extreme outliers
    for (name in colnames(scaled_data)) {
        outliers <- raw_data %>% 
            identify_outliers(name)
       
        cat('Variable ', name, ':', '\n')
        cat("   No. extreme outliers:", length(outliers$outliersExtreme), "\n")
        cat("   No. outliers:", length(outliers$outliers), "\n")
        
    }

# 2 Save raw data
if (!file.exists("Results")) {
  # Create a new directory if it doesn't exist
  dir.create("Results")
  cat("Directory created successfully.\n")
} else {
  cat("Directory already exists.\n")
} # Verify the existence of the directory
save(raw_data, 
     file = 'Results/Raw_data.Rda'
) # To save as Rdata

save(scaled_data, 
     file = 'Results/scaled_data.Rda'
) # To save as Rdata

rm(list = ls())
