# Multidrug Antibiotic Resistance Analysis

This repository contains a full reproducible workflow for cleaning, augmenting, and analyzing a multidrug-resistant bacteria dataset.  
The dataset comes from Kaggle:  
[Multi-Resistance Antibiotic Susceptibility Dataset](https://www.kaggle.com/datasets/adilimadeddinehosni/multi-resistance-antibiotic-susceptibility/data)

All scripts are written in **R**, structured into modular steps, and produce cleaned datasets, augmented datasets, exploratory visualizations, and linear model analyses.

## Workflow Overview

### 01 — Load
- Creates `/data` and `/results` directories.
- Downloads the Kaggle dataset using **RKaggle**.
- Saves raw CSV to `data/_raw/Bacteria_dataset_Multiresistance.csv`.

### 02 — Clean
- Standardizes NA values.
- Removes unused metadata columns.
- Splits `age.gender` into `Age` and `Gender`.
- Extracts species names from `Souches`.
- Fixes typos and inconsistent bacterial species names.
- Normalizes categorical values (e.g., Diabetes, Hypertension).
- Cleans resistance columns using custom `fix_resistance()`.

Output: **02_dat_clean.csv**

### 03 — Augment
- Adds full antibiotic names and classes.
- Converts dataset to long format (`pivot_longer()`) for analysis.
- Creates a continuous **MDR score**:
  - Resistant = 1
  - Intermediate = 0.5
  - Susceptible = 0
- Converts categorical variables to factors.
- Groups age into 10-year bins.

Outputs:
- **03_dat_aug_long.csv**
- **03_dat_aug_wide.csv**

### 04 — Describe
Exploratory data analysis:
- Sample characteristics by species (HTML table via `table1`)
- Age & gender distribution
- Species frequency
- Clinical characteristics: diabetes, hypertension, hospital history
- Antibiotic resistance profiles

Figures saved to `results/images/`.

### 05 — Linear Model (MDR)
Linear regression: MDR ~ Age + Gender + Species + Diabetes + Hypertension + Hospital_before + Infection_Freq

Key findings:
- **Species** are the strongest predictors of MDR.
- *Klebsiella pneumoniae* and *E. coli* have higher MDR.
- Patient characteristics show negligible effect.
- Prior hospitalization does not predict MDR.

Outputs:
- Forest plot
- Volcano plot  
Saved in `results/images/`.

### 06 — Linear Models (Infection Frequency)
Three models test associations between infection frequency and:
1. Patient characteristics
2. Bacterial species
3. MDR score  

Also includes a full multivariable model.  
Outputs:
- Coefficients table
- Forest plot  
Saved to `results/images/`.


## How to Run the Project



