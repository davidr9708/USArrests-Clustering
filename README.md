# USArrests Clustering

## Table of Contents
- [1. Hypothetical Scenario](Question)
- [2. Question](Question) 
- [3. Analysis](Analysis) 
- [4. Results and interpretation](Results) 
- [5. Next steps](Next) 
- [6. Limitations](Limitations)
- [7. Warning](Warning) 

## 1. Hypothetical Scenario
Governmental authorities desires to reduce crime rates in their states, however, they need to identify these states in three groups to know how to approach to each them. 

## 2. Question
How can we classify the US states based on the crime rates (assault, rape, and murder) and the proportion of urban population?

## 3. Analysis
## 3.1 Data
[USArrests dataset](https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/USArrests) found in R
## 3.2 Classification
Used a k-means clustering to identify the three relevant clusters. I proposed only three clusters because that's what fits the stakeholder's need.
## 3.3 Comparison
To improve the interpretation, I ran an ANOVA and Pairwise comparison testing the difference among the urban population among the clusters

## 4. Results and interpretation
The clusters found can be classified as:
- Low crime rates
- Medium crime rates
- High crime rates

The **low crime rates cluster** was the only one with a lower mean percentage of urban population, the possible hypotheses might be: 
- There is an underreporting about the crime cases in rural states, which might explain why they got the lowest crime rates.
- Urbanization is associated with higher crime rates due to the challenges that its life style carries.

## 5. Next steps
- Assess whether the reporting process in the **low crime rates cluster** generates understimated crime rates, and fix it if it does.
- Run a further analysis to identify why the **high crime rates cluster** has higher crime rates, this will help to identify the causes of the problem and invest effectively the public resources in programs that will solve the problematic.

## 6. Limitations
- Survival bias: The analysis didn't analyse trends, only one snapshot at the time.

## 7. Warning
The scenario proposed is hypothetical, designed to develop analytical skills applied in a real scenario.
