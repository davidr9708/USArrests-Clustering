# 0. Library
library(ggpubr)

# 1. Load data
load(file = 'Results/Results.Rda')

# 2. Apply ANOVA
## 2.1 Verify assumptions
### 2.1.1 Outliers
    outliers <- raw_data %>% 
        group_by(cluster) %>%
        identify_outliers(UrbanPop)
    
    
    cat('UrbanPop: ', '\n')
    cat("   No. extreme outliers:", length(outliers$outliersExtreme), "\n")
    cat("   No. outliers:", length(outliers$outliers), "\n")

### 2.2 Normality
#### 2.2.1 For all the data
    model  <- lm(UrbanPop ~ cluster, data = raw_data) # Build the linear model
    ggqqplot(residuals(model)) # Create a QQ plot of residuals
    shapiro_test(residuals(model)) # Test normality

#### 2.2.2 For each cluster
    raw_data %>%
        group_by(cluster) %>%
        shapiro_test(UrbanPop)

## 3. ANOVA test
    raw_data %>%
        anova_test(UrbanPop ~ cluster)

### 4. Pairwise comparison
    tukey_hsd(aov(UrbanPop ~ cluster, data = raw_data))


rm(list = ls())
    