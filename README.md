## Multidrug Antibiotic Resistance Analysis

This repository contains a reproducible workflow for cleaning, augmenting, and analyzing a multidrug-resistant bacteria dataset.

Dataset: Multi-Resistance Antibiotic Susceptibility Dataset (Kaggle)

All scripts are written in R and produce cleaned datasets, augmented datasets, visualizations, and linear model analyses.

## Workflow Overview
### 01 — Load Data

* Creates data and results directories.

* Downloads the dataset using RKaggle.

* Saves raw CSV: data/_raw/Bacteria_dataset_Multiresistance.csv.


### 02 — Clean Data

* Standardizes NA values.

* Removes unused metadata columns.

* Splits age.gender into Age and Gender.

* Extracts species names from Souches.

* Corrects typos and inconsistent bacterial species names.

* Normalizes categorical values (Diabetes, Hypertension).

* Cleans resistance columns with fix_resistance().

### Output: 02_dat_clean.csv


### 03 — Augment Data

* Adds full antibiotic names and classes.

* Converts dataset to long format for analysis.

Computes a continuous MDR score:

* Resistant (R) = 1

* Intermediate (I) = 0.5

* Susceptible (S) = 0

* Converts categorical variables to factors.

* Creates 10-year age bins.

#### Outputs:

* 03_dat_aug_long.csv

* 03_dat_aug_wide.csv


### 04 — Describe Data

Exploratory data analysis (EDA):

* Patient characteristics by species (HTML table via table1)

* Age & gender distribution

* Species frequency

* Clinical characteristics: diabetes, hypertension, prior hospitalization

* Antibiotic resistance profiles

* Figures saved: results/images/


### 05 — Linear Model: MDR

Model: MDR ~ Age + Gender + Species + Diabetes + Hypertension + Hospital_before + Infection_Freq

#### Key findings:

* Bacterial species are the strongest predictors of MDR.

* Klebsiella pneumoniae and Escherichia coli have higher MDR.

* Patient characteristics (age, diabetes, hypertension) have negligible effect.

* Prior hospitalization is not predictive.

#### Outputs:

* Forest plot (05_MDR_forest.png)

* Volcano plot (05_MDR_volcano.png)


### 06 — Linear Models: Infection Frequency

* Three models explore associations between infection frequency and:

* Patient characteristics

* Bacterial species

* MDR score

* Includes a full multivariable model combining all factors.

#### Outputs:

* Coefficients table

* Forest plot (06_inf_freq_forest.png)

* Volcano plot (06_inf_freq_volcano.png)


### 07 — Heatmap

* Visualizes resistance patterns of bacterial species to antibiotics.

* Binary resistant variable (R = TRUE) computed per species-antibiotic pair.

* Color gradient: blue = low resistance, white = intermediate, red = high resistance.

* Highlights species with highest resistance, susceptibility, or intermediate responses.

#### Output:

Heatmap (07_heatmap.png)


### 08 — PCA: Antibiotic Resistance Patterns

* Performs Principal Component Analysis (PCA) on numeric resistance profiles.

* Reveals major axes of variation in multidrug resistance.

* Downsamples species to balance representation and avoid dominance by E. coli.

* Visualizes clustering patterns by species.

#### Outputs:

* PCA of all isolates (08_PCA_all.png)

* PCA of downsampled balanced dataset (08_PCA_downsampling.png)


## Notes

* All scripts are written in R and use tidyverse conventions.

* Functions like fix_resistance(), count_resistance(), and plot_bar() are defined in R/99_proj_func.R.

* Continuous MDR score allows quantitative analysis of multidrug resistance across species and patients.
