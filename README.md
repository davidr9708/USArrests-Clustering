# USArrests-Clustering
# Alone: Survival Analysis

| Table of Contents    |
| ---------------------|  
| [1. Question](Question) |
| [2. Purpose](Purpose) |

# 1. Hypothetical Scenario:
Governmental authorities desires to reduce crime rates in their states, however, they need to identify these states in three groups to  

# 2. Question:
How can we classify the US states based on the crime rates (assault, rape, and murder) and the proportion of urban population?

# 3. Analysis
## 3.1 Data
[USArrests dataset](https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/USArrests) found in R
## 3.2 Classification
Used a k-means clustering to identify the three relevant clusters. I proposed only three clusters because that's what fits the stakeholder's need.
## 3.3 Comparison
To improve the interpretation, I ran an ANOVA and Pairwise comparison testing the difference among the urban population among the clusters

# 4. Results
The clusters found can be classified as:
- Low crime rates
- Medium crime rates
- High crime rates

Something to highlight is **low crime rates cluster** was the only one with a lower mean percentage of urban population, the possible hypotheses might be: 
- There is an underreporting about the crime cases in rural states, which might explain why they got the lowest crime rates.
- Urbanization is associated with higher crime rates due to the challenges that its life style carries.

# 5. Conclusion and next steps


# 6. Limitations

# 7. Warning:
The scenario proposed is hypothetical, designed to develop analytical skills applied in a real scenario.
