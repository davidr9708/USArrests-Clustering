# Load data
load(raw_data, file = 'Results/Results.Rdata')

# Apply ANOVA
## Verify assumptions
### Outliers
raw_data %>% 
  group_by(cluster) %>%
  identify_outliers(UrbanPop)

### Normality
#### For all the data
model  <- lm(UrbanPop ~ cluster, data = raw_data) # Build the linear model
ggqqplot(residuals(model)) # Create a QQ plot of residuals
shapiro_test(residuals(model)) # Test normality

#### For each cluster
raw_data %>%
  group_by(cluster) %>%
  shapiro_test(UrbanPop)

## ANOVA test
raw_data %>%
anova_test(UrbanPop ~ cluster)


### Pairwise comparison
tukey_hsd(UrbanPop ~ cluster)
